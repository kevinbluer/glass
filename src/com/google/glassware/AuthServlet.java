/*
 * Copyright (C) 2012 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.google.glassware;

import com.google.api.client.auth.oauth2.AuthorizationCodeFlow;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.GenericUrl;
import com.google.api.services.glass.model.Entity;
import com.google.common.collect.Lists;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

public class AuthServlet extends HttpServlet {
    private static final Logger LOG = Logger.getLogger(AuthServlet.class.getSimpleName());


    @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
    // If something went wrong, log the error message.
    if (req.getParameter("error") != null) {
      showError(res, req.getParameter("error"));
      return;
    }

    // If we have a code, finish the OAuth 2.0 dance
    if (req.getParameter("code") != null) {
      AuthorizationCodeFlow flow = AuthUtil.newAuthorizationCodeFlow();
      TokenResponse tokenResponse = flow.newTokenRequest(req.getParameter("code"))
          .setRedirectUri(WebUtil.buildUrl(req, "/oauth2callback")).execute();

      // Extract the Google User ID from the ID token in the auth response
      String userId = ((GoogleTokenResponse) tokenResponse).parseIdToken().getPayload().getUserId();
      // Set it into the session
      AuthUtil.setUserId(req, userId);

      flow.createAndStoreCredential(tokenResponse, userId);


        bootstrapProject(AuthUtil.getCredential(userId), req, userId);

      res.sendRedirect(WebUtil.buildUrl(req, "/"));
      return;
    }

    // Else, we have a new flow. Initiate a new flow.
    AuthorizationCodeFlow flow = AuthUtil.newAuthorizationCodeFlow();
    GenericUrl url = flow.newAuthorizationUrl().setRedirectUri(WebUtil.buildUrl(req, "/oauth2callback"));
    url.set("approval_prompt", "force");
    res.sendRedirect(url.build());
  }

  private void showError(HttpServletResponse res, String errorMessage) throws IOException {
    res.setContentType("text/plain");
    res.getWriter().write("Authentication error: " + errorMessage);
  }

    private void bootstrapProject(Credential credential, HttpServletRequest req, String userId) throws IOException {
        // Insert Share Target
        final String eyeReportShareIcon = "https://eye-report.appspot.com/img/eye.png";

        LOG.fine("Inserting share target Item");
        Entity shareTarget = new Entity();
        shareTarget.setId("eye-report");
        shareTarget.setDisplayName("EyeReport");
        shareTarget.setImageUrls(Lists.newArrayList(eyeReportShareIcon));
        GlassClient.insertShareTarget(credential, shareTarget);

        // Set up timeline subscription
        // subscribe (only works deployed to production, so skip if on localhost)
        if(!WebUtil.buildUrl(req, "/notify").contains("localhost")) {
            GlassClient.insertSubscription(credential, WebUtil.buildUrl(req, "/notify"), userId, "timeline");
        } else {
            LOG.warning("Could not subscribe becuase running on localhost >_<");
        }
    }
}

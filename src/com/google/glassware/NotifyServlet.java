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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.services.glass.Glass;
import com.google.api.services.glass.model.Attachment;
import com.google.api.services.glass.model.Location;
import com.google.api.services.glass.model.MenuItem;
import com.google.api.services.glass.model.Notification;
import com.google.api.services.glass.model.NotificationConfig;
import com.google.api.services.glass.model.TimelineItem;
import com.google.common.collect.Lists;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Writer;
import java.util.List;
import java.util.logging.Logger;

import java.util.Date;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

/**
 * Handles the PubSub verification GET step and receives notifications
 *
 * @author mimming
 */
public class NotifyServlet extends HttpServlet {
  private static final Logger LOG = Logger.getLogger(MainServlet.class.getSimpleName());
  private static final ObjectMapper MAPPER = new ObjectMapper();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Respond with OK and status 200 in a timely fashion to prevent redelivery
    response.setContentType("text/html");
    Writer writer = response.getWriter();
    writer.append("OK");
    writer.close();

    // Get the notification object from the request body (into a string so we can log it)
    BufferedReader notificationReader = new BufferedReader(new InputStreamReader(request.getInputStream()));
    String notificationString = "";
    while(notificationReader.ready()) {
      notificationString += notificationReader.readLine();
    }

    LOG.info("got raw notification " + notificationString);

    Notification notification = MAPPER.readValue(notificationString, Notification.class);

    LOG.info("Got a notification with ID: " + notification.getItemId());

    // Figure out the impacted user and get their credentials for API calls
    String userId = notification.getUserToken();
    Credential credential = AuthUtil.getCredential(userId);
    Glass glassClient = GlassClient.getGlass(credential);


    if(notification.getCollection().equals("locations")) {
      LOG.info("Notification of updated location");
      Glass glass = GlassClient.getGlass(credential);
      Location location = glass.locations().get(notification.getItemId()).execute(); // usually 'latest'

      LOG.info("New location is " + location.getLatitude() + ", " + location.getLongitude());
      GlassClient.insertTimelineItem(credential,
          new TimelineItem().setText("You are now at " +
              location.getLatitude() + ", " + location.getLongitude()).setNotification(
              new NotificationConfig().setLevel("audio_only"))
              .setLocation(location)
              .setMenuItems(Lists.newArrayList(new MenuItem().setAction("NAVIGATE_TO"))));

      // This is a location notification. Ping the device with a timeline item telling them where they are.
    } else if(notification.getCollection().equals("timeline")) {
      // Get the impacted timeline item
      TimelineItem timelineItem = glassClient.timeline().get(notification.getItemId()).execute();
      LOG.info("Notification impacted timeline item with ID: " + timelineItem.getId());

      // Get the first attachment on that timeline item and do stuff with it
      String attachmentId = null;
      List<Attachment> attachments = timelineItem.getAttachments();
      if(attachments != null && attachments.size() > 0) {

          //TODO: Winona: this is where we'll want to add code that handles the incoming timeline notifications
          // -grab the attachment off of the item (if it exists)

        // Get the first attachment
        attachmentId = attachments.get(0).getId();
        LOG.info("Found attachment with ID " + attachmentId);

        // Get the attachment content
        InputStream stream = GlassClient.getAttachmentInputStream(credential, timelineItem.getId(), attachmentId);
        // Create a new timeline item with the attachment
        GlassClient.insertTimelineItem(credential,
              new TimelineItem().setText("Your news report has been received").setNotification(
                      new NotificationConfig().setLevel("audio_only")),
              "image/jpeg", stream);
        // -grab text off of a voice reply?

        // dump the stuff into the data store for use in the view - https://developers.google.com/appengine/docs/java/datastore/entities
        DatastoreService xyz = DatastoreServiceFactory.getDatastoreService();

        Entity report = new Entity("Report");
        report.setProperty("reporter", userId);
        report.setProperty("media", "https://lh6.googleusercontent.com/-HcO5aMj1C14/UQ1NzpEsjSI/AAAAAAAAAE8/brC2M_T75VM/s811/20130202_093253_194.jpg");
        Date reportDate = new Date();
        report.setProperty("reportDate", reportDate);
        report.setProperty("publish", true);

          LOG.info("Key =" + xyz.put(report).toString());


          //Entity streamReportItem = datastore.get(employeeKey);


      } else {
        LOG.warning("timeline item " + timelineItem.getId() + " has no attachments");
      }
    }
  }
}

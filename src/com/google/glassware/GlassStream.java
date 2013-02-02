package com.google.glassware;

/**
 * Created with IntelliJ IDEA.
 * User: bluer
 * Date: 2/2/13
 * Time: 11:40 AM
 * To change this template use File | Settings | File Templates.
 */


import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.appengine.http.UrlFetchTransport;
import com.google.api.client.http.ByteArrayContent;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.glass.Glass;
import com.google.api.services.glass.model.*;
import com.google.common.io.ByteStreams;

import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Logger;

import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.CompositeFilter;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Entity;


public class GlassStream {

    // SELECT * FROM Report

    public static PreparedQuery getReports() {

        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

        Query q = new Query("Report");
        return datastore.prepare(q);
    }




}

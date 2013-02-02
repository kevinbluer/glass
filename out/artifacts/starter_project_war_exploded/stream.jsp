<%@ page import="com.google.api.client.auth.oauth2.Credential" %>
<%@ page import="com.google.api.services.glass.model.Entity" %>
<%@ page import="com.google.glassware.GlassClient" %>
<%@ page import="com.google.glassware.WebUtil" %>
<%@ page
        import="java.util.List" %>
<%@ page import="com.google.api.services.glass.model.TimelineItem" %>
<%@ page import="com.google.api.services.glass.model.Subscription" %>
<%@ page import="com.google.api.services.glass.model.Attachment" %>

<%@ page import="com.google.glassware.GlassStream" %>

<%@ page import="com.google.appengine.api.datastore.PreparedQuery" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    String userId = com.google.glassware.AuthUtil.getUserId(request);
    String appBaseUrl = WebUtil.buildUrl(request, "/stream.jsp");

    Credential credential = com.google.glassware.AuthUtil.getCredential(userId);
    List<Entity> shareTargets = GlassClient.listSharetargets(credential).getItems();
    List<TimelineItem> timelineItems = GlassClient.listItems(credential,5L).getItems();
    List<Subscription> subscriptions = GlassClient.listSubscriptions(credential).getItems();

%>

<html>
<head>
  <meta charset="utf-8">
  <!-- Always force latest IE rendering engine or request Chrome Frame -->
  <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
  <title>News Stream</title>

  <link href="css/application.css" media="screen" rel="stylesheet" type="text/css" />

  <!--[if lt IE 9]>
<script src="../../javascripts/html5shiv.js" type="text/javascript"></script><script src="../../javascripts/excanvas.js" type="text/javascript"></script><script src="../../javascripts/iefix.js" type="text/javascript"></script><link href="../../stylesheets/iefix.css" media="screen" rel="stylesheet" type="text/css" /><![endif]-->

  <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
</head>
<body>

<div id="modal" class="black-box modal hide fade">
  <div class="modal-header tab-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <span>Reporter: Kevin</span>
  </div>
  <div class="modal-body separator">
    <h4>2/1/2013 17:06</h4>
    <p>Big news!</p>
  </div>
  <div class="modal-footer">
    <div class="inner-well">
      <a class="button mini rounded light-gray" data-dismiss="modal">Close</a>
      <a class="button mini rounded blue">Save changes</a>
    </div>
  </div>
</div>

<div id="modal-gallery" class="black-box modal modal-gallery hide fade">
  <div class="modal-header tab-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <span class="modal-title"></span>
  </div>
  <div class="modal-body"><div class="modal-image"></div></div>
  <div class="modal-footer">
    <div class="pull-left">
      You can also change the images<br/> by scrolling the mouse wheel!
    </div>
    <div class="pull-right">
      <a class="button blue modal-next">Next <i class="icon-arrow-right icon-white"></i></a>
      <a class="button gray modal-prev"><i class="icon-arrow-left icon-white"></i> Previous</a>
      <a class="button green modal-play modal-slideshow" data-slideshow="5000"><i class="icon-play icon-white"></i> Slideshow</a>
      <a class="button black" target="_blank"><i class="icon-download"></i> Download</a>
    </div>
  </div>
</div>
<nav id="secondary" class="main-nav">

  <div class="profile-menu">

      <img src="img/eye.png">

  </div>

  <ul class="secondary-nav-menu">
    <li class="">
  <a href="home.jsp">
      <i class="icon-home"></i> Home
  </a>
</li>

<li class="">
  <a href="send.jsp">
      <i class="icon-thumbs-up"></i> Send Dispatch
  </a>
</li>

<li class="active">
  <a href="stream.jsp">
      <i class="icon-list"></i> News Stream
  </a>
</li>
  </ul>

</nav>



<section id="main">
  <div class="top-nav">
  <div class="container-fluid">
    <div class="row-fluid search-button-bar-container">
      <div class="span12">
        <ul class="breadcrumb">
          <li><a href="#"><i class="icon-home"></i> Eye Report</a></li>
          <li class="active"><a href="#">News Stream</a></li>
        </ul>
        <a class="search-button-trigger" href="#"><i class="icon-search"></i></a>
      </div>
    </div>

    <div class="row-fluid search-bar-nav">
      <div class="span12">
        <form>
          <input type="text" class="search" placeholder="Search...">
        </form>
      </div>
    </div>
  </div>
</div>

  <div class="container-fluid">
    <div class="row-fluid">
 

<div class="row-fluid">
<<<<<<< HEAD

    <%
        PreparedQuery reports = GlassStream.getReports();

        for (com.google.appengine.api.datastore.Entity result : reports.asIterable()) {
            String reportUrl = result.getProperty("media").toString();
            String reportReporter = result.getProperty("reporter").toString();
            String reportDate = result.getProperty("reportDate").toString();
    %>

    <div class="span4">
        <div class="box">
            <div class="tab-header">
                <i class="icon-th-list"></i> Reporter: <%= reportReporter %>
            </div>
            <div class="padded">
               <img src='<%= reportUrl %>'>
                <br>
                <br>
                <%= reportDate %>
            </div>
        </div>
=======
  <div class="span4">
    <div class="box">
      <div class="tab-header">
        <i class="icon-th-list"></i> Reporter: Kevin Bluer
      </div>
      <div class="padded">
        Breaking news: Large plumes of smoke seen across the Hudson River.
      </div>
>>>>>>> 97a6549570310d6edee092081e4b180179f2937e
    </div>

<%
    }
%>

  <!--
  <div class="span4">
    <div class="box">
      <div class="tab-header">
        <i class="icon-th-list"></i> Senior Correspondent: Tom Olson
      </div>
      <div class="padded">
        Breaking news: Uprising in Pongyang.
      </div>
    </div>
  </div>
  <div class="span4">
    <div class="box">
      <div class="tab-header">
        <i class="icon-th-list"></i> Citizen Reporter: Winnie Tong
      </div>
      <div class="padded">
        My cat's breath smells like cat food.
      </div>
    </div>
  </div>-->
</div>


  </div>
</div>
  </div>
</section>

<script type="text/html" id="template-notification">
  <div class="notification animated fadeInLeftMiddle fast{{ item.itemClass }}">
    <div class="left">
      <div style="background-image: url({{ item.imagePath }})" class="{{ item.imageClass }}"></div>
    </div>
    <div class="right">
      <div class="inner">{{ item.text }}</div>
      <div class="time">{{ item.time }}</div>
    </div>

    <i class="icon-remove-sign hide"></i>
  </div>
</script>
<script type="text/html" id="template-notifications">
  <div class="container">
    <div class="row" id="notifications-wrapper">
      <div id="notifications" class="{{ bootstrapPositionClass }} notifications animated">
        <div id="dismiss-all" class="dismiss-all button blue">Dismiss all</div>
        <div id="content">
          <div id="notes"></div>
        </div>
      </div>
    </div>
  </div>
</script>
<script src="../../javascripts/application.js" type="text/javascript"></script><script src="../../javascripts/docs.js" type="text/javascript"></script><script src="../../javascripts/docs_charts.js" type="text/javascript"></script><script src="../../javascripts/documentation.js" type="text/javascript"></script><script src="../../javascripts/prettify.js" type="text/javascript"></script><link href="../../stylesheets/prettify.css" media="screen" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    prettyPrint()
</script>

</body>
</html>

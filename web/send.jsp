<%@ page import="com.google.api.client.auth.oauth2.Credential" %>
<%@ page import="com.google.api.services.glass.model.Entity" %>
<%@ page import="com.google.glassware.GlassClient" %>
<%@ page import="com.google.glassware.WebUtil" %>
<%@ page
    import="java.util.List" %>
<%@ page import="com.google.api.services.glass.model.TimelineItem" %>
<%@ page import="com.google.api.services.glass.model.Subscription" %>
<%@ page import="com.google.api.services.glass.model.Attachment" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String userId = com.google.glassware.AuthUtil.getUserId(request);
  String appBaseUrl = WebUtil.buildUrl(request, "/");

  Credential credential = com.google.glassware.AuthUtil.getCredential(userId);
  List<Entity> shareTargets = GlassClient.listSharetargets(credential).getItems();
  List<TimelineItem> timelineItems = GlassClient.listItems(credential,5L).getItems();
  List<Subscription> subscriptions = GlassClient.listSubscriptions(credential).getItems();

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <!-- Always force latest IE rendering engine or request Chrome Frame -->
  <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
  <title>Eye Report</title>

  <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.9.0.min.js"></script>
  <link href="css/application.css" media="screen" rel="stylesheet" type="text/css" />

  <!--[if lt IE 9]>
<script src="../../javascripts/html5shiv.js" type="text/javascript"></script><script src="../../javascripts/excanvas.js" type="text/javascript"></script><script src="../../javascripts/iefix.js" type="text/javascript"></script><link href="../../stylesheets/iefix.css" media="screen" rel="stylesheet" type="text/css" /><![endif]-->

  <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
</head>
<body>

<div id="modal" class="black-box modal hide fade">
  <div class="modal-header tab-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <span>Some modal title</span>
  </div>
  <div class="modal-body separator">
    <h4>Text in a modal</h4>
    <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem.</p>
  </div>
  <div class="modal-footer">
    <div class="inner-well">
      <a class="button mini rounded light-gray" data-dismiss="modal">Close</a>
      <a class="button mini rounded blue">Send Dispatch</a>
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

<li class="active">
  <a href="send.jsp">
      <i class="icon-thumbs-up"></i> Send Dispatch
  </a>
</li>

<li class="">
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
          <li class="active"><a href="#">Send Dispatch</a></li>
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
  <div class="span12">
    <div class="box">
      <div class="tab-header">
        Send Dispatch
        <span class="pull-right">
          <span class="options">
            <a href="#"><i class="icon-cog"></i></a>
          </span>
        </span>
      </div>
      <form class="fill-up" action="<%= WebUtil.buildUrl(request, "/main") %>" method="post">
        <div class="row-fluid">
          <div class="span12">
            <div class="padded">
              <div class="input">
                <input type="hidden" name="imageUrl" id="imageUrl" value="<%= appBaseUrl + "static/icons/noun_project_conflict.png" %>" />
                <input type="hidden" name="operation" value="insertItem">
                <input type="hidden" name="contentType" value="image/png">
                <input id="dispatchTitle" type="text" placeholder="Dispatch Title"/>
                <img class="selectionImage" src="<%= appBaseUrl + "static/icons/noun_project_info.png" %>">
                <img class="selectionImage" src="<%= appBaseUrl + "static/icons/noun_project_omg.png" %>">
                <img class="selectionImage selectedImage" src="<%= appBaseUrl + "static/icons/noun_project_conflict.png" %>">
                <input type="text" name="message" id="message">
              </div>
              <style>
              .selectionImage { width: 32px; hover: }
              .selectedImage { border: 1px solid black;}
              .selectionImage:hover{
              opacity:0.4;
              filter:alpha(opacity=40); /* For IE8 and earlier */
              }
              </style>

              <script>
              $("body").on("click", ".selectionImage", function (e) {

                  $(".selectionImage").removeClass("selectedImage");
                  var $e = $(e.currentTarget);
                  var src = $e.attr("src");
                  console.log("1:" + src);
                  $e.addClass("selectedImage");
                  $("#imageUrl").val(src);
                  console.log("1:" + src);
              });
              $("body").on("mouseover", "submit", function (e) {
              console.log(2);
                                  $("#message").val("<p>"+$("#dispatchTitle").val() + "</p>"+$("dispatchDetail").text());
              })
              </script>

              <div class="input">
                <select name="city" id="city" placeholder="City" class="fill-up chzn-select">
                  <option>San Francisco</option>
                  <option>New York</option>
                  <option>London</option>
                  <option>Paris</option>
                  <option>Berlin</option>
                  <option>Cairo</option>
                  <option>Hong Kong</option>
                  <option>Tokyo</option>
                  <option style="font-weight: bold;">New Jersey</option>
                </select>
              </div>

                <div class="input" style="padding-top: 10px;">
                    <textarea id="dispatchDetail" placeholder="Dispatch Detail..." rows="6"></textarea>
                </div>

              <div class="input">
                <textarea class="tagme" placeholder="This is a textarea"></textarea>
              </div>
            </div>
          </div>

        </div>
        <div class="form-actions">
          <button type="submit" class="button blue">Send Dispatch</button>
          <button type="button" class="button">Cancel</button>
        </div>
      </form>
    </div>
  </div>
  </div>
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
<script src="js/application.js" type="text/javascript"></script><script src="js/docs.js" type="text/javascript"></script><script src="js/javascripts/docs_charts.js" type="text/javascript"></script><script src="js/javascripts/documentation.js" type="text/javascript"></script><script src="js/prettify.js" type="text/javascript"></script><link href=css/prettify.css" media="screen" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    prettyPrint()
</script>

</body>
</html>

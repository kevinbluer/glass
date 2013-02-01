<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <!-- Always force latest IE rendering engine or request Chrome Frame -->
  <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
  <title>Plastique Theme</title>

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
  <div class="span4">
    <div class="box">
      <div class="tab-header">
        <i class="icon-th-list"></i> Span4
      </div>
      <div class="padded">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
      </div>
    </div>
  </div>
  <div class="span4">
    <div class="box">
      <div class="tab-header">
        <i class="icon-th-list"></i> Span4
      </div>
      <div class="padded">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
      </div>
    </div>
  </div>
  <div class="span4">
    <div class="box">
      <div class="tab-header">
        <i class="icon-th-list"></i> Span4
      </div>
      <div class="padded">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
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
<script src="../../javascripts/application.js" type="text/javascript"></script><script src="../../javascripts/docs.js" type="text/javascript"></script><script src="../../javascripts/docs_charts.js" type="text/javascript"></script><script src="../../javascripts/documentation.js" type="text/javascript"></script><script src="../../javascripts/prettify.js" type="text/javascript"></script><link href="../../stylesheets/prettify.css" media="screen" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    prettyPrint()
</script>

</body>
</html>

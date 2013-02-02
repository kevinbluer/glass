<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <!-- Always force latest IE rendering engine or request Chrome Frame -->
  <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
  <title>Eye Report</title>

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
      <form class="fill-up">
        <div class="row-fluid">
          <div class="span6">
            <div class="padded">
              <div class="input">
                <input type="text" placeholder="Email"/>
              </div>
              <div class="input">
                <input type="text" placeholder="Address"/>
              </div>
              <div class="input">
                <input type="text" placeholder="Username" class="error"/>
                <span class="input-error" data-title="please write a valid username">
                  <i class="icon-warning-sign"></i>
                </span>
              </div>

              <div class="input">
                <input type="password" placeholder="Password" class="error"/>
                <span class="input-error" data-title="please write a valid password">
                  <i class="icon-warning-sign"></i>
                </span>
              </div>

              <div class="note pull-right">Please use a secure password</div>

              <div class="input">
                <select name="city" id="city" placeholder="City" class="fill-up chzn-select">
                  <option>Seattle</option>
                  <option>Chicago</option>
                  <option>New York</option>
                </select>
              </div>


              <div class="input" style="padding-top: 20px;">
                <select style="margin-top: 20px;" multiple="multiple" name="city2" id="city2" placeholder="City" class="fill-up chzn-select">
                  <option>Seattle</option>
                  <option>Chicago</option>
                  <option>New York</option>
                </select>
              </div>

              <div class="input">
                <textarea class="tagme" placeholder="This is a textarea"></textarea>
              </div>
            </div>
          </div>

          <div class="span6">

            <div class="padded" style="padding-bottom: 0">
              <div class="input">
                <textarea placeholder="This is a textarea" rows="6"></textarea>
              </div>

              <div class="row-fluid">

                <div class="span6">
                  <div class="input">
                    <input type="checkbox" id="ch1" class="normal-check"/>
                    <label for="ch1">The number one option</label>
                  </div>
                  <div class="input">
                    <input type="checkbox" id="ch2" class="normal-check"/>
                    <label for="ch2">The number two option</label>
                  </div>
                </div>
                <div class="span6">
                  <div class="input">
                    <input type="checkbox" id="ch3" class="normal-check"/>
                    <label for="ch3">The number three option</label>
                  </div>
                  <div class="input">
                    <input type="checkbox" id="ch4" class="normal-check"/>
                    <label for="ch4">The number four option</label>
                  </div>
                </div>
              </div>

              <input id="datetimepicker" type="text" class="fill-up" value="jQuery date time picker">

              <div class="row-fluid">

                <div class="span6">
                  <div class="input">
                    <input type="radio" name="radios[]" id="rd1" class="normal-radio"/>
                    <label for="rd1">The number one option</label>
                  </div>

                  <div class="input">
                    <input type="radio" name="radios[]" id="rd2" class="normal-radio"/>
                    <label for="rd2">The number two option</label>
                  </div>
                </div>
                <div class="span6">
                  <div class="input">
                    <input type="radio" name="radios[]" id="rd3" class="normal-radio"/>
                    <label for="rd3">The number two option</label>
                  </div>
                  <div class="input">
                    <input type="radio" name="radios[]" id="rd4" class="normal-radio"/>
                    <label for="rd4">The number four option</label>
                  </div>
                </div>
              </div>
              <div class="row-fluid">
                <div class="span12">

                  <div class="note large">
                    <i class="icon-warning-sign"></i> Warning: You have to complete all fields
                  </div>
                  <div class="note large">
                    <i class="icon-pencil"></i> Note: The checkboxes and radios are turned on-off entirely out of css. no javascript involved!
                  </div>

                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non felis non orci congue mollis. Sed euismod magna sed nunc dignissim tincidunt. Maecenas faucibus varius elit.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="form-actions">
          <button type="submit" class="button blue">Save changes</button>
          <button type="button" class="button">Cancel</button>
          <div class="pull-right">
            <span class="checky-label-left">
            </span>
            <input type="checkbox" id="5Yg8C" class="checky" />
            <label for="5Yg8C" class="checky"><span></span></label>
          </div>
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

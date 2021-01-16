<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>TAL | Locataires</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <meta name="MobileOptimized" content="320">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-full-width">
<!-- BEGIN HEADER -->
<div class="header navbar navbar-inverse navbar-fixed-top">
    <!-- BEGIN TOP NAVIGATION BAR -->
    <div class="header-inner">
        <!-- BEGIN LOGO -->
        <a class="navbar-brand" href="/espaceadmin"  style="padding: 7px;"  >
            <img src="assets/image/talocationlogo.png" alt="logo" style="" />
        </a>
        <!-- END LOGO -->
        <!-- BEGIN HORIZANTAL MENU -->
        <div class="hor-menu hidden-sm hidden-xs">
            <ul class="nav navbar-nav">
                <li >
                    <a id="réservations" >

                        Réservations
                    </a>
                </li>
                <li  >
                    <a id="locations">

                        Locations

                    </a>

                </li>
                <li >
                    <a id="véhicules" href="/gérervéhicules">Gérer véhicules</a>

                </li>

                <li class="active">
                    <a id="locataires" href="/gérercompteslocataires" >Gérer comptes locataires

                    </a>
                    <span class="selected"></span>

                </li>
                <li  >
                    <a  id="gestionnaires" href="/gérercomptesgestionnaires">Gérer comptes Gestionnaires

                    </a>


                </li>

            </ul>
        </div>
        <!-- END HORIZANTAL MENU -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <img src="assets/img/menu-toggler.png" alt="" />
        </a>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN TOP NAVIGATION MENU -->
        <ul class="nav navbar-nav pull-right">
            <!-- BEGIN NOTIFICATION DROPDOWN -->

            <!-- END NOTIFICATION DROPDOWN -->
            <!-- BEGIN INBOX DROPDOWN -->
            <!-- BEGIN TODO DROPDOWN -->

            <!-- END TODO DROPDOWN -->
            <!-- BEGIN USER LOGIN DROPDOWN -->
            <li class="dropdown user">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                    <img alt="" src="assets/img/avatar1_small.jpg"/>
                    <span class="username">Bob Nilson</span>
                    <i class="icon-angle-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="extra_profile.html"><i class="icon-user"></i> My Profile</a></li>

                    <li><a href="inbox.html"><i class="icon-envelope"></i> My Inbox <span class="badge badge-danger">3</span></a></li>
                    <li><a href="#"><i class="icon-tasks"></i> My Tasks <span class="badge badge-success">7</span></a></li>
                    <li class="divider"></li>
                    <li><a href="javascript:;" id="trigger_fullscreen"><i class="icon-move"></i> Full Screen</a></li>
                    <li><a href="extra_lock.html"><i class="icon-lock"></i> Lock Screen</a></li>
                    <li><a href="login.html"><i class="icon-key"></i> Se déconnecter</a></li>
                </ul>
            </li>
            <!-- END USER LOGIN DROPDOWN -->
        </ul>
        <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<div class="clearfix"></div>
<!-- BEGIN CONTAINER -->
<div class="page-container" >
    <!-- BEGIN EMPTY PAGE SIDEBAR -->
    <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu visible-sm visible-xs">
            <li>
                <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                <form class="sidebar-search" action="extra_search.html" method="POST">
                    <div class="form-container">
                        <div class="input-box">
                            <a href="javascript:;" class="remove"></a>
                            <input type="text" placeholder="Search..."/>
                            <input type="button" class="submit" value=" "/>
                        </div>
                    </div>
                </form>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
            </li>
            <li>
                <a class="active" href="index.html">
                    Dashboard
                </a>
            </li>
            <li  class="active">
                <a href="javascript:;">
                    Layouts
                    <span class="arrow open"></span>
                    <span class="selected"></span>
                </a>
                <ul class="sub-menu">
                    <li >
                        <a href="layout_language_bar.html">
                            <span class="badge badge-roundless badge-important">new</span>Language Switch Bar</a>
                    </li>
                    <li >
                        <a href="layout_horizontal_sidebar_menu.html">
                            Horizontal & Sidebar Menu                     </a>
                    </li>
                    <li class="active">
                        <a href="layout_horizontal_menu1.html">
                            Horizontal Menu 1                    </a>
                    </li>
                    <li >
                        <a href="layout_horizontal_menu2.html">
                            Horizontal Menu 2                    </a>
                    </li>
                    <li>
                        <a href="layout_disabled_menu.html">
                            Disabled Menu Links</a>
                    </li>
                    <li >
                        <a href="layout_promo.html">
                            Promo Page                    </a>
                    </li>
                    <li >
                        <a href="layout_email.html">
                            Email Templates                     </a>
                    </li>
                    <li >
                        <a href="layout_ajax.html">
                            Content Loading via Ajax</a>
                    </li>
                    <li >
                        <a href="layout_sidebar_closed.html">
                            Sidebar Closed Page                    </a>
                    </li>
                    <li >
                        <a href="layout_sidebar_fixed.html">
                            Sidebar Fixed Page                    </a>
                    </li>
                    <li >
                        <a href="layout_blank_page.html">
                            Blank Page                    </a>
                    </li>
                    <li >
                        <a href="layout_boxed_page.html">Boxed Page</a>
                    </li>
                    <li >
                        <a href="layout_boxed_not_responsive.html">
                            Non-Responsive Boxed Layout                     </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            More options
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li><a href="#">Second level link</a></li>
                            <li>
                                <a href="javascript:;">More options<span class="arrow"></span></a>
                                <ul class="sub-menu">
                                    <li><a href="index.html">Third level link</a></li>
                                    <li><a href="index.html">Third level link</a></li>
                                    <li><a href="index.html">Third level link</a></li>
                                    <li><a href="index.html">Third level link</a></li>
                                    <li><a href="index.html">Third level link</a></li>
                                </ul>
                            </li>
                            <li><a href="index.html">Second level link</a></li>
                            <li><a href="index.html">Second level link</a></li>
                            <li><a href="index.html">Second level link</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                <a href="">Tables</a>
            </li>
            <li>
                <a href="">Extra
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li><a href="index.html">About Us</a></li>
                    <li><a href="index.html">Services</a></li>
                    <li><a href="index.html">Pricing</a></li>
                    <li><a href="index.html">FAQs</a></li>
                    <li><a href="index.html">Gallery</a></li>
                    <li><a href="index.html">Registration</a></li>
                    <li><a href="index.html">2 Columns (Left)</a></li>
                    <li><a href="index.html">2 Columns (Right)</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- END EMPTY PAGE SIDEBAR -->
    <!-- BEGIN PAGE -->
    <div class="page-content">
        <div class="row">


            <div class="col-md-12">
                <div class="row search-form-default">
                    <div class="col-md-12">
                        <form class="form-inline" action="#">
                            <div class="input-group">
                                <div class="input-cont">
                                    <input id="myInput" type="text" placeholder="Search..." class="form-control">
                                </div>
                                <span class="input-group-btn">
                                    <button type="button" class="btn green">
                                    Search &nbsp;
                                    <i class="m-icon-swapright m-icon-white"></i>
                                    </button>
                                    </span>
                            </div>
                        </form>
                    </div>
                </div>

                <div  id="listlocataires" >
                </div>









            </div>

        </div>

        <!-- END PAGE CONTENT-->
    </div>
    <!-- END PAGE -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="footer-inner">
        2013 &copy; Metronic by keenthemes.
    </div>
    <div class="footer-tools">
         <span class="go-top">
         <i class="icon-angle-up"></i>
         </span>
    </div>
</div>

<script>
    $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>


<script type="text/javascript"> jQuery(document).ready(function() {
    App.init();
    debugger;

        $.ajax({
            type: "get",
            url: "/backend/listlocataires",
            dataType: "html",
            success: function (result) {

                $("#listlocataires").empty();
                $("#listlocatairesbloqués").empty();
                $("#listlocataires").html(result); },
            error: function (response) {
                debugger;
                alert('error'); }
        });

    });
</script>


<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/plugins/excanvas.min.js"></script>
<script src="assets/plugins/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
<script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
<!-- END CORE PLUGINS -->
<script src="assets/scripts/app.js"></script>
<script>
    jQuery(document).ready(function() {
        App.init();
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>

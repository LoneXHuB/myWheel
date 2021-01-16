 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >

<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.0
Version: 1.5.2
Author: KeenThemes
Website: http://www.keenthemes.com/
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
   <meta charset="utf-8" />
   <title>myWheel | erreur</title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   <meta name="MobileOptimized" content="320">
   <!-- BEGIN GLOBAL MANDATORY STYLES -->          
   <link href="${contextPath}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
   <link href="${contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
   <link href="${contextPath}/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
   <!-- END GLOBAL MANDATORY STYLES -->
   <!-- BEGIN THEME STYLES --> 
   <link href="${contextPath}/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
   <link href="${contextPath}/assets/css/style.css" rel="stylesheet" type="text/css"/>
   <link href="${contextPath}/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
   <link href="${contextPath}/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
   <link href="${contextPath}/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
   <link href="${contextPath}/assets/css/pages/error.css" rel="stylesheet" type="text/css"/>
   <link href="${contextPath}/assets/css/custom.css" rel="stylesheet" type="text/css"/>
   <!-- END THEME STYLES -->
   <link rel="shortcut icon" href="favicon.ico" />
   <script src="${contextPath}/js/jquery.min.js"></script>
   <script>
   $(document).ready(function(){
	   $("#trace").hide();
	   $("#showTrace").click(function(){
		   $("#trace").slideDown("slow"); 
	   })
	  
   });
   
   </script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-404-3">
   <div class="page-inner">
      <img src="${contextPath}/assets/img/pages/earth.jpg" class="img-responsive" alt="">
   </div>
   <div class="container error-404">
      <h1>ERREUR !</h1>
      <h2>Houston, we have a problem.</h2>
      <p>
         Une erreur s'est produite , veuillez réessayer . 
      </p>
      <p>
      ${error}
       <sec:authorize access="hasRole('CLIENT')">
         <a href="/">Acceuil</a>
         </sec:authorize>
          <sec:authorize access="hasAnyRole('ADMIN','AGENT')">
           <a href="/BO/addVehicule">Acceuil</a>
          </sec:authorize>
         <br>
      </p>
       <h4 id="showTrace">Infos trace :</h4>
      <p id="trace" style="height:200px;over-flow-y:scroll;">
       ${trace}
      </p>
   </div>
   <!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
   <!-- BEGIN CORE PLUGINS -->   
   <!--[if lt IE 9]>
   <script src="${contextPath}/assets/plugins/respond.min.js"></script>
   <script src="${contextPath}/assets/plugins/excanvas.min.js"></script> 
   <![endif]-->   
   <script src="${contextPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
   <script src="${contextPath}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
   <script src="${contextPath}/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
   <!-- END CORE PLUGINS -->
   <script src="${contextPath}/assets/scripts/app.js"></script>  
   <script>
      jQuery(document).ready(function() {    
         App.init();
      });
   </script>
   <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
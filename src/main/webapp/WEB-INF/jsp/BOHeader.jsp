<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta charset="utf-8" />
   <title>myWheel | BackOffice</title>
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
   <link href="${contextPath}/assets/css/custom.css" rel="stylesheet" type="text/css"/>
      <link href="${contextPath}/assets/css/themes/default.css" rel="stylesheet" type="text/css"/>
   
   <!-- END THEME STYLES -->
   <link rel="shortcut icon" href="favicon.ico" />
   
   
   <script src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	updateFeedList( );
	updateResList( );
	
	$("#envelope").click(function(){
		$("#feedBadge").hide();
	});
	$("#envelopeRes").click(function(){
		$("#ResBadge").hide();
	});
	
});

	function updateFeedList( ){
      	
	
      	var selected = $('#depots').find(":selected").text();
     console.log("update Veh called");
     $("#feedInbox").empty();
    
     $.ajax({
              type: "GET",
              url: "/BO/getFeedList",
              data: { } ,
              contentType: "application/json;charset=utf-8",
              dataType: "json",
              success: function (result) { 
            	  debugger;
            	  $("#numFeeds").text("vouz avez "+result.length+" Messages");
            	
            		
            	  $("#feedBadge").text(result.length);
          			if(result.length == 0)
          				{
          				$("#feedBadge").hide();
          				
          				}
          			if(result.length > 0) 
          			{
          			
          				
            	  $.each(result , function(index, feed) {
            			
            			$("#feedInbox").append("<li>"
                       +" <a href='#'>"
                       +"<span class='photo'><img src='${contextPath}/assets/img/avatar2.jpg' alt='prfl'/></span>"
                       + "<span class='subject'>"
                       +"<span class='from'>"+feed.nomClient+"</span>" 
                       +"<span class='time'>recent</span>"
                       +" </span>"
                       +" <span class='message'>"
                       + feed.message +"</span>"
                       +" </a>"
                       + "</li>");
            	  
            	          });
            		
                       }
              
              },
              error: function (response) {
            	  alert("une erreur imprévue s'est produite , veuillez Rafrechir la page");
              }
          });
         

      }
	
	
	function updateResList( ){
		var d = new Date();

		var month = d.getMonth()+1;
		var day = d.getDate();

		var today = d.getFullYear() + '-' +
		    (month<10 ? '0' : '') + month + '-' +
		    (day<10 ? '0' : '') + day;
		
     $("#resList").empty();
    
     $.ajax({
              type: "GET",
              url: "/BO/getResList",
              data: { today : today } ,
              contentType: "application/json;charset=utf-8",
              dataType: "json",
              success: function (result) { 
            	  debugger;
            	  $("#numRes").text("vouz avez "+result.length+" nouvelles Reservations");
            	
            		
            	  $("#resBadge").text(result.length);
          			if(result.length == 0)
          				{
          				$("#resBadge").hide();
          				}
          			if(result.length > 0) 
          			{
          			
          				
            	  $.each(result , function(index, reservation) {
            			
            		  
            			$("#resList").append("<li>"
                        +"<a href='/BO/locationFilter?email="+reservation.user.email+"'>"
                        +"<span class='label label-icon label-success'><i class='icon-plus'></i></span>"
                        +""+reservation.user.name+" </strong> vient de reserver !"
                        +"</a>"
                        +"</li>");
            	  
            	          });
                       }
              
              },
              error: function (response) {
            	  alert("une erreur imprévue s'est produite , veuillez Rafrechir la page");
              }
          });
         

      }
	
	
	
	</script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
   <!-- BEGIN HEADER -->
   <div class="header navbar navbar-inverse navbar-fixed-top">
      <!-- BEGIN TOP NAVIGATION BAR -->
      <div class="header-inner">
         <!-- BEGIN LOGO -->
         <a class="navbar-brand" href="/BO/addVehicule">
         <img src="${contextPath}/assets/img/logo.png" alt="logo" class="img-responsive" />
         </a>
         <!-- END LOGO -->
         <!-- BEGIN RESPONSIVE MENU TOGGLER -->
         <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
         <img src="${contextPath}/assets/img/menu-toggler.png" alt="" />
         </a>
         <!-- END RESPONSIVE MENU TOGGLER -->
         <!-- BEGIN TOP NAVIGATION MENU -->
         <ul class="nav navbar-nav pull-right">
            <!-- BEGIN NOTIFICATION DROPDOWN -->
            <li class="dropdown" id="header_notification_bar">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                  data-close-others="true">
               <i id="envelopeRes" class="icon-warning-sign"></i>
               <span  id="resBadge" class="badge">6</span>
               </a>
               <ul class="dropdown-menu extended notification">
                  <li>
                     <p id="numRes">Aucune notification</p>
                  </li>
                  <li>
                     <ul id="resList" class="dropdown-menu-list scroller" style="height: 250px;">
                        <li>
                           <a href="#">
                           <span class="label label-icon label-success"><i class="icon-plus"></i></span>
                           New user registered.
                           <span class="time">Just now</span>
                           </a>
                        </li>
              
                     </ul>
                  </li>
                
               </ul>
            </li>
            <!-- END NOTIFICATION DROPDOWN -->
            <!-- BEGIN INBOX DROPDOWN -->
            <li class="dropdown" id="header_inbox_bar">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                  data-close-others="true">
               <i id="envelope" class="icon-envelope"></i>
               <span id="feedBadge" class="badge">5</span>
               </a>
               <ul  class="dropdown-menu extended inbox">
              
                  <li>
                     <p id="numFeeds"> </p>
                  </li>
                  <li>
                     <ul id="feedInbox" class="dropdown-menu-list scroller" style="height: 250px;">
                      
         
                     </ul>
                  </li>
               
        
               </ul>
            </li>
            <!-- END INBOX DROPDOWN -->
     
            <!-- BEGIN USER LOGIN DROPDOWN -->
            <li class="dropdown user">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
               <img alt="" src="${contextPath}/assets/img/avatar1_small.jpg"/>
               
               <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_AGENT')"> 
               <span class="username"> <sec:authentication property="name" /> </span>
               </sec:authorize>
               
               <i class="icon-angle-down"></i>
               </a>
               <ul class="dropdown-menu">
                  <li><a href="/BO/locationGlobal"><i class="icon-user"></i>Etat global</a>
                  </li>
                   <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                  <li><a href="/BO/stats"><i class="icon-tasks"></i>Statistiques</a>
                  </li>
                  </sec:authorize>
                  
                  <li class="divider"></li>
                
                  <li><a href="javascript:;" id="trigger_fullscreen"><i class="icon-move"></i> Full Screen</a>
                  </li>
                  
                  
                  <li><a href="/logout"><i class="icon-key"></i> Log Out</a>
                  </li>
               </ul>
            </li>
            <!-- END USER LOGIN DROPDOWN -->
         </ul>
         <!-- END TOP NAVIGATION MENU -->
      </div>
      <!-- END TOP NAVIGATION BAR -->
   </div>
   <!-- END HEADER -->
</body>
</html>
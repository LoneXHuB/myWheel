<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<title>myWheel Agency</title>
<link href="${contextPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${contextPath}/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="${contextPath}/js/jquery.min.js"></script>
<!--<script src="js/jquery.easydropdown.js"></script>-->
<!--start slider -->
<link rel="stylesheet" href="${contextPath}/css/fwslider.css" media="all">
<script src="${contextPath}/js/jquery-ui.min.js"></script>
<script src="${contextPath}/js/fwslider.js"></script>
<!--end slider -->
<script type="text/javascript">
        $(document).ready(function() {
           
		$("#close").click(function(){
			console.log("closing dropDown ...");
			$("#drop").hide("fast");
		});
		$("#icon").hover(function(){
			$("#drop").show("fast");
		});
      
        });
     </script>
	<div class="header">
		<div class="container">
			<div class="row">
			  <div class="col-md-12">
				 <div class="header-left">
					 <div class="logo">
						<a href="/"><img src="${contextPath}/images/logo.png" alt=""/></a>
					 </div>
					 <div class="menu">
						  <a class="toggleMenu" href="#"><img src="${contextPath}/images/nav.png" alt="" /></a>
						    <ul class="nav" id="nav">
						    	<li><a href="/shop">Reserver</a></li>
						    	<li><a href="/team">Team</a></li>
						    	
							  	<li><a href="/contact">Avis/Contacte</a></li>
							  		<li><a href="/#newsLetter">newsLetter</a></li>
							  		  <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_AGENT')">
							  		  	<li><a href="/BO/locationGlobal">BackOffice</a></li>
							  		  	</sec:authorize>
								<div class="clear"></div>
							</ul>
							<script type="text/javascript" src="js/responsive-nav.js"></script>
				    </div>
	    		    <div class="clear"></div>
	    	    </div>
	            <div class="header_right">
	    		
	    		
				    <ul class="icon1 sub-icon1 profile_img">
					 <li><a id="icon" class="active-icon c1" href="#"></a>
						<ul id="drop" class="sub-icon1 list">
						  <div class="product_control_buttons">
						
						    <sec:authorize access="hasRole('ROLE_CLIENT')">
						    
						 <a href="/editProfile">Modifier<img src="${contextPath}/images/edit.png" alt=""/></a>
						  </sec:authorize>
						  	
						  		<a id="close" ><img src="${contextPath}/images/close_edit.png" alt=""/></a>
						  </div>
						   <div class="clear"></div>
						  <li class="list_img"><img src="${contextPath}/images/1.jpg" alt=""/></li>
						  
						  <li class="list_desc"><h4>
						  
						  
						  
						   <sec:authorize access="isAnonymous()">
						  <a href="#">Bienvenue</a>
						  </sec:authorize>
						  <sec:authorize access="hasAnyRole('ROLE_CLIENT','ROLE_ADMIN','ROLE_AGENT')">
						  <a href="#"><sec:authentication property="name" /></a>	 
						  </sec:authorize>
						   </h4>
						   
						  <sec:authorize access="hasAnyRole('ROLE_CLIENT','ROLE_ADMIN')"> 
						  <span class="actual">Bienvenue a vous!</span>
						  </sec:authorize>
						  
						  </li>
						  <div class="login_buttons">
						      
                          <sec:authorize access="isAnonymous()">
							 <div class="check_button"><a href="/register">Inscription</a></div>	
							 <div class="login_button"><a href="/login">Connexion</a></div>	
							 </sec:authorize>
							 	 						      
							  <sec:authorize access="hasRole('ROLE_CLIENT')">
							  <div class="check_button"><a href="/checkout">Reservations</a></div>	
							 <div class="login_button"><a href="/logout">Déconnexion</a></div>
							  </sec:authorize>
							 <div class="clear"></div>
						  </div>
						  <div class="clear"></div>
						</ul>
					 </li>
				   </ul>
		           <div class="clear"></div>
	       </div>
	      </div>
		 </div>
	    </div>
	</div>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
          <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
       <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
           <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Agence myWheel</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
        $(document).ready(function() {

            $(".dropdown img.flag").addClass("flagvisibility");

            $(".dropdown dt a").click(function() {
                $(".dropdown dd ul").toggle();
            });

            $(".dropdown dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdown dt a span").html(text);
                $(".dropdown dd ul").hide();
                $("#result").html("Selected value is: " + getSelectedValue("sample"));
            });

            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).bind('click', function(e) {
                var $clicked = $(e.target);
                if (! $clicked.parents().hasClass("dropdown"))
                    $(".dropdown dd ul").hide();
            });


            $("#flagSwitcher").click(function() {
                $(".dropdown img.flag").toggleClass("flagvisibility");
            });
        });
     </script>
 </head>
<body>
   <jsp:include page="nav.jsp"/>
     <div class="main">
      <div class="shop_top">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
				  <div class="map">
					<iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12814.381130889873!2d2.9077774!3d36.5879696!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x250cef391f78e898!2sSERMO+Machines!5e0!3m2!1sen!2sdz!4v1528037774067"></iframe><br><small><a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265" style="color:#666;text-align:left;font-size:12px"></a></small>
				  </div>
				</div>
				<div class="col-md-5">
					<p class="m_8">L'agence myWheel est a votre service a tout moment , n'hésitez pas a nous contacter pour en savoir plus sur nos offres et nos services </p>
					<div class="address">
				                <p>29 rue boukhadouni bachir Boufarik , BLIDA</p>
						   		<p>09400 Zone BP63G, Delight !</p>
						   		<p>ALGERIA</p>
				   		<p>Phone:(0) 551 870 897</p>
				   		<p>Fax: (000) 000 00 00 0</p>
				 	 	<p>Email: <span>khelifi.louness@live.com</span></p>
				   		<p>Follow on: <span>Facebook</span>, <span>Twitter</span></p>
				   </div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 contact">
				  <form:form method="post" modelAttribute="feed" action="/contact">
					<div class="to">
                     	<form:input required="remplissez ce champ S.V.P" type="text"	path="nomClient" class="text" placeholder="Name" onfocus="this.placeholder = '';" onblur="if (this.placeholder == '') {this.placeholder = 'Name';}"/>
					 	<form:input required="remplissez ce champ S.V.P" type="text" path='subject' class="text" placeholder="Subject" onfocus="this.placeholder = '';" onblur="if (this.placeholder == '') {this.placeholder = 'Subject';}"/>
					</div>
					<div class="text">
	                   <form:textarea path="message" required="remplissez ce champ S.V.P" value="Message:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}"></form:textarea>
	                   <div class="form-submit">
			           <input name="submit" type="submit" id="submit" value="Submit"/><br>
			           </div>
	                </div>
	                <div class="clear"></div>
                   </form:form>
			     </div>
		    </div>
	     </div>
	   </div>
	  </div>
	 
	 <jsp:include page="footer.jsp"/>
</body>
</html>

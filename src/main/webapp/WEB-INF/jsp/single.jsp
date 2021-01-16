<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Agence myWheel</title>
<link href="${contextPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${contextPath}/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="${contextPath}/js/jquery.min.js"></script>
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
     <!----details-product-slider--->
				<!-- Include the Etalage files -->
					<link rel="stylesheet" href="${contextPath}/css/etalage.css">
					<script src="${contextPath}/js/jquery.etalage.min.js"></script>
				<!-- Include the Etalage files -->
				<script>
						jQuery(document).ready(function($){
			
							$('#etalage').etalage({
								thumb_image_width: 300,
								thumb_image_height: 400,
								
								show_hint: true,
								click_callback: function(image_anchor, instance_id){
									alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
								}
							});
							// This is for the dropdown list example:
							$('.dropdownlist').change(function(){
								etalage_show( $(this).find('option:selected').attr('class') );
							});

					});
				</script>
				<!----//details-product-slider--->	
</head>
<body>
	<jsp:include page="nav.jsp"/>
     <div class="main">
      <div class="shop_top">
		<div class="container">
			<div class="row">
				<div class="col-md-9 single_left">
				   <div class="single_image">
					     <ul id="etalage">
							<li>
								<a href="#">
									<img style="height:auto !important;" class="etalage_thumb_image" src="${contextPath}/images/cars/${vehicule.imagePath}" />
									<img style="height:auto !important;" class="etalage_source_image" src="${contextPath}/images/cars/${vehicule.imagePath}" />
								</a>
							</li>
							
						</ul>
					    </div>
				        <!-- end product_slider -->
				        <div class="single_right">
				        	<h3>${vehicule.model}</h3>
				        	<p class="m_10">
				        	<strong>Categorie : </strong>${vehicule.categorie}<br>
				        	<strong>Marque : </strong>${vehicule.marque}<br>
				        	<strong>Kilometrage : </strong>${vehicule.km}<br>
				        	<strong>Prix de location par jour : </strong>${vehicule.plj}<br>
				        	<strong>Prix de location par heure : </strong>${vehicule.plh}<br>
				        	<strong>Energie : </strong>${vehicule.energie}<br>
				        	<strong>Boite : </strong>${vehicule.boite}<br>
				        	</p>
				        	
				        	
				        	<ul class="add-to-links">
    			              <li><img src="${contextPath}/images/wish.png" alt=""><a href="#">Add to wishlist</a></li>
    			            </ul>
							<div class="social_buttons">
								<h4>95 Items</h4>
								<button type="button" class="btn1 btn1-default1 btn1-twitter" onclick="">
					              <i class="icon-twitter"></i> Tweet
					            </button>
					            <button type="button" class="btn1 btn1-default1 btn1-facebook" onclick="">
					              <i class="icon-facebook"></i> Share
					            </button>
					             <button type="button" class="btn1 btn1-default1 btn1-google" onclick="">
					              <i class="icon-google"></i> Google+
					            </button>
					            <button type="button" class="btn1 btn1-default1 btn1-pinterest" onclick="">
					              <i class="icon-pinterest"></i> Pinterest
					            </button>
					        </div>
				        </div>
				        <div class="clear"> </div>
				</div>
				
				<div class="col-md-3">
				  <div class="box-info-product">
				 
				 
				  <form:form  action="/single/${vehicule.idVehicule}/reserver" method="post" modelAttribute="reservation" onInput="out.value=(select.value*${vehicule.plj})+'DZD'">
					<p class="price2"><output name="out" for="numDays">${vehicule.plj}DZD</output></p>
					       <ul class="prosuct-qty">
					       
								<span>nombre de jours:</span>
								
								<select name="select" id="select" >
								<option selected="selected" value="1">1</option>
								<c:forEach begin="2" end="30" var="numDays">
									<option value="${numDays}">${numDays}</option>
									</c:forEach>
								</select>
								
								
								<span>Date de Debut: <strong> ${sessionScope.reservation.dateD}</strong> </span>
								<span>Date de Fin: <strong> ${sessionScope.reservation.dateR}</strong> </span>
								
							</ul>
							<button type="submit" name="Submit" class="exclusive">
							   <span>reserver</span>
							</button>
							</form:form>
				   </div>
			   </div>
			</div>		
		
			<div class="row">
			<h4 class="m_11">Raccourci Reservation rapide</h4>
			<c:forEach items="${randomVehicules}" var="randomV" >
				
				<div class="col-md-4">
					<img src="${contextPath}/images/${randomV.imagePath}" class="img-responsive" alt=""/> 
					<div class="shop_desc"><a href="single.html">
						</a><h3><a href="single.html"></a><a href="#">${randomV.model}</a></h3>
						<p>pas de description vehicule disponible </p>
						<span class="reducedfrom">${randomV.plj}DZD</span>
						
						<ul class="buttons">
							<li class="cart"><a href="/single/${randomV.idVehicule}?dateD=${sessionScope.filter.dateD}&dateR=${sessionScope.filter.dateR}&timeD=${sessionScope.filter.timeD}&timeR=${sessionScope.filter.timeR}&type=${sessionScope.filter.typeReservation}">info</a></li>
							<li class="shop_btn"><a href="/single/${randomV.idVehicule}?dateD=${sessionScope.filter.dateD}&dateR=${sessionScope.filter.dateR}&timeD=${sessionScope.filter.timeD}&timeR=${sessionScope.filter.timeR}&type=${sessionScope.filter.typeReservation}"> infos</a></li>
							<div class="clear"> </div>
					    </ul>
				    </div>
				</div>
				</c:forEach>
			
			
			</div>	
	     </div>
	   </div>
	  </div>
	

	 <jsp:include page="footer.jsp"/>

</body>	
</html>
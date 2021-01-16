<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Agence myWheel</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="js/jquery.min.js"></script>
<script src="${contextPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
        $(document).ready(function() {
        	$("#success").hide();
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
        function annulerReservation(id){
        	console.log("callingId="+id);
        	$.ajax({
                type: "GET",
                url: "/cart/remove",
                data: { id : id},
                contentType: "application/json;charset=utf-8",
                dataType: "json",
               
                success: function (result) {
                	var getter = "#"+id ;
           		   	console.log("inside reload function! ");
                    if(result)
                    	{
           		   	$( getter ).hide("fast"); 
           			$("#success").removeClass();
                	$("#success").addClass("alert alert-success");
           		    $("#success").show("slow");
           		    $("#success").empty();
                    $("#success").append("<strong> Succès!</strong> la réservation a été annulée");
                    	}
                    else{
                    	$(document).scrollTop( $("#success").offset().top );
                    	$("#success").removeClass();
                    	$("#success").addClass("alert alert-danger");
                    	$("#success").show("slow");
                     	$( getter ).hide("fast"); 
               		    $("#success").empty();
                        $("#success").append("<strong> Alert!</strong> la réservation n'a pas été annulée");
                    }
                }
                ,
                error: function (response) {

                    alert('Ene erreur est survenue , Veuillez rafrechir la page et reéssayer svp!');
                }
            });
        	
        }
     </script>
 </head>
<body>
 <jsp:include page="nav.jsp"/>
 
 <c:if test="${error==true }">
 <div id="fail" style="text-align:center;" class="alert alert-danger">
  <strong> Attention!</strong> votre réservation n'a pas été effectuée.
 </div>
 </c:if>
 
 <div id="success" style="text-align:center;" class="alert alert-success">
 <c:choose>
 <c:when test="${success}">
                        <strong> Félicitations!</strong> votre réservation a été effectuée.
                    
                     </c:when>
                     </c:choose>
                     </div>         
                     
     <div class="main">
      <div class="shop_top">
		<div class="container">
		
		<c:choose>
		<c:when test="${numReservation == 0}">
			<h4 class="title">Vous n'avez Aucune Reservation</h4>
			<p class="cart">Veuillez visiter la page de reservation.<br>Cliquez<a href="/shop"> ici</a> pour faire des reservations.</p>
			</c:when>
			<c:otherwise>
			
			<h4 class="title">Vos Reservations :</h4>
			
							<c:forEach begin="0" end="${(numVehicules/4) }" var="row">
	               <div class="row shop_box-top">
						
						<c:forEach begin="${row*4}" end="${(row*4)+3 }" items="${vPage}" var="Vehicule" varStatus="loop">	
						
				<div class="col-md-3 shop_box" id="${cart[loop.index].id}"><a href="#">
					<img src="${contextPath}/images/cars/${Vehicule.imagePath}" class="img-responsive" alt="carPic"/>
					
					<div class="shop_desc">
						<h3><a href="#">${Vehicule.model}</a></h3>
						<p>${Vehicule.marque} </p>
						<p>date debut : ${cart[loop.index].dateD} </p>
						<c:if test="${ cart[loop.index].timeR == '' }">
						<p>date fin : ${cart[loop.index].dateR} </p>
						</c:if>
						<c:if test="${ cart[loop.index].dateR == '' }">
						<p>temps debut : ${cart[loop.index].timeD} </p>
						<p>temps fin : ${cart[loop.index].timeR} </p>
						</c:if>
						<span class="actual">${Vehicule.plj}</span><br>
						<ul class="buttons">
							<li class="cart"><c:if test="${ cart[loop.index].state == 'en Attente'}"><a data-toggle="modal" data-target="#static${reservation.id}" href="#static${reservation.id}" >Annuler Reservation</a>
							</c:if>
							<c:if test="${ cart[loop.index].state != 'en Attente'}">
							<h4 style="color:green;">${cart[loop.index].state}</h4>
							</c:if>
							</li>
							
							<div class="clear"> </div>
							                     		                                 
 					  <!-- /////////////////////BEGIN POP UP ///////////////////////// -->
              
 					<div id="static${cart[loop.index].id}" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" style="display: none;" aria-hidden="true">
                        <div class="modal-dialog">
                           <div class="modal-content">
                              <div style="background-color:black" class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                 <h4 style="color:white"class="modal-title">Confirmation</h4>
                              </div>
                              <div class="modal-body">
                                 <p>Voulez-vous vraiment annuler la réservation ?</p>
                              </div>
                              <div class="modal-footer">
                                 <button type="button" data-dismiss="modal" class="btn default">Retour</button>
                                 <button type="button" data-dismiss="modal" onClick="annulerReservation('${cart[loop.index].id}');" class="btn green">Confirmer</button>
                              </div>
                           </div>
                        </div>
                     </div>
                                                
                          <!-- /////////////////////END POP UP ///////////////////////// -->
                      
					    </ul>
				    </div>
				</a></div>
			
				</c:forEach>
					</div>
					</c:forEach>
					
					
			</c:otherwise>
			</c:choose>
	
	     </div>
	   </div>
	  </div>
	  
	  <jsp:include page="footer.jsp"/>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
       <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
           <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<script src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#success").hide();
});

function annulerReservation(id){
	console.log("callingId="+id);
	$.ajax({
        type: "GET",
        url: "/cart/remove",
        data: { id : id},
        contentType: "application/json;charset=utf-8",
        dataType: "json",
       
        success: function (removed) {
        	var getter = "#"+id ;
   		   	console.log("inside reload function! ");
            if(removed)
            	{
   		   	$(getter).hide("fast");
   		   	
   		 $("#success").slideUp("slow",function(){
   			$("#success").removeClass();
        	$("#success").addClass("alert alert-success");
   		    $("#success").show("slow");
   		    $("#success").empty();
            $("#success").append("<strong> Succès!</strong> la réservation a été annulée");
   				});
            	}
            else{
            	$("#success").slideUp("slow",function(){
            		$("#success").removeClass();
                	$("#success").addClass("alert alert-danger");
                	$("#success").show("slow");
           		    $("#success").empty();
                    $("#success").append("<strong> Alert!</strong> la réservation n'a pas été annulée");
                
            	});
            	}
        
        }
        ,
        error: function (response) {

            alert('Ene erreur est survenue , Veuillez rafrechir la page et reéssayer svp!');
        }
    });
							}
							
//////////////////////////////////RENDRE VEHICULE///////////////////////////////////////////////////////
var newKm;
function updateNewKm(newNewKm){
	newKm=newNewKm;
}

function rendreVehicule(id){
	
	
	
	console.log("newKm="+newKm);
	console.log("callingId="+id);
	
	$.ajax({
        type: "GET",
        url: "/cart/returnVehicule",
        data: { id : id , newKm : newKm},
        contentType: "application/json;charset=utf-8",
        dataType: "json",
       
        success: function (statChanged) {
        	var getter = "#"+id+"state" ;
       		var btnGetter ="#btn"+ id;
        	
   		   	console.log("inside reload function! ");
   		  
            if(statChanged)
            	{
   		   
   		
   		   $(getter).slideUp("slow",function(){
   			   $(getter).removeClass();
   	   		   $(getter).addClass("label label-danger label-sm");
   	   		   $(getter).text("Rendu");
   			   $(getter).slideDown("slow");
   		
   		   });
   		 $(btnGetter).slideUp("slow",function(){
 			   $(btnGetter).removeClass();
 	   		   $(btnGetter).addClass("btn grey");
 	   		   $(btnGetter).prop("disabled" , true);

 			   $(btnGetter).slideDown("slow");
 		   });
   		   
   		   $("#success").slideUp("slow",function(){
   			$("#success").removeClass();
        	$("#success").addClass("alert alert-success");
   		    $("#success").show("slow");
   		    $("#success").empty();
            $("#success").append("<strong> Succès!</strong> le véhicule a été rendu");
   				});
            	}
            else{
            	$("#success").slideUp("slow",function(){
            		$("#success").removeClass();
                	$("#success").addClass("alert alert-danger");
                	$("#success").show("slow");
           		    $("#success").empty();
                    $("#success").append("<strong> Alert!</strong> le véhicule n'a pas été rendu");
                
            	});
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
	<jsp:include page="BOHeader.jsp"/>
	
	
   <div class="clearfix"></div>
   <!-- BEGIN CONTAINER -->
   <div class="page-container">
      <!-- BEGIN SIDEBAR -->
      <div class="page-sidebar navbar-collapse collapse">
         <!-- BEGIN SIDEBAR MENU -->
         <ul class="page-sidebar-menu">
            <li>
               <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
               <div class="sidebar-toggler hidden-phone"></div>
               <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            </li>
                
               <sec:authorize access="hasRole('ROLE_ADMIN')"> 
            <li class="start ">
               <a href="/BO/stats">
               <i class="icon-home"></i>
               <span class="title">Statistiques</span>
               </a>
            </li>
            </sec:authorize>
            
            <li >
               <a href="javascript:;">
               <i class="icon-cogs"></i>
               <span class="title">Gérer Dépots</span>
               <span class="selected"></span>
               <span class="arrow open"></span>
               </a>
               <ul class="sub-menu">
                  <li >
                     <a href="/BO/addVehicule">
                     <span class="badge badge-roundless badge-important">new</span>Ajouter véhicule</a>
                  </li>
                 
                  <li >
                     <a href="/BO/removeVehicule">
                     Supprimer véhicule</a>
                  </li>
                   <sec:authorize access="hasRole('ROLE_AGENT')"> 
                  <li  >
                     <a href="/BO/editDep">
                     Modifier infos dépot</a>
                  </li>
                  </sec:authorize>
                    <li   >
                     <a href="/BO/depStat">
                     Etablir l'etat d'un dépot</a>
                  </li>
                  

               </ul>
            </li>
              <sec:authorize access="hasRole('ROLE_ADMIN')"> 
            <li class="tooltips" >
               <a href="/BO/editVehicule">
               <i class="icon-gift"></i>
               <span class="title">Gérer les véhicules</span>
               </a>
            </li>
            </sec:authorize>
          
           <li >
               <a class="" href="javascript:;">
               <i class="icon-leaf"></i>
               <span class="title">Gérer Comptes</span>
               <span class="arrow "></span>
               </a>
               <ul class="sub-menu">
                <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                  <li   >
                     <a href="javascript:;">
                     Gérer comptes agents
                     <span class="arrow"></span>
                     </a>
                     <ul class="sub-menu">
                        <li ><a href="/BO/registerAgent">Ajouter agent</a></li>
                        <li><a href="/BO/removeAgent">Retirer agent</a></li>
                         <li  class="active"><a href="/BO/blockAgent">Bloquer/Débloquer agent</a></li>
                       
                       
                     </ul>
                  </li>
                  </sec:authorize>
                  
                  <li >
                     <a  href="javascript:;">
                    Gérer comptes clients
                     <span class="arrow"></span>
                     </a>
                     <ul class="sub-menu">
                        <li  ><a href="/BO/registerClient">Ajouter client</a></li>
                        <li><a href="/BO/removeClient">Retirer client</a></li>
						 <li ><a href="/BO/blockClient">Bloquer/Debloquer client</a></li>       
	               </ul>
                  </li>
                 
               </ul>
            </li>
            
            
             <li  class="active">
               <a href="javascript:">
               <i class="icon-sitemap"></i>
               <span class="title">Gérer Locations</span>
               <span class="arrow "></span>
               </a>
            
              <ul class="sub-menu">
                <li class="">
                     <a href="/BO/locationGlobal">
						Etablir l'état global
                     </a>
                  </li>
                   <li  class="active" >
                     <a href="/BO/location">
						Etablir l'état de locations client
                     </a>
                  </li>
             
                 
           
               </ul>
            </li>
      
    </ul>
         <!-- END SIDEBAR MENU -->
    
      </div>
      <!-- END SIDEBAR -->
      <!-- BEGIN PAGE -->
      <div class="page-content">
         <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
         <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                     <h4 class="modal-title">Modal title</h4>
                  </div>
                  <div class="modal-body">
                     Widget settings form goes here
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn blue">Save changes</button>
                     <button type="button" class="btn default" data-dismiss="modal">Close</button>
                  </div>
               </div>
               <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
         </div>
         <!-- /.modal -->
         <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
         <!-- BEGIN STYLE CUSTOMIZER -->
         <div class="theme-panel hidden-xs hidden-sm">
            <div class="toggler"></div>
            <div class="toggler-close"></div>
            <div class="theme-options">
               <div class="theme-option theme-colors clearfix">
                  <span>THEME COLOR</span>
                  <ul>
                     <li class="color-black current color-default" data-style="default"></li>
                     <li class="color-blue" data-style="blue"></li>
                     <li class="color-brown" data-style="brown"></li>
                     <li class="color-purple" data-style="purple"></li>
                     <li class="color-grey" data-style="grey"></li>
                     <li class="color-white color-light" data-style="light"></li>
                  </ul>
               </div>
               <div class="theme-option">
                  <span>Layout</span>
                  <select class="layout-option form-control input-small">
                     <option value="fluid" selected="selected">Fluid</option>
                     <option value="boxed">Boxed</option>
                  </select>
               </div>
               <div class="theme-option">
                  <span>Header</span>
                  <select class="header-option form-control input-small">
                     <option value="fixed" selected="selected">Fixed</option>
                     <option value="default">Default</option>
                  </select>
               </div>
               <div class="theme-option">
                  <span>Sidebar</span>
                  <select class="sidebar-option form-control input-small">
                     <option value="fixed">Fixed</option>
                     <option value="default" selected="selected">Default</option>
                  </select>
               </div>
               <div class="theme-option">
                  <span>Footer</span>
                  <select class="footer-option form-control input-small">
                     <option value="fixed">Fixed</option>
                     <option value="default" selected="selected">Default</option>
                  </select>
               </div>
            </div>
         </div>
         <!-- END BEGIN STYLE CUSTOMIZER -->
         <!-- BEGIN PAGE HEADER-->
         <div class="row">
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <h3 class="page-title">
                  Gérer Locations <small>gestion des Locations</small>
               </h3>
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i>
                     <a href="/BO/addVehicule">Home</a>
                     <i class="icon-angle-right"></i>
                  </li>
                  <li>
                     <a href="/BO/addVehicule">Gérer Locations</a>
                     <i class="icon-angle-right"></i>
                  </li>
                  <li><a href="/BO/addVehicule">Modifier Etat De Locations</a></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <!-- BEGIN PAGE CONTENT-->
         <div class="row">
            <div class="col-md-12">
                 <div class="row">


            <div class="col-md-12">
                <div id="afficherlistedesvehicules">


                </div>

                <div  id="ajoutervéhicule" style="">
                    <div class="row ">

      <div id="success" style="text-align:center;" class="alert alert-success">
                     </div>         
                          <c:choose>
                <c:when test="${notFound}">
                <div id="danger" style="text-align:center;" class="alert alert-danger">
                        <strong> Alerte!</strong> Utilisateur introuvable.
                    </div>
                     </c:when>
                     </c:choose>

                        <!-- END PAGE CONTENT-->

                            <!-- BEGIN PORTLET-->
                            <div class="portlet box red center-block">
                                <div class="portlet-title line">
                                    <div class="caption"><i class="icon-comments"></i>Etat de Location Client</div>
                                    <div class="tools">
                                        <a href="javascript:;" class="collapse"></a>
                                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    </div>
                                </div>
                                
                                <div class="portlet-body">
                                
                                
                                <form:form modelAttribute="filter"  action="/BO/locationFilter"  method="get"  id='addForm'>
                                       
                                       
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Email Client</label>
                                                <form:input id="email" path="email" type="text" class="form-control" placeholder="Marque"/>
                                            </div>
                                            </div>
                                       
                                      
                                        
                                        
                                  </form:form>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                    
     
                      
                       
                        <!-- END PAGE CONTENT-->
                    </div>
                    
                    
                     <button id="ajoutervehicule" onClick="$('#addForm').submit();" class="col-md-12 btn red">Recherche</button>
                 	 
                
                </div>
					<div class="row">
					
					<div class="table-responsive">
                           <table class="table table-striped table-bordered table-advance table-hover">
                              <thead>
                                 <tr>
                                    <th><i class="icon-briefcase"></i> Nom Client</th>
                                    <th ><i class="icon-question-sign"></i> Model Véhicule</th>
                                    <th ><i class="icon-question-sign"></i> Etat</th>
                                    <th><i class="icon-bookmark"></i> Heure début</th>
                                    <th><i class="icon-bookmark"></i> Heure fin</th>
                                    <th><i class="icon-bookmark"></i> Date début</th>
                                    <th><i class="icon-bookmark"></i> Date fin</th>
                                    <th></th>
                                 </tr>
                              </thead>
                              <tbody>
                               <c:forEach items="${cart}" var="reservation" varStatus="loop">
                                 <tr id="${reservation.id}">
                                    <td>
                                       <a href="#">
                                       ${user.name} ${user.lastName}
                                       </a>  
                                    </td>
                                    
                                      <td>${reservation.vehicule.model}</td>
                                       <td>
                                    <c:if test="${reservation.state == 'en Attente' }">
                                   
                                    <span id="${reservation.id}state" class="label label-warning label-sm">en Attente</span>
                                   </c:if>
                                   <c:if test="${reservation.state == 'Confirmé'}">
                                    <span id="${reservation.id}state" class="label label-success label-sm">Confirmé</span>
                                  </c:if>
                                   <c:if test="${reservation.state == 'Rendue' }">
                                    <span id="${reservation.id}state" class="label label-danger label-sm">Rendue</span>
                                     </c:if>
                                     </td>
                                      <td>${reservation.timeD}</td>
                                    <td>${reservation.timeR}</td>
                                    <td>${reservation.dateD}</td>
                                    <td>${reservation.dateR}</td>
                                  	 <td>
                                    	 <c:if test="${reservation.state == 'en Attente' }">
                                     
                                    <button data-toggle="modal" data-target="#static${reservation.id}" href="#static${reservation.id}" class=" btn red">Annuler</button>
                                    <a id="confirmerPayement" href="/BO/contract/${reservation.id}" class="btn green">Confirmer</a>
                                  		<button id="rendre" onClick="" disabled class="btn grey">Rendre Vehicule</button>
                                    </c:if>
                                    
                                    
                                    	<c:if test="${reservation.state == 'Confirmé' }">  
 									<button data-target="#static${reservation.id}" disabled data-toggle="modal" href="#static${reservation.id}" class=" btn red">Annuler</button>
                                    <button id="${reservation.id}confirm" disabled onClick="" class="btn grey">Confirmer</button>
 									<button data-target="#return${reservation.id}" data-toggle="modal" href="#return${reservation.id}"  id="btn${reservation.id}" onClick="" class="btn yellow">Rendre Vehicule</button>
 									</c:if> 
 									
 									
 									
 									<c:if test="${reservation.state == 'Rendue' }">  
 									<button disabled class=" btn grey">Annuler</button>
                                    <button disabled onClick="" class="btn grey">Confirmer</button>
 									<button  data-target="#return${reservation.id}"  onClick="" disabled class="btn grey">Rendre Vehicule</button>
 									</c:if> 
 									
                                    
                                    	
                                     </td>
                                     		                                 
 					  <!-- /////////////////////BEGIN POP UP ///////////////////////// -->
              
 					<div id="static${reservation.id}" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" style="display: none;" aria-hidden="true">
                        <div class="modal-dialog">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                 <h4 class="modal-title">Confirmation</h4>
                              </div>
                              <div class="modal-body">
                                 <p>Voulez vous retirer la réservation de Mr.${reservation.user.name}?</p>
                              </div>
                              <div class="modal-footer">
                                 <button type="button" data-dismiss="modal" class="btn default">Retour</button>
                                 <button type="button" data-dismiss="modal" onClick="annulerReservation('${reservation.id}');" class="btn green">Confirmer</button>
                              </div>
                           </div>
                        </div>
                     </div>
                                                
                          <!-- /////////////////////END POP UP ///////////////////////// -->
                       
                          <!-- /////////////////////BEGIN POP UP ///////////////////////// -->
              	 <form action="" >	
 					<div id="return${reservation.id}" class="modal fade" tabindex="-1" style="display: none;" aria-hidden="true">
                        <div class="modal-dialog">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                 <h4 class="modal-title">Confirmation</h4>
                              </div>
                              <div class="modal-body">
                                 <p>Veuillez entrer le Kilométrage de retour du véhicule : </p>
                                 <p>Marque: ${reservation.vehicule.marque} </p>
                                 <p>Model: ${reservation.vehicule.model} </p>
                                  <p>kilométrage initial: ${reservation.vehicule.km} </p>
                                
                                   <p><input id="newKm" onInput="updateNewKm(this.value);" class="col-md-12 form-control"  required="Champ Obligatoire" placeHolder='${reservation.vehicule.km}'/></p>  
                              </div>
                              <div class="modal-footer">
                                 <button  type="button" data-dismiss="modal" class="btn default">Retour</button>
                                 <button type="submit" data-dismiss="modal" onClick="rendreVehicule('${reservation.id}');" class="btn green">Rendre</button>
                              </div>
                           </div>
                        </div>
                     </div>
                          </form>                   
                          <!-- /////////////////////END POP UP ///////////////////////// -->
                                 </tr>
                                 
                                 </c:forEach>
                                 
                               
                              </tbody>
                           </table>
                           </div>
					
					</div>
                      

        </div>

        <!-- END PAGE CONTENT-->
    </div>
            </div>
         </div>
         <!-- END PAGE CONTENT-->
      </div>
      <!-- END PAGE -->
   </div>
   <!-- END CONTAINER -->
   <!-- BEGIN FOOTER -->
  <jsp:include page="BOFooter.jsp"/>
   <!-- END FOOTER -->
 
</body>
<!-- END BODY -->
</html>


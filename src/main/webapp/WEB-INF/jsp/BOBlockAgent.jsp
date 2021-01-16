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
	 	


function blockUser(id){
	console.log("callingId="+id);
	$.ajax({
        type: "GET",
        url: "/BO/blockUser",
        data: { id : id},
        contentType: "application/json;charset=utf-8",
        dataType: "json",
       
        success: function (removed) {
        	var getter = "#"+id ;
        	var buttonGetter= getter +"btn";
   		   	console.log("inside reload function! ");
            if(removed)
            	{
   
   		   	$("#stateButton").show("fast");
   		 $(getter).slideUp("slow",function(){
 			   $(getter).removeClass();
 	   		   $(getter).addClass("label label-danger label-sm");
 	   		   $(getter).text("Bloqué");
 			   $(getter).slideDown("slow");
 		
 		   });
   		 $(buttonGetter).slideUp("slow",function(){
			   $(buttonGetter).removeClass();
	   		   $(buttonGetter).addClass("btn btn-block green");
	   		   $(buttonGetter).text("Débloquer");
	   		 $(buttonGetter).attr("onClick", "unblockUser("+id+")" );
			   $(buttonGetter).slideDown("slow");
		   });
   		   
   		 $("#success").slideUp("slow",function(){
   			$("#success").removeClass();
        	$("#success").addClass("alert alert-success");
   		    $("#success").show("slow");
   		    $("#success").empty();
            $("#success").append("<strong> Succès!</strong> le Client a été bloqué");
   				});
            	}
            else{
            	$("#success").slideUp("slow",function(){
            		$("#success").removeClass();
                	$("#success").addClass("alert alert-danger");
                	$("#success").show("slow");
           		    $("#success").empty();
                    $("#success").append("<strong> Alert!</strong> le client n'a pas été bloqué");
                
            	});
            	}
        
        }
        ,
        error: function (response) {

            alert('Ene erreur est survenue , Veuillez rafrechir la page et reéssayer svp!');
        }
    });
							}
		
function unblockUser(id){
	console.log("callingId="+id);
	$.ajax({
        type: "GET",
        url: "/BO/unblockUser",
        data: { id : id},
        contentType: "application/json;charset=utf-8",
        dataType: "json",
       
        success: function (statChanged){
        	var getter = "#"+id ;
        	var buttonGetter= getter+'btn';
        	
   		   	console.log("inside reload function!");
            if(statChanged)
            	{
   		   
   		   	$("#stateButton").show("fast");
   		   $(getter).slideUp("slow",function(){
   			   $(getter).removeClass();
   	   		   $(getter).addClass("label label-success label-sm");
   	   		   $(getter).text("Autorisé");
   			   $(getter).slideDown("slow");
   		
   		   });
   		 $(buttonGetter).slideUp("slow",function(){
 			   $(buttonGetter).removeClass();
 	   		   $(buttonGetter).addClass("btn btn-block red");
 	   		   $(buttonGetter).text("Bloquer");
 	   		   $(buttonGetter).attr("onClick", "blockUser("+id+")");
 			   $(buttonGetter).slideDown("slow");
 		   });
   		   
   		   $("#success").slideUp("slow",function(){
   			$("#success").removeClass();
        	$("#success").addClass("alert alert-success");
   		    $("#success").show("slow");
   		    $("#success").empty();
            $("#success").append("<strong> Succès!</strong> le Client a été débloqué");
   				});
            	}
            else{
            	$("#success").slideUp("slow",function(){
            		$("#success").removeClass();
                	$("#success").addClass("alert alert-danger");
                	$("#success").show("slow");
           		    $("#success").empty();
                    $("#success").append("<strong> Alert!</strong> le client n'a pas été débloqué");
                
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
            
            <li class="">
               <a href="javascript:;">
               <i class="icon-cogs"></i>
               <span class="title">Gérer Dépots</span>
               <span class="selected"></span>
               <span class="arrow open"></span>
               </a>
               <ul class="sub-menu">
                  <li class="">
                     <a href="/BO/addVehicule">
                     <span class="badge badge-roundless badge-important">new</span>Ajouter véhicule</a>
                  </li>
                 
                  <li >
                     <a href="/BO/removeVehicule">
                     Supprimer véhicule</a>
                  </li>
                   <sec:authorize access="hasRole('ROLE_AGENT')"> 
                  <li >
                     <a href="/BO/editDep">
                     Modifier infos dépot</a>
                  </li>
                  </sec:authorize>
                    <li class="" >
                     <a href="/BO/depStat">
                     Etablir l'etat d'un dépot</a>
                  </li>
                  

               </ul>
            </li>
              <sec:authorize access="hasRole('ROLE_ADMIN')"> 
            <li class="tooltips" data-placement="left" data-original-title="Frontend&nbsp;Theme For&nbsp;Metronic&nbsp;Admin">
               <a href="/BO/editVehicule" >
               <i class="icon-gift"></i>
               <span class="title">Gérer les véhicules</span>
               </a>
            </li>
            </sec:authorize>
          
           <li class="active">
               <a class="" href="javascript:;">
               <i class="icon-leaf"></i>
               <span class="title">Gérer Comptes</span>
               <span class="arrow "></span>
               </a>
               <ul class="sub-menu">
                <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                  <li  class="active" >
                     <a href="javascript:;">
                     Gérer comptes agents
                     <span class="arrow"></span>
                     </a>
                     <ul class="sub-menu">
                        <li class="active"><a href="/BO/registerAgent">Ajouter agent</a></li>
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
						 <li><a href="/BO/blockClient">Bloquer/Debloquer client</a></li>       
	               </ul>
                  </li>
                 
               </ul>
            </li>
            
            
             <li class="">
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
                   <li class="">
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
         <div id="success" style="text-align:center;" class="alert alert-success">
                     </div>         
                     
            <div class="col-md-12">
                 <div class="row">


            <div class="col-md-12">
                <div id="afficherlistedesvehicules">


                </div>

                <div  id="ajoutervéhicule" style="">
              

                    
                                <form action="/BO/blockClient"  method="GET"  id='addForm' enctype="multipart/form-data">
     
                                  </form>
                            
               <div class="row">
               
          <button id="ajoutervehicule" onClick="$('#addForm').submit();" class="col-md-4 btn green">Actualiser</button>
                 	 
                      
               </div>
                    
                    
                </div>
					<div class="row">
					<c:choose>
					<c:when test="${numUsers > 0 }">
					<div class="table-responsive">
                           <table class="table table-striped table-bordered table-advance table-hover">
                              <thead>
                                 <tr>
                                 
                                    <th><i class="icon-briefcase"></i> Nom</th>
                                    <th ><i class="icon-question-sign"></i> Prénom</th>
                                     <th ><i class="icon-question-sign"></i> Role</th>
                                    <th><i class="icon-bookmark"></i> Etat</th>
                                    <th></th>
                                 </tr>
                              </thead>
                              <tbody>
                               <c:forEach items="${users}" var="user" varStatus="loop">
                               	
                               	<c:choose>
                               	<c:when test="${user.rol == 'ROLE_AGENT' }">
                                 <tr >
                                    <td>
                                       <a href="#">
                                       ${user.name} 
                                       </a>  
                                    </td>
                                    <td >${user.lastName}</td>
                                      <td>${user.rol}</td>
                                    <td > 
                                    <c:if test="${user.enabled == true }">
                                    <span id="${user.id}" class="label label-success label-sm">Autorisé</span>
                                   </c:if>
                                   <c:if test="${user.enabled == false}">
                                    <span id="${user.id}" class="label label-danger label-sm">Bloqué</span>
                                    </c:if>
                                     </td>
                           	
                                  	<td >
                                  	
                                    <c:if test="${user.enabled== true }">
                                     
                                    	<button id="${user.id}btn" onClick="blockUser('${user.id}');" class="btn btn-block red">Bloquer</button>
                                    
                                    </c:if>
                                    
 									<c:if test="${ user.enabled== false }">  
 									<button id="${user.id}btn" onClick="unblockUser('${user.id}');" id="stateButton"class="btn btn-block green">Débloquer</button>
 									</c:if> 
 									                                 </td>
                                 </tr>
                                 </c:when>
                                 </c:choose>
                                 </c:forEach>
                                 
                               
                              </tbody>
                           </table>
                           </div>
                           </c:when>
                           <c:otherwise>
                           
                           <div id='noteDanger' class='note note-danger'>
          						<h4 class='block'>Aucune Réservation</h4>
          						</div>"
                           
                           
                           </c:otherwise>
					</c:choose>
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


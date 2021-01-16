<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
       <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	updateCategoryList( )
	
    function updateModelList(){
	    	
		
		
	    	var selectedMarque = $('#marque').find(":selected").text();
	    	var selectedCategory = $('#category').find(":selected").text();
	    	
	    	$("#model").empty();
	    	
	  
	    	
	    	$.ajax({
	            type: "GET",
	            url: "/shop/getModelList",
	            data: { marque: selectedMarque , category: selectedCategory },
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function (result) {
	            
	                $("#model").append("<option value='' selected='selected'>Model</option>");
	                $.each(result , function(index, element){
	            	   $("#model").append("<option>"+ element +"</option>");
	               });
	            },
	            error: function (response) {
	               
	                alert('error');
	            }
	        });
	   
	    }function updateMarqueList( ){
	      	
	        
	      	var selectedCategory = $('#category').find(":selected").text();
	     
	      	$("#marque").empty();
	      	
	      	$.ajax({
	              type: "GET",
	              url: "/shop/getMarqueList",
	              data: { category : selectedCategory },
	              contentType: "application/json;charset=utf-8",
	              dataType: "json",
	              success: function (result) {
	              
	                  $("#marque").append("<option value='' selected='selected'>Marque</option>");
	                  $.each(result , function(index, element){
	              	   $("#marque").append("<option>"+ element +"</option>")   
	                 });
	                  updateModelList( );
	              },
	              error: function (response) {
	            	  alert('error');
	              }
	          });
	         

	      }
function updateCategoryList( ){
	      	
	        
	      	var selectedCategory = $('#category').find(":selected").text();
	     
	      	$("#category").empty();
	      	
	      	$.ajax({
	              type: "GET",
	              url: "/shop/getCategoryList",
	             
	              contentType: "application/json;charset=utf-8",
	              dataType: "json",
	              success: function (result) {
	              
	                  $("#category").append("<option value='' selected='selected'>Marque</option>");
	                  $.each(result , function(index, element){
	              	   $("#category").append("<option>"+ element +"</option>")   
	                 });
	                  updateMarqueList( );
	              },
	              error: function (response) {
	            	  alert('error');
	              }
	          });
	         

	      }
	      

	    $("#marque").change(updateModelList);
	    $("#category").change(updateMarqueList);
	    	
	     
	 	
});
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
            
            <li  >
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
                  <li >
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
            <li class="tooltips active">
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
            
            
             <li >
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
                   <li >
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
                  Gérer Vehicules <small>gestion des Vehicules</small>
               </h3>
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i>
                     <a href="/BO/addVehicule">Home</a>
                     <i class="icon-angle-right"></i>
                  </li>
                  <li>
                     <a href="/BO/addVehicule">Dépot</a>
                     <i class="icon-angle-right"></i>
                  </li>
                  <li><a href="/BO/addVehicule">Modifier Vehicule</a></li>
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


                        <!-- END PAGE CONTENT-->

                        <div class="sidebar-content col-md-6 ">

                            <!-- BEGIN PORTLET-->
                            <div class="portlet box red center-block">
                                <div class="portlet-title line">
                                    <div class="caption"><i class="icon-comments"></i>Modifier véhicule</div>
                                    <div class="tools">
                                        <a href="javascript:;" class="collapse"></a>
                                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <h4></h4>
                                       <c:choose>
                                    <c:when test="${successMsg == true }">
								   <div class="note note-success">
                        <h4 class="block">Vehicule modifié avec succes !</h4>
                                    </div>
                                    </c:when>
                                    </c:choose>
                          	          <form:form modelAttribute="vehicule"  action="/BO/editVehicule"  method="post"  id='addForm' enctype="multipart/form-data">
                                       
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Catégorie</label>
                                                <form:select id="category" path="categorie" required="Champ obligatoire" type="text" class="form-control" placeholder="Marque"/>
                                            </div>
                                            </div>
                                             <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Marque</label>
                                                <form:select id="marque" path="marque" required="Champ obligatoire" type="text" class="form-control" placeholder="Marque"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Modèle</label>
                                                <form:select id="model" path="model" required="Champ obligatoire" type="text" class="form-control" placeholder="Modèle"/>
                                            </div>
                                        </div>
                                       
													
                                
                                        
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Nouveau Prix de location par heure</label>
                                                <i class="icon-font"></i>
                                                <form:input id="plh" path="plh" type="number" required="Champ obligatoire" class="form-control" placeholder="Prix de location par heure"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Nouveau Prix de location par jour</label>
                                                <i class="icon-font"></i>
                                                <form:input id="plj"  path="plj" type="number" class="form-control" required="Champ obligatoire" placeholder="Prix de location par jour"/>
                                            </div>
                                        </div>
                                        
                                        
                                        
                                         <script src="${contextPath}/js/jquery.min.js"></script>
                        
                           <script>
                           
                          $("#plj").keyup( function(){
                        	   
                        	   if($("#plh").val()*24 < $("#plj").val() )
                        		   this.setCustomValidity("entrer : plh x 24 > plj");
                        	   else{
                        		   this.setCustomValidity("");
                        	   }
                        	   
                           });
                          
                          $("#plh").keyup( function(){
                       	   
                       	   if($("#plh").val()*24 <= $("#plj").val() )
                       		   this.setCustomValidity("entrer : plh x 24 > plj");
                       	   else{
                       		   this.setCustomValidity("");
                       	   }
                       	   
                          });
                             
                                        </script>
                                        
                                        
                                      
              
                                        <button id="ajoutervehicule" type="submit" class=" btn-block btn red">Modifier</button>
                                      
                                        
                                        
                                  </form:form>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
     
                            <div class="row">
                        </div>
                        
                        <!-- END PAGE CONTENT-->
                    </div>
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
   <!-- END CONTAINER -->
   <!-- BEGIN FOOTER -->
  <jsp:include page="BOFooter.jsp"/>
   <!-- END FOOTER -->
 
</body>
<!-- END BODY -->
</html>


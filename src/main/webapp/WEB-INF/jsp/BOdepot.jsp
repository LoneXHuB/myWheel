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
<head></head>
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
            
            <li class="active">
               <a href="javascript:;">
               <i class="icon-cogs"></i>
               <span class="title">G�rer D�pots</span>
               <span class="selected"></span>
               <span class="arrow open"></span>
               </a>
               <ul class="sub-menu">
                  <li class="active">
                     <a href="/BO/addVehicule">
                     <span class="badge badge-roundless badge-important">new</span>Ajouter v�hicule</a>
                  </li>
                 
                  <li >
                     <a href="/BO/removeVehicule">
                     Supprimer v�hicule</a>
                  </li>
                   <sec:authorize access="hasRole('ROLE_AGENT')"> 
                  <li >
                     <a href="/BO/editDep">
                     Modifier infos d�pot</a>
                  </li>
                  </sec:authorize>
                    <li class="" >
                     <a href="/BO/depStat">
                     Etablir l'etat d'un d�pot</a>
                  </li>
                  

               </ul>
            </li>
              <sec:authorize access="hasRole('ROLE_ADMIN')"> 
            <li class="tooltips" data-placement="left" data-original-title="Frontend&nbsp;Theme For&nbsp;Metronic&nbsp;Admin">
               <a href="/BO/editVehicule" >
               <i class="icon-gift"></i>
               <span class="title">G�rer les v�hicules</span>
               </a>
            </li>
            </sec:authorize>
          
           <li >
               <a class="" href="javascript:;">
               <i class="icon-leaf"></i>
               <span class="title">G�rer Comptes</span>
               <span class="arrow "></span>
               </a>
               <ul class="sub-menu">
                <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                  <li   >
                     <a href="javascript:;">
                     G�rer comptes agents
                     <span class="arrow"></span>
                     </a>
                     <ul class="sub-menu">
                        <li ><a href="/BO/registerAgent">Ajouter agent</a></li>
                        <li><a href="/BO/removeAgent">Retirer agent</a></li>
                         <li  class="active"><a href="/BO/blockAgent">Bloquer/D�bloquer agent</a></li>
                       
                       
                     </ul>
                  </li>
                  </sec:authorize>
                  
                  <li >
                     <a  href="javascript:;">
                    G�rer comptes clients
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
               <span class="title">G�rer Locations</span>
               <span class="arrow "></span>
               </a>
            
              <ul class="sub-menu">
                <li class="">
                     <a href="/BO/locationGlobal">
						Etablir l'�tat global
                     </a>
                  </li>
                   <li >
                     <a href="/BO/location">
						Etablir l'�tat de locations client
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
                  G�rer d�pot <small>gestion des entit�s du d�pot</small>
               </h3>
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i>
                     <a href="/BO/addVehicule">Home</a>
                     <i class="icon-angle-right"></i>
                  </li>
                  <li>
                     <a href="/BO/addVehicule">D�pot</a>
                     <i class="icon-angle-right"></i>
                  </li>
                  <li><a href="/BO/addVehicule">Ajouter V�hicule</a></li>
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

                <div  id="ajouterv�hicule" style="">
                    <div class="row ">


                        <!-- END PAGE CONTENT-->

                        <div class="sidebar-content col-md-6 ">

                            <!-- BEGIN PORTLET-->
                            <div class="portlet box red center-block">
                                <div class="portlet-title line">
                                    <div class="caption"><i class="icon-comments"></i>Ajouter v�hicule</div>
                                    <div class="tools">
                                        <a href="${contextPath}/javascript:;" class="collapse"></a>
                                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <c:choose>
                                    <c:when test="${successMsg == true }">
								   <div class="note note-success">
                        <h4 class="block">Vehicule Ajout� avec succ�s !</h4>
                                    </div>
                                    </c:when>
                                    <c:when test="${successMsg == false }">
                                      <div class="note note-danger">
                        <h4 class="block">Le vehicule n'a pas �t� ajout� !</h4>
                                    </div>
                                    </c:when>
                     				</c:choose>
                                    
                          	          <form:form modelAttribute="vehicule"  action="/BO/addVehicule"  method="post"  id='addForm' enctype="multipart/form-data">
                                        <div class="form-group  ">
                                            <label class="label label-md label-warning">Cat�gorie</label>
                                            <form:input id="categorie" path="categorie" type="text" class="form-control" required="champ obligatoire" placeholder="Categorie"/>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Marque</label>
                                                <i class="icon-font"></i>
                                                <form:input id="marque" path="marque" type="text" class="form-control" required="champ obligatoire" placeholder="Marque"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Mod�le</label>
                                                <i class="icon-font"></i>
                                                <form:input id="mod�le" path="model" type="text" class="form-control" required="champ obligatoire" placeholder="Mod�le"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="label label-md label-warning">Depot</label>
                                           
											<form:select path="depot" id="depot" class="form-control  input">
                                          
                                           	<c:forEach items='${listDep}' var="dep" varStatus="loop">
                                           	<option value="${dep.idDepot}"> ${dep.name} </option>
                                           	</c:forEach>
                                           	
                                            </form:select>
                                         
                                        </div>
                                        
										<script src="${contextPath}/cleave/cleave-phone.dz.js" type="text/javascript"></script>
   										<script src="${contextPath}/cleave/cleave.min.js" type="text/javascript"></script>
                                        <div class="form-group">
                                            <div class="input-icon">         
                                                <label class="label label-md label-warning">Matricule</label>
                                               <h3 style="color:red;">${message2}</h3>
                                                <i class="icon-font"></i>
                                                <form:input id="matricule" path="matricule" type="text" class="form-control" required="champ obligatoire" placeholder="Matricule"/>
                                            </div>
                                        </div>
                                     
													
                                        <div class="form-group">
                                            <label class="label label-md label-warning">Energie</label>
                                            <form:select path="energie" id="energie" class="form-control  input">
                                                <option value="essence" >Essence</option>
                                                <option value="diesel" >Diesel</option>
                                                <option value="gpl" >Gpl</option>
                                            </form:select>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Puissance</label>
                                                <i class="icon-font"></i>
                                                <form:input id="puissance" path="puissance" type="number" class="form-control" required="champ obligatoire" placeholder="Puissance"/>
                                           
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Couleur</label>
                                                <i class="icon-font"></i>
                                                <form:input id="couleur" path="couleur" type="text" class="form-control" required="champ obligatoire" placeholder="Couleur"/>
                                            </div>
                                        </div>
                                        <div class="form-group  ">
                                            <label class="label label-md label-warning">Boite</label>
                                            
                                            <select id="boite" path="boite" class="form-control select2-container input">
                                                <option value="auto" >Auto</option>
                                                <option value="manuel" >Manuel</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Prix de location par heure</label>
                                                <i class="icon-font"></i>
                                                <form:input id="plh" path="plh" type="number"  class="form-control numeric" required="champ obligatoire" placeholder="Prix de location par heure"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Prix de location par jour</label>
                                                <i class="icon-font"></i>
                                                <form:input id="plj"  path="plj" type="number"  class="form-control numeric" required="champ obligatoire" placeholder="Prix de location par jour"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Kilom�trage</label>
                                                <i class="icon-font"></i>
                                                <form:input id="km" path="km" type="number" class="form-control numeric" required="champ obligatoire" placeholder="Kilom�trage"/>
                                            </div>
                                        </div>
                                        <div class="form-group  ">
                                            <label class="label label-md label-warning">Etat</label>
                                            <form:select id="etat" path="etat" class="form-control select2-container input">
                                                <option value="r�serv�" >r�serv�</option>
                                                <option value="libre" >Libre</option>
                                                <option value="enpanne" >En panne</option>
                                            </form:select>
                                        </div>
                                        
                                        <div class="form-group  ">
                                           <label class="label label-md label-warning">Image</label>
                                   			<h3 style="color:red;">${message}</h3>
                                
                                           
                                           
                                         <span class="btn green fileinput-button">
                        					<i class="icon-plus"></i>
                        					<span>Ajouter image...</span>
                       						 <input name="file" type="file">
                        				</span>  
                        				
                        				
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
                                  
                           
                                        var cleave2= new Cleave ('#matricule',{
                                        	delimiters: [ '/' , '/' ],
                                        	numericOnly: true ,
                                        	blocks: [5,3,2]
                                        });
                                        var cleave = new Cleave('.numeric', {

                                            numericOnly: true

                                        });
                                       
                                      
                                        </script>
                                           
                                           
                                       </div>
                                         <button id="ajoutervehicule" type='submit' class=" btn-block btn red">Ajouter</button>
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
   </div>
   <!-- END CONTAINER -->
   <!-- BEGIN FOOTER -->
  <jsp:include page="BOFooter.jsp"/>
   <!-- END FOOTER -->
 
</body>
<!-- END BODY -->
</html>


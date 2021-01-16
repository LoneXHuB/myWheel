<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
          <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<jsp:include page="BOHeader.jsp"/>

   <div class="clearfix"></div>
   
   
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
            <li class="start">
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
               <a href="/BO/editVehicule" target="_blank">
               <i class="icon-gift"></i>
               <span class="title">Gérer les véhicules</span>
               </a>
            </li>
            </sec:authorize>
          
           <li class="">
               <a class="" href="javascript:;">
               <i class="icon-leaf"></i>
               <span class="title">Gérer Comptes</span>
               <span class="arrow "></span>
               </a>
               <ul class="sub-menu">
                <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                  <li>
                     <a href="javascript:;">
                     Gérer comptes agents
                     <span class="arrow"></span>
                     </a>
                     <ul class="sub-menu">
                        <li class=""><a href="/BO/registerAgent">Ajouter agent</a></li>
                        <li><a href="/BO/removeAgent">Retirer agent</a></li>
                         <li><a href="/BO/blockAgent">Bloquer/Débloquer agent</a></li>
                       
                       
                     </ul>
                  </li>
                  </sec:authorize>
                  
                  <li>
                     <a href="javascript:;">
                    Gérer comptes clients
                     <span class="arrow"></span>
                     </a>
                     <ul class="sub-menu">
                        <li><a href="/BO/registerClient">Ajouter client</a></li>
                        <li><a href="/BO/removeClient">Retirer client</a></li>
						 <li><a href="/BO/blockClient">Bloquer/Debloquer client</a></li>       
	               </ul>
                  </li>
                 
               </ul>
            </li>
            
            
             <li class="active">
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
                   <li class="active">
                     <a href="/BO/location">
						Etablir l'état de locations client
                     </a>
                  </li>
             
                 
           
               </ul>
            </li>
      
    </ul>
         <!-- END SIDEBAR MENU -->
    
      </div>
         
       
      <!-- END PAGE --> 
         <!-- END SIDEBAR MENU -->
    <div class="page-content">
   <!-- BEGIN CONTAINER -->   
   <div class="container" style="    margin-top: 30px;" >
      <!-- BEGIN EMPTY PAGE SIDEBAR -->
  
      <!-- END EMPTY PAGE SIDEBAR -->
      <!-- BEGIN PAGE -->
       
            <!-- BEGIN PAGE HEADER-->
         <div class="row hidden-print">
            <div class="col-md-12">
             <c:choose>
                <c:when test="${success}">
                <div id="success" style="text-align:center;" class="alert alert-success">
                        <strong> Succès!</strong>La reservation a été Confirmé.
                    </div>
                     </c:when>
                     </c:choose>
                     <c:choose>
                <c:when test="${error}">
                <div id="danger" style="text-align:center;" class="alert alert-danger">
                        <strong> Alerte!</strong> La reservation n'a pas été Confirmé.
                    </div>
                     </c:when>
                     </c:choose>
                     </div>  
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <h3 class="page-title">
                  FACTURE
               </h3>
               <ul class="page-breadcrumb breadcrumb">
                 
                  <li>
                     <i class="icon-home"></i>
                     <a href="/BO/addVehicule">home</a> 
                     <i class="icon-angle-right"></i>
                  </li>
                  <li>
                     <a href="/BO/locationGlobal">Gérer Location</a>
                     <i class="icon-angle-right"></i>
                  </li>
                  <li><a href="#">Facture</a></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <!-- BEGIN PAGE CONTENT-->
         <div class="invoice">
            <div class="row invoice-logo">
               <div class="col-xs-6 invoice-logo-space"><img src="assets/image/Copie de My (1).png" alt="" style="width: 250px;height:100px" /> </div>
               <div class="col-xs-6">
                  <p> 28 Feb 2013 </p>
               </div>
            </div>
            <div class="row invoice-logo">
               <div class="col-xs-12">
                 
                <p style="text-align: center;font-size: 2em;font-weight: bolder;">Agence de location de véhicules myWheel </p>
                  <p style="text-align: center;font-size: 1.5em;font-weight: bolder;">Facture </p>
               </div>
            </div>
            <hr />
            <div class="row">
               <div class="col-xs-4">
                  <h4>Client:</h4>
                  <ul class="list-unstyled">
                     <li>${user.name} ${user.lastName}<li>
                     <li>${user.email}</li>
                     <li>${user.mobile}</li>
                     <li>${user.depot.name}</li>
                     <li>${user.numPermit}</li>
                   
                  </ul>
               </div>
               <div class="col-xs-4">
                  <h4>About:</h4>
                  <ul class="list-unstyled">
                     <li>la confirmation de la location</li>
                     <li>est irréversible</li>
                     <li>une fois avoir accepté les</li>
                     <li>terms du contract</li>
                     <li>l'agence se garde le droit de</li>
                     <li>ne pas vous rembourser .</li>
                  </ul>
               </div>
               <div class="col-xs-4 invoice-payment">
                  <h4>Type de Location:</h4>
                  <ul class="list-unstyled">
                  <c:if test="${reservation.type == 'byHour' }">
                     <li><strong>R.B.H Reg #:</strong> Location par heurs</li>
                     </c:if>
                   <c:if test="${reservation.type == 'byDay' }">
                     <li><strong>R.B.D Reg #:</strong> Location par jours</li>
                     </c:if>
                    
                  </ul>
               </div>
            </div>
            <div class="row">
               <div class="col-xs-12">
                  <table class="table table-striped table-hover">
                     <thead>
                        <tr>
                           <th></th>
                           <th>Entité</th>
                           <th class="hidden-480">Catégorie</th>
                           <th class="hidden-480">Début</th>
                           <th class="hidden-480">Fin</th>
                           <th>Total</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td>Véhicule</td>
                           <td>${reservation.vehicule.model}</td>
                           <td class="hidden-480">${reservation.vehicule.marque}</td>
                           <td class="hidden-480">${reservation.dateD}</td>
                           <td class="hidden-480">${reservation.dateR}</td>
                          <c:if test="${reservation.type== 'byDay' }">
                           <td>${reservation.vehicule.plj}</td>
                           </c:if>
                              <c:if test="${reservation.type== 'byHour' }">
                           <td>${reservation.vehicule.plh}</td>
                           </c:if>
                        </tr>
                        <tr>
                           <td>TVA</td>
                           <td>Taux T.V.A</td>
                           <td class="hidden-480"></td>
                           <td class="hidden-480"></td>
                           <td class="hidden-480"></td>
                           <td>19%</td>
                        </tr>
                        <tr>
                           <td>TVA</td>
                           <td>Valeur T.V.A</td>
                           <td class="hidden-480"></td>
                           <td class="hidden-480"></td>
                           <td class="hidden-480"></td>
                           <c:if test="${reservation.type== 'byDay' }">
                           <td>${reservation.vehicule.plj*19/100}</td>
                           </c:if>
                              <c:if test="${reservation.type== 'byHour' }">
                           <td>${reservation.vehicule.plh*19/100}</td>
                           </c:if>
                        </tr>
                        <tr>
                           <td>Total</td>
                           <td>T.T.C</td>
                           <td class="hidden-480">En cas de rupture Contrat +150%</td>
                           <td class="hidden-480"></td>
                           <td class="hidden-480"></td>
                            <c:if test="${reservation.type== 'byDay' }">
                           <td>${reservation.vehicule.plj*numDays+(reservation.vehicule.plj*19/100)}</td>
                           </c:if>
                              <c:if test="${reservation.type== 'byHour' }">
                           <td>${reservation.vehicule.plh*numDays+(reservation.vehicule.plh*19/100)}</td>
                           </c:if>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
            <div class="row">
               <div class="col-xs-4">
                  <div class="well">
                     <address>
                        <strong>Adresse</strong><br />
                        Nouvelle ville, Constantine,<br />
                        Algérie<br />
                        <abbr title="Phone">P:</abbr> +21369854255
                     </address>
                     <address>
                        <strong>E-mail</strong><br />
                        <a href="mailto:#">MyWheel@email.com</a>
                     </address>
                  </div>
               </div>
               <div class="col-xs-8 invoice-block">
                  <ul class="list-unstyled amounts">
                     <li><strong>Total:</strong>
                      <c:if test="${reservation.type== 'byDay' }">
                           ${reservation.vehicule.plj*numDays+(reservation.vehicule.plj*19/100)+500}
                           </c:if>
                              <c:if test="${reservation.type== 'byHour' }">
                           ${reservation.vehicule.plh*numDays+(reservation.vehicule.plh*19/100)+500}
                           </c:if>
                     
                      </li>
                    <li><strong>Frais de l'agence :</strong> 500 DZD</li>
                     <li><strong>Total TTC:</strong> 19%</li>
                    
                  </ul>
                  <br />
                  <a class="btn btn-lg blue hidden-print" onclick="javascript:window.print();">Imprimer <i class="icon-print"></i></a>
                  <a class="btn btn-lg green hidden-print" onClick="$('#confirmForm').submit();">Enregistrer paiement <i class="icon-ok"></i></a>
               </div>
            </div>
            
         </div>
         <!-- END PAGE CONTENT-->
     </div>
 
   <form id="confirmForm" action="/BO/confirmerLocation/${reservation.id}" method="post">

   </form>
   <!-- END CONTAINER -->
   
   <jsp:include page="BOFooter.jsp"/>

</body>
</html>
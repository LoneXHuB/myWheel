<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>TAL | gérer véhicules </title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <meta name="MobileOptimized" content="320">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME STYLES -->

    <link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2_metro.css" />
    <link rel="stylesheet" href="assets/plugins/data-tables/DT_bootstrap.css" />

    <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <style>
      .form-group label{
            font-size: 1.5em;
            font-weight: bold;
        }
    </style>


</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-full-width">
<!-- BEGIN HEADER -->
<div class="header navbar navbar-inverse navbar-fixed-top">
    <!-- BEGIN TOP NAVIGATION BAR -->
    <div class="header-inner">
        <!-- BEGIN LOGO -->
        <a class="navbar-brand" href="/espaceadmin"  style="padding: 7px;"  >
            <img src="assets/image/talocationlogo.png" alt="logo" style="" />
        </a>
        <!-- END LOGO -->
        <!-- BEGIN HORIZANTAL MENU -->
        <div class="hor-menu hidden-sm hidden-xs">
        <ul class="nav navbar-nav">
            <li >
                <a id="réservations" >

                    Réservations
                </a>
            </li>
            <li  >
                <a id="locations">

                    Locations

                </a>

            </li>
            <li class="active">
                <a id="véhicules" href="/gérervéhicules">Gérer véhicules</a>
                <span class="selected"></span>
            </li>

            <li>
                <a id="locataires" href="/gérercompteslocataires" >Gérer comptes locataires

                </a>

            </li>
            <li  >
                <a  id="gestionnaires" href="/gérercomptesgestionnaires">Gérer comptes Gestionnaires

                </a>

            </li>

        </ul>
    </div>
        <!-- END HORIZANTAL MENU -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <img src="assets/img/menu-toggler.png" alt="" />
        </a>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN TOP NAVIGATION MENU -->
        <ul class="nav navbar-nav pull-right">
            <!-- BEGIN NOTIFICATION DROPDOWN -->

            <!-- END NOTIFICATION DROPDOWN -->
            <!-- BEGIN INBOX DROPDOWN -->
            <!-- BEGIN TODO DROPDOWN -->

            <!-- END TODO DROPDOWN -->
            <!-- BEGIN USER LOGIN DROPDOWN -->
            <li class="dropdown user">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                    <img alt="" src="assets/img/avatar1_small.jpg"/>
                    <span class="username">Bob Nilson</span>
                    <i class="icon-angle-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="extra_profile.html"><i class="icon-user"></i> My Profile</a></li>

                    <li><a href="inbox.html"><i class="icon-envelope"></i> My Inbox <span class="badge badge-danger">3</span></a></li>
                    <li><a href="#"><i class="icon-tasks"></i> My Tasks <span class="badge badge-success">7</span></a></li>
                    <li class="divider"></li>
                    <li><a href="javascript:;" id="trigger_fullscreen"><i class="icon-move"></i> Full Screen</a></li>
                    <li><a href="extra_lock.html"><i class="icon-lock"></i> Lock Screen</a></li>
                    <li><a href="login.html"><i class="icon-key"></i> Se déconnecter</a></li>
                </ul>
            </li>
            <!-- END USER LOGIN DROPDOWN -->
        </ul>
        <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<div class="clearfix"></div>
<!-- BEGIN CONTAINER -->
<div class="page-container" >
    <!-- BEGIN EMPTY PAGE SIDEBAR -->
    <div class="row col-md-12" style="margin: 0;padding: 0;">
        <!-- BEGIN SIDEBAR MENU -->


            <a class="start col-md-6  btn yellow"  id="listedesvehicules">

                    <i class=" icon-list-ul"></i>
                    <span class="title">Liste des véhicules</span>

            </a>

            <a class="start col-md-6 btn yellow" id="ajouter">

                    <i class="icon-plus"></i>
                    <span  >Ajouter véhicule</span>
            </a>




        <!-- END SIDEBAR MENU -->
    </div>
    <div class="row col-md-12" id="menu2">
        <!-- BEGIN SIDEBAR MENU -->


        <ul class="page-sidebar-menu ">
            <li class="start col-md-4 btn " >
                <a id="listevoitures">
                    <i class=" icon-list-ul"></i>
                    <span class="title"  >Liste des voitures</span>
                </a>
            </li>
            <li class="start col-md-4 btn" >
                <a id="listebus">
                    <i class=" icon-list-ul"></i>
                    <span class="title">Liste des bus</span>
                </a>
            </li>

            <li class="start col-md-4 btn">
                <a id="listemotos">
                    <i class=" icon-list-ul"></i>
                    <span class="title" >Liste des motos</span>
                </a>
            </li>



        </ul>
        <!-- END SIDEBAR MENU -->
    </div>

    <!-- END EMPTY PAGE SIDEBAR -->
    <!-- BEGIN PAGE -->
    <div class="page-content">

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
                                    <div class="caption"><i class="icon-comments"></i>Ajouter véhicule</div>
                                    <div class="tools">
                                        <a href="javascript:;" class="collapse"></a>
                                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <h4></h4>
                                    <form action="#">
                                        <div class="form-group  ">
                                            <label class="label label-md label-warning">Catégorie</label>
                                            <select id="catégorie"   class="form-control input">
                                                <option value="voiture"   >Voiture</option>
                                                <option value="bus" >Bus</option>
                                                <option value="moto" >Moto</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Marque</label>
                                                <i class="icon-font"></i>
                                                <input id="marque" type="text" class="form-control" placeholder="Marque">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Modèle</label>
                                                <i class="icon-font"></i>
                                                <input id="modèle" type="text" class="form-control" placeholder="Modèle">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Matricule</label>
                                                <i class="icon-font"></i>
                                                <input id="matricule" type="number" class="form-control" placeholder="Matricule">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="label label-md label-warning">Energie</label>
                                            <select id="energie" class="form-control  input">
                                                <option value="essence" >Essence</option>
                                                <option value="diesel" >Diesel</option>
                                                <option value="gpl" >Gpl</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Puissance</label>
                                                <i class="icon-font"></i>
                                                <input id="puissance" type="text" class="form-control" placeholder="Puissance">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Couleur</label>
                                                <i class="icon-font"></i>
                                                <input id="couleur" type="text" class="form-control" placeholder="Couleur">
                                            </div>
                                        </div>
                                        <div class="form-group  ">
                                            <label class="label label-md label-warning">Boite</label>
                                            <select id="boite" class="form-control select2-container input">
                                                <option value="auto" >Auto</option>
                                                <option value="manuel" >Manuel</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Prix de location par heure</label>
                                                <i class="icon-font"></i>
                                                <input id="plh" type="number" class="form-control" placeholder="Prix de location par heure">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Prix de location par jour</label>
                                                <i class="icon-font"></i>
                                                <input id="plj" type="number" class="form-control" placeholder="Prix de location par jour">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Kilométrage</label>
                                                <i class="icon-font"></i>
                                                <input id="klm" type="number" class="form-control" placeholder="Kilométrage">
                                            </div>
                                        </div>
                                        <div class="form-group  ">
                                            <label class="label label-md label-warning">Etat</label>
                                            <select id="etat" class="form-control select2-container input">
                                                <option value="réservé" >réservé</option>
                                                <option value="libre" >Libre</option>
                                                <option value="enpanne" >En panne</option>
                                            </select>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                        <div class="sidebar-content col-md-6  ">

                            <!-- BEGIN PORTLET-->
                            <div class="portlet box red  center-block">
                                <div class="portlet-title line">
                                    <div class="caption"><i class="icon-comments"></i>Ajouter infos sur le véhicule</div>
                                    <div class="tools">
                                        <a href="javascript:;" class="collapse"></a>
                                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <h4></h4>
                                    <form action="#">
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Date début assurance</label>
                                                <i class=" icon-calendar"></i>
                                                <input id="debutassurance" type="date" class="form-control" placeholder="Date début assurance">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Date fin assurance </label>
                                                <i class=" icon-calendar"></i>
                                                <input id="finassurance" type="date" class="form-control" placeholder="Date fin assurance">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Date début controle tecknique</label>
                                                <i class=" icon-calendar"></i>
                                                <input id="debutcontrole" type="date" class="form-control" placeholder="Date début controle tecknique">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Date fin controle tecknique </label>
                                                <i class=" icon-calendar"></i>
                                                <input id="fincontrole" type="date" class="form-control" placeholder=">Date fin controle tecknique">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-icon">
                                                <label class="label label-md label-warning">Kilométrage du prochain vidange</label>
                                                <i class="icon-font"></i>
                                                <input id="klmprochainvidange" type="number" class="form-control" placeholder="Kilométrage du prochain vidange">
                                            </div>
                                        </div>



                                    </form>
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                        <button id="ajoutervehicule"  class=" col-md-10 btn red">Ajouter</button>
                        <!-- END PAGE CONTENT-->
                    </div>
                </div>






            </div>

        </div>

        <!-- END PAGE CONTENT-->
    </div>
    <!-- END PAGE -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="footer-inner">
        2013 &copy; Metronic by keenthemes.
    </div>
    <div class="footer-tools">
         <span class="go-top">
         <i class="icon-angle-up"></i>
         </span>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
<script type="text/javascript"> jQuery(document).ready(function() {
    App.init();
    debugger;

    $("#menu2").hide();


  //  $("#ajoutervéhicule").hide();

    $("#ajouter").click(function() {

        $("#supprimervéhicule").hide();

        $("#afficherlistedesvehicules").hide();

        $("#menu2").hide();
        $("#ajoutervéhicule").show();

    });
    $("#listedesvehicules").click(function() {

        $("#supprimervéhicule").hide();

        $("#afficherlistedesvehicules").empty();
        $("#afficherlistedesvehicules").show();

        $("#menu2").show();

    });

    $("#listevoitures").click(function() {
        var id ="listevoitures";

        $.ajax({
            type: "get",
            data: {"id":id},
            url: "/backend/listedesvehicules",

            dataType: "html",
            success: function (result) {
                debugger;

                $("#ajoutervéhicule").hide();
                $("#gérerfinlocation").hide();


                $("#menu2").show();
                $("#afficherlistedesvehicules").html(result);

            },
            error: function (response) {
                debugger;
                alert('error'); }
        });  });
        $("#listebus").click(function() {
            var id ="listebus";
            console.log(id);

            $.ajax({
                type: "get",
                data: {"id":id},
                url: "/backend/listedesvehicules",

                dataType: "html",
                success: function (result) {
                    debugger;

                    $("#ajoutervéhicule").hide();
                    $("#gérerfinlocation").hide();


                    $("#menu2").show();
                    $("#afficherlistedesvehicules").html(result);

                },
                error: function (response) {
                    debugger;
                    alert('error'); }
            });  });
            $("#listemotos").click(function() {
                var id ="listemotos";

                $.ajax({
                    type: "get",
                    data: {"id":id},
                    url: "/backend/listedesvehicules",

                    dataType: "html",
                    success: function (result) {
                        debugger;

                        $("#ajoutervéhicule").hide();
                        $("#gérerfinlocation").hide();


                        $("#menu2").show();
                        $("#afficherlistedesvehicules").html(result);

                    },
                    error: function (response) {
                        debugger;
                        alert('error'); }
                });  });




    $("#ajoutervehicule").click(function() {

        var categorie = $("#catégorie option:selected").val();
        console.log(categorie);
        var marque =$("#marque").val();
        console.log(marque);
        var modele =$("#modèle").val();
        console.log(modele);
        var matricule =$("#matricule").val();
        console.log(matricule);
        var energie=$("#energie option:selected").val();
        var puissance=$("#puissance").val();
        console.log(energie);
        var couleur=$("#couleur").val();
        console.log(couleur);
        var boite=$("#boite option:selected").val();
        console.log(boite);
        var plh=$("#plh").val();
        var plj =$("#plj").val();
        var klm = $("#klm").val();
        var etat = $("#etat").val();
        console.log(plj);

        $.ajax({
            type: "get",
            url: "/backend/ajoutervehicule",
            data : {"categorie":categorie,"marque":marque,"modele":modele,"matricule":matricule,"energie":energie,
                "couleur":couleur,"boite":boite,"plh":plh,"plj":plj,"klm":klm,"etat":etat,"puissance":puissance},
            dataType: "html",
            success: function (result) {
                debugger;

                $("#ajoutervéhicule").hide();
                $("#supprimervéhicule").hide();
                $("#gérerfinlocation").hide();
                $("#listcatégorie").hide();


                $("#afficherlistedesvehicules").html(result);

            },
            error: function (response) {
                debugger;
                alert('error'); }
        });
    });

            });
</script>

<script src="assets/plugins/excanvas.min.js"></script>
<script src="assets/plugins/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>



<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
<script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
<!-- END CORE PLUGINS -->

<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->

<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/scripts/app.js"></script>


</body>
<!-- END BODY -->
</html>
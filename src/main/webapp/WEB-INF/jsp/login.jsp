<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
			<div class="col-md-6">
				 <div class="login-page">
					<h4 class="title">Nouveau visiteur</h4>
					<p>cliquez sur ce lien pour acceder a la page d'inscription MyWeel ,et pouvoir bénéficier des offres multiples offertes par notre Agence.l'inscription est gratuite et le sera toujours!</p>
					<div class="button1">
					   <a href="/register"><input type="submit" value="Créer compte"></a>
					 </div>
					 <div class="clear"></div>
				  </div>
				</div>
				<div class="col-md-6">
				 <div class="login-title">
	           		<h4 class="title">Deja inscrit(e) <strong style="color:red;">${error.message}</strong></h4>
					<div id="loginbox" class="loginbox">
						<form:form action="/login" method="post" name="login" id="login-form">
						<h4 style="color:green">${msg}</h4>
						<h4 style="color:red">${errorMsg}</h4>
						
						  <fieldset class="input">
						
						    <p id="login-form-username">
						      <label for="modlgn_username">Email</label>
						      <input id="modlgn_username" name="username" type="text" class="form-control" class="inputbox" size="18" autocomplete="off">
						    </p>
						    <p id="login-form-password">
						    <c:url value="/login" var="login"/>
						      <label for="modlgn_passwd">Mot de Passe</label>
						      <input id="modlgn_passwd" name="password" type="password" name="password" class="inputbox" size="18" autocomplete="off">
						    </p>
						    <div class="remember">
							    <p id="login-form-remember">
							      <label for="modlgn_remember"><a  data-target="#forgot" data-toggle="modal" href="#forgot">Mot de passe oublié ?</a></label>
							   </p>
							    <input type="submit" name="Submit" class="button" value="Login"><div class="clear"></div>
							 </div>
						  </fieldset>
						 </form:form>
						<!--   //////////////////////////popup///////////////////////////////////////////////-->
 					<div id="forgot" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" style="display: none;" aria-hidden="true">
                        <div class="modal-dialog">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                 <h4 class="modal-title">Mot de passe oublié</h4>
                              </div>
                              <div class="modal-body">
                                 <p>Veuillez entrer votre addrèsse email.</p>
                                
                                
                                <form:form modelAttribute="userF" action="/forgot-password" method="post" id="forgotForm" >
                                <p><form:input  path="email" class="col-md-12 form-control"  required="Champ Obligatoire" /></p>  
                              </form:form>
                              
                              
                              </div>
                              <div class="modal-footer">
                                 <button type="button" data-dismiss="modal" class="btn default">Retour</button>
                                 <button type="button" data-dismiss="modal" onClick="$('#forgotForm').submit();" class="btn green">Renouveler</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  		 <!--  //////////////////////////popup///////////////////////////////////////////////-->
                     
					</div>
			      </div>
				 <div class="clear"></div>
			  </div>
			</div>
		  </div>
	  </div>
	

	 <jsp:include page="footer.jsp"/>

</body>	
</html>
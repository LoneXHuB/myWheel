<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>myWheel | Register </title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
        $(document).ready(function() {
    
        });
     </script>
 </head>
<body>
<jsp:include page="nav.jsp"/>
     <div class="main">
      <div class="shop_top">
	     <div class="container">
						<form:form action="/editProfile" method="post" modelAttribute="user"> 
								<div class="register-top-grid">
										<h3>INFORMATION PERSONNELLE</h3>
										<form:input type="hidden" value="ROLE_CLIENT" path="rol"/>
										<div>
											<span>Nom<label>*</label></span>
								      <form:input path="name" value="${currentUser.name}" type="text" placeHolder="${currentUser.name}" required="completez ce champ s.v.p!" />
								      <form:input path="email" value="${currentUser.email}" type="hidden" /> 
											
										</div>
										<div>
											<span>Prénom<label>*</label></span>
											<form:input path="lastName" value="${currentUser.lastName}" type="text" placeHolder="${currentUser.lastName}" required="completez ce champ s.v.p!" /> 
										</div>
										
										<div>
											<span>Numéro de téléphone<label>* </label></span>
								      <form:input path="mobile" id="telNo" name="telNo" placeHolder="${currentUser.telNo}" type="text" minlength="10" maxlength="10" size="10" required="completez ce champ s.v.p!"/> 
											
										</div>
										<div>
											<span>Numéro de permis<label>*</label></span>
											<form:input path="numPermit" value="${currentUser.numPermit}" id="telNo" name="telNo" placeHolder="${currentUser.numPermit}" type="text" minlength="9" maxlength="12" size="10" required="completez ce champ s.v.p!"/> 
										</div>
										<div>
										<img src="${contextPath}/images/1.jpg"/>
										</div>
										<div class="clear"> </div>
											<a class="news-letter" href="#">
												<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>S'abonner a la NEWSLETTER </label>
											</a>
										<div class="clear"> </div>
								</div>
								<div class="clear"> </div>
								<div class="register-bottom-grid">
										<h3>INFORMATIONS DE CONNEXION</h3>
										<div>
											<span>MOT DE PASSE<label>*</label></span>
											<form:input name="pass" id="password" path="pass" value="${currentUser.pass}" placeHolder="inchangé" type="password" required="completez ce champ s.v.p!"/> 
										</div>
										<div>
											<span>Confirmer mot de passe<label><output name="output"/>${passErr}*</label></span>
									
											<input name="password_confirm" required="required" type="password" id="password_confirm" oninput="check(this)" />
<script language='javascript' type='text/javascript'>
    function check(input) {
        if (input.value != document.getElementById('password').value) {
            input.setCustomValidity('Mot de passes non identiques');
        } else {
            // input is valid -- reset the error message
            input.setCustomValidity('');
        }
    }
                         </script>
										</div>
										<div class="clear"> </div>
								</div>
								<div class="clear"> </div>
								<input style="background-color:#DDD;font-family:'Open Sans', sans-serif'-webkit-appearance: none;-moz-appearance: none; appearance: none;" type="submit" value="appliquer">
					</form:form>
					</div>
		   </div>
	  </div>
	  
		 <jsp:include page="footer.jsp"/>

</body>	

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<!-- BEGIN FOOTER -->
   <div class="footer">
      <div class="footer-inner">
         2018 &copy; myWheel by TeamSerbeS.
      </div>
      <div class="footer-tools">
         <span class="go-top">
         <i class="icon-angle-up"></i>
         </span>
      </div>
   </div>
   <!-- END FOOTER -->
    <!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
   <!-- BEGIN CORE PLUGINS -->
   <!--[if lt IE 9]>
   <script src="${contextPath}/assets/plugins/respond.min.js"></script>
   <script src="${contextPath}/assets/plugins/excanvas.min.js"></script>
   <![endif]-->
   
	<script src="${contextPath}/cleave/cleave-phone.dz.js" type="text/javascript"></script>
   <script src="${contextPath}/cleave/cleave.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
   <!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
   <script src="${contextPath}/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
   <script src="${contextPath}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
   <script src="${contextPath}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
   <!-- END CORE PLUGINS -->
   <script src="${contextPath}/assets/scripts/app.js"></script>
   
   <script>
      jQuery(document).ready(function() {
         App.init();
      });
   </script>
   <!-- END JAVASCRIPTS -->
   <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
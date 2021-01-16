<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Free Snow Bootstrap Website Template | Team :: w3layouts</title>
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
     <!-- Add fancyBox main JS and CSS files -->
	<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	<link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
		<script>
			$(document).ready(function() {
				$('.popup-with-zoom-anim').magnificPopup({
					type: 'inline',
					fixedContentPos: false,
					fixedBgPos: true,
					overflowY: 'auto',
					closeBtnInside: true,
					preloader: false,
					midClick: true,
					removalDelay: 300,
					mainClass: 'my-mfp-zoom-in'
			});
		});
		</script>
</head>
<body>
    <jsp:include page="nav.jsp"/>
     <div class="main">
      <div class="shop_top">
		<div class="container">
			<div class="row team_box">
				<h3 class="m_2">Our Team</h3>
				<div class="col-md-3 team1">
				  <a class="popup-with-zoom-anim" href="#small-dialog3"><img src="images/team1.jpg" class="img-responsive" title="continue" alt=""/></a>
				    <div id="small-dialog3" class="mfp-hide">
					   <div class="pop_up2">
					   	 <h2>Lorem ipsum </h2>
						 <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie.</p>
						 <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie.</p>
					   </div>
					</div>
					<h4 class="m_5"><a href="#">LOUNESS KHELIFI</a></h4>
				    <p class="m_6">HADA CHGHOUL INSANE 9BIH.</p>
				</div>
				<div class="col-md-3 team1">
					<a class="popup-with-zoom-anim" href="#small-dialog3"><img src="images/team2.jpg" class="img-responsive" title="continue" alt=""/></a>
				    <div id="small-dialog3" class="mfp-hide">
					   <div class="pop_up2">
					   	 <h2>Lorem ipsum </h2>
						 <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie.</p>
						 <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie.</p>
					   </div>
					</div>
					<h4 class="m_5"><a href="#">HTES</a></h4>
				    <p class="m_6">ZEDNAH GHIR BACH ICHEBA7 LA PAGE BWEDJHOU LEMNOUWER.</p>
				</div>
				<div class="col-md-3 team1">
					<a class="popup-with-zoom-anim" href="#small-dialog3"><img src="images/team3.jpg" class="img-responsive" title="continue" alt=""/></a>
				    <div id="small-dialog3" class="mfp-hide">
					   <div class="pop_up2">
					   	 <h2>Lorem ipsum </h2>
						 <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie.</p>
						 <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie.</p>
					   </div>
					</div>
					<h4 class="m_5"><a href="#">TAKI ELMOUDIR</a></h4>
				    <p class="m_6">Bla man9oulou belli hada siyed khchine , lmoudir en personne.</p>
				</div>
				<div class="col-md-3 team1">
					<a class="popup-with-zoom-anim" href="#small-dialog3"><img src="images/team4.jpg" class="img-responsive" title="continue" alt=""/></a>
				    <div id="small-dialog3" class="mfp-hide">
					   <div class="pop_up2">
					   	 <h2>Lorem ipsum </h2>
						 <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie.</p>
						 <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie.</p>
					   </div>
					</div>
					<h4 class="m_5"><a href="#">AIMEN AMIOUR</a></h4>
				    <p class="m_6">aimen a la francaise (masebnach teswirtou derna hadi)</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 team_bottom">
				  <ul class="team_list">
					<h4>Advantages</h4>
		            <li><a href="#">Always free from repetition</a><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt</p></li>
		            <li><a href="#">Always free from repetition</a><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt</p></li>
		            <li><a href="#">Always free from repetition</a><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt</p></li>
		            <li><a href="#">Always free from repetition</a><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt</p></li>
		          </ul>
				</div>
				<div class="col-md-8">
					<ul class="team_list">
					 <h4>Vision Statement</h4>
					 <p class="m_7">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
		             <img src="images/team5.jpg" class="img-responsive" alt=""/>
		          </ul>
				</div>
			</div>
		</div>
	   </div>
	  </div>
	  
		 <jsp:include page="footer.jsp"/>

</body>	
</html>
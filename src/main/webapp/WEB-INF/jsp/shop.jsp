<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Agence myWheel</title>
<link href="${contextPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${contextPath}/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#byHourRow input").prop('disabled', true);
	updateMarqueList( );
	$("#byHourRow").hide();
	
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

    $("#marque").change(updateModelList);
    	
    $("#category").change(updateMarqueList);
     
 	
		$("#to").change(function checkDateValidity(){
			
			
			       var dateR = new Date(this.value);
			    	var dateD = new Date( $("#from").val() );
			   
			
		console.log("dayD ="+dateD.getDate());
		console.log("MonthD ="+dateD.getMonth());
		console.log("YearD ="+dateD.getYear())
			
		console.log("dayR ="+dateR.getDate());
		console.log("MonthR ="+dateR.getMonth());
		console.log("YearR ="+dateR.getYear());
		
			if ( dateD.getDate()  >  dateR.getDate()  || dateD.getMonth()  > dateR.getMonth()  || dateD.getYear() > dateR.getYear() ||  ( dateD.getDate()  ==  dateR.getDate()  && dateD.getMonth()  == dateR.getMonth()  && dateD.getYear() == dateR.getYear()) )
				{
				console.log("validity  False!")
				this.setCustomValidity("Selectionez une date ulterieure a la date de debut");
				}
				else
				this.setCustomValidity("");
		
			console.log("validity Checked!");
		}   );
   
		
	
		var detached;
 		
		$("#rentType").change(function(){
			
		
			
      var selectedType = $('#rentType').find(":selected").text();
 		
      console.log(selectedType+" selected!")
 		 
		if(selectedType == "location par jours")
			{
			$("#byHourRow input").prop('disabled', true);
			  $("#byHourRow").fadeOut("fast", function(){
				 	
				   $("#byDateRow").fadeIn("fast");
				   $("#byDateRow input").prop('disabled', false);
				
			  });
			 
			}
 		 
	    if (selectedType == "location par heurs")
		    {
	    	$("#byDateRow input").prop('disabled', true);
			  $("#byDateRow").fadeOut('fast' ,function(){ 

				  $("#byHourRow").fadeIn("fast");
				  $("#byHourRow input").prop('disabled', false);
				  
				  });
			
			}
	
			
		});
		
		
		
		///////////AYMEN IMPORTED /////////////////////////////////////////////////////////////////////////////////////
	        var d = new Date();
			
		        var month = d.getMonth()+1;
		        var day = d.getDate();
				
				
		        var output = (day<10 ? '0' : '') + day + '-' +
		            (month<10 ? '0' : '') + month + '-' +
		            d.getFullYear();
 				console.log(output)
		        $("#from").val(output);
		        $("#to").val(output);
		        $("#byHourRow #from").val(output);
		        
		///////////END AYMEN IMPORTED /////////////////////////////////////////////////////////////////////////////////

 	
    
});
</script>
</head>
<body>
<jsp:include page="nav.jsp"/>
<div class="main">
	<!-- onInput="document.forms.namedItem('filterForm').submit()" -->
<form:form  modelAttribute="filter" action="/shop/0/filter"  method="GET" id="filterForm" class="filterForm">
<div class="table-responsive">
<table >
<tbody class="tableFilterBody" >
<tr class="filters"> 
<td>  Prix max : <output for="range" name="output">Aucun</output> </td>
<td>   <form:input id="range" onInput="output.value=range.value" type="range" min="0" max="15000" path="priceRange" />   </td>
<td> 

<form:select id="category" path="category"> 
<c:forEach items="${sessionScope.listCategory}" var="categ" >
<option value="${categ}" >${categ }</option>
</c:forEach>
</form:select> 

</td>
<td>     <form:select id="marque" path="marque"  selected="${sessionScope.filter.model}"> 
<c:forEach items="${sessionScope.marqueList}" var="marque" >
<option value="${marque}">${marque}</option>
</c:forEach>
</form:select>  </td>

<td>     <form:select id="model" path="model" selected="${sessionScope.filter.model}"> 
<option value="" selected="selected">Model</option>
</form:select>  </td>

</tr>

<tr type="none" class="filters">

<td colspan="5">   <form:select path="typeReservation" id="rentType"> 
<option value="byDay">location par jours</option>
<option value="byHour">location par heurs</option>
</form:select>            	</td>
</tr>

<tr id="byDateRow" type="none" class="filters">
<td>  Date de debut / fin : </td>
<td>  <form:input id="from" name="from"  required="required" type="date" path="dateD" placeHolder="Date de debut" /> </td>

<td>  <form:input id="to" name="to"  required="required" type="date" path="dateR" placeHolder="Date de fin" /> </td>

<td colspan = "2"> <input type="submit" id="filterSubmit" value="Filtrer" />  </td>

</tr>

<tr id="byHourRow" type="none" class="filters">
<td>  Heure de debut / fin:</td>
<td>  <form:input id="from" name="from"  min="08:30" max="12:00"  required="required" type="time" path="timeD" placeHolder="Date de debut" /> </td>

<td>  <form:input id="to" name="to"  min="12:01" max="19:00" required="required" type="time" path="timeR" placeHolder="Date de fin" /> </td>

<td>  <form:input id="from" name="from"   required="required" type="date" path="dateD" placeHolder="Date de location" /> </td>

<td> <input type="submit" id="filterSubmit" value="Filtrer" />  </td>

</tr>

</tbody>
</table>
</div>
</form:form>
     
      <div class="shop_top">
      
		<div class="container">
							<h3>Disponibilités :</h3>
		 			<c:choose>
    <c:when test="${ numVehicules !=0 }">
      
  
		 			<c:forEach begin="0" end="${(numVehicules/4) }" var="row">
	               <div class="row shop_box-top">
						<c:forEach begin="${row*4}" end="${(row*4)+3 }" items="${vPage}" var="Vehicule">	
				<div class="col-md-3 shop_box"><a href="/single/${Vehicule.idVehicule}?dateD=${sessionScope.filter.dateD}&dateR=${sessionScope.filter.dateR}&timeD=${sessionScope.filter.timeD}&timeR=${sessionScope.filter.timeR}&type=${sessionScope.filter.typeReservation}">
					<img src="${contextPath}/images/cars/${Vehicule.imagePath}" class="img-responsive" alt="carPic"/>
					<span class="new-box">
						<span class="new-label">New</span>
					</span>
					<span class="sale-box">
						<span class="sale-label">Sale!</span>
					</span>
					<div class="shop_desc">	
						<h3><a href="#">${Vehicule.model}</a></h3>
						<p>${Vehicule.marque} </p>
						<span class="actual">${Vehicule.plj}</span><br>
						<ul class="buttons">
							<li class="cart"><a href="/single/${Vehicule.idVehicule}?dateD=${sessionScope.filter.dateD}&dateR=${sessionScope.filter.dateR}&timeD=${sessionScope.filter.timeD}&timeR=${sessionScope.filter.timeR}&type=${sessionScope.filter.typeReservation}">reserver</a></li>
							<li class="shop_btn"><a href="/single/${Vehicule.idVehicule}?dateD=${sessionScope.filter.dateD}&dateR=${sessionScope.filter.dateR}&timeD=${sessionScope.filter.timeD}&timeR=${sessionScope.filter.timeR}&type=${sessionScope.filter.typeReservation}">Infos</a></li>
							<div class="clear"> </div>
					    </ul>
				    </div>
				</a></div>
			
				</c:forEach>
					</div>
					</c:forEach>
			
			<table class="pagesTable">
			<tbody>
			<tr class="pagesRow">	
		<c:forEach begin='0' end='${numOfPages-1}' var="index" >
			 <td ><a href="${contextPath}/shop/${index}/filter?priceRange=${sessionScope.filter.priceRange}&category=${sessionScope.filter.category}&marque=${sessionScope.filter.marque}&model=${sessionScope.filter.model}&dateD=${sessionScope.filter.dateD}&dateR=${sessionScope.filter.dateR}&timeD=${sessionScope.filter.timeD}&timeR=${sessionScope.filter.timeR}&typeReservation=${sessionScope.filter.typeReservation}" > ${index} </a></td>
		</c:forEach>
		    </tr>
		    </tbody>
			</table>
			
			  </c:when>
    <c:otherwise>
        <h3> Aucun véhicule disponible ne correspond a ce filtre  .... :'( </h3>
    </c:otherwise>
</c:choose>
			</div>
			
			
			
		 </div>
		
	</div>
	  
	<jsp:include page="footer.jsp"/>
</body>	
</html>
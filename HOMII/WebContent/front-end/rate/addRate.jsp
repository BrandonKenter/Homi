<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.comp.model.*"%>
<%@ page import="com.rate.model.*"%>
<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	if(memVO == null){
		memVO = new MemVO();
		memVO.setMember_no(99);
	}
	pageContext.setAttribute("memVO", memVO);
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />

<title>Rating page</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
/*Contact sectiom*/

body {
    background-color: #4a3b3b;
}
.content-header{
  font-family: 'Roboto', sans-serif;
  color:#fcc500;
  font-size: 45px;
}

.section-content{
  text-align: center; 

}
#contact{
    
  font-family: 'Teko', sans-serif;
  padding-top: 30px;
  width: 100%;
  width: 100vw;
  height: 47vw;

  background-image: url("<%=request.getContextPath()%>/img/complaint form.jpg");
  background-size:100%;
  	background-attachment:fixed;
}

#contact button{
	width:180px;

}
.contact-section{
  padding-top: 40px;
}
.contact-section .col-md-6{
  width: 50%;
}

.form-line{
  border-right: 1px solid #B29999;
}

.form-group{
  margin-top: 10px;
}
label{
  font-size: 1em;
  line-height: 1em;
  font-weight: bolder;
}
.form-control{
  font-size: 1.3em;
  color: #080808;
}
textarea.form-control {
    height: 135px;
   /* margin-top: px;*/
}

.submit{
  font-size: 1.1em;
  width: 150px;
  background-color: transparent;
  color: #fff;

}

.form-group label{
	display: block;
	float: left;
	overflow: hidden;
	width: 160px;
	height: 29px;
	padding-right: 10px;
	text-align: justify;
	line-height: 2;
}

.form-group span {
    display: block;
    overflow: hidden;
    padding: 0 4px 0 6px
}
.form-group input {
    width: 100%
}

.askPubType{
	text-align:center;
	margin-top:60px;
}
</style>
</head>
<body>
<jsp:include page="/front_header.jsp"/>
<div class="errorMsgs">
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">There some errors, please check it:</font>
		<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
		</ul>
	</c:if>
</div>

<div class="successMsgs">
	<c:if test="${not empty successMsgs}">
		<ul>
		<c:forEach var="message" items="${successMsgs}">
			<li style="color:green">${message}</li>
		</c:forEach>
		</ul>
	</c:if>
</div>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/rate/rate.do" name="form2" enctype="multipart/form-data" data-toggle="validator">  
	<section id="contact">
			<div class="section-content">
				<h1 class="section-header">Rate my apartment </h1>
			</div>
			<div class="contact-section">
			<div class="container">
				<div class="row">
				<form>
				<div class="row">
					<div class="col-md-6">
					<u><b><p>Personal Info</p></b></u>
								
						<div class="form-group">
					    	<label for="username">User Name</label>
					    	<span><input type="text" class="form-control" value="<%= (memVO==null)? "" : memVO.getMb_name()%>" id="username"  disabled="disabled"></span>
					    	<input type="hidden" name="memNo" value="${memVO.member_no}">
			  			</div>
			  			
						<div class="form-group">
					    	<label for="username">Apartment Name</label>
					    	<span><input type="text" class="form-control" value="<%= (memVO==null)? "" : memVO.getMb_name()%>" id="username"  disabled="disabled"></span>
					    	<input type="hidden" name="memNo" value="${memVO.member_no}">
			  			</div>
			  			
			  			<div class="form-group">
			  				<label for ="comment">Comment</label>
			  			 	<span><textarea  class="form-control" name="comment" id="comment" placeholder="Enter Comments "></textarea></span>
				  		</div>			  			
			  			
			  			
			  		</div>			  					  		
			  		<div class="col-md-6">
			  		<u><b><p>Rate this apartment</p></b></u>

			  			<div class="form-group">
			  				<label for="rate_price">Rental Cost</label>
					    	<span><input type="text" class="form-control" name="rate_price" value="" id="rate_price" placeholder=" Enter 1-5 stars"></span>
				  		</div>
			  			<div class="form-group">
			  				<label for="rate_location">Location</label>
					    	<span><input type="text" class="form-control" name="rate_location" value="" id="rate_location" placeholder=" Enter 1-5 stars"></span>
				  		</div>				  		
			  			<div class="form-group">
			  				<label for="rate_clean">Cleanness</label>
					    	<span><input type="text" class="form-control" name="rate_clean" value="" id="rate_clean" placeholder=" Enter 1-5 stars"></span>
				  		</div>
			  			<div class="form-group">
			  				<label for="rate_service">Service</label>
					    	<span><input type="text" class="form-control" name="rate_service" value="" id="rate_service" placeholder=" Enter 1-5 stars"></span>
				  		</div>
			  			<div class="form-group">
			  				<label for="rate_handletime">Handling Time</label>
					    	<span><input type="text" class="form-control" name="rate_handletime" value="" id="rate_handletime" placeholder=" Enter 1-5 stars"></span>
				  		</div>				  		
					</div>
					</div>
					<div>	
						<center><p>Thanks for your rating!</p></center>					
					</div>
			  		<div align="center">
			  			<input type="hidden" name="action" value="insert">
			  			<input type="submit" class="btn btn-primary submit" value="Send">
			  		</div>
				</form>
				</div>
			</div>
			</div>
		</section>
</FORM>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>

$("#rate_price").change(function(){
	var p = $("#rate_price").val();
	console.log(parseInt(p));
	if (isNaN(parseInt(p))){
		Swal.fire('Please enter digit only');
	}
	if (parseInt(p) > 5 || parseInt(p) < 0){
		Swal.fire('range is 0 ~ 5');
	}
	
})

$("#rate_location").change(function(){
	var p = $("#rate_location").val();
	console.log(parseInt(p));
	if (isNaN(parseInt(p))){
		Swal.fire('Please enter digit only');
	}
	if (parseInt(p) > 5 || parseInt(p) < 0){
		Swal.fire('range is 0 ~ 5');
	}
	
})

$("#rate_service").change(function(){
	var p = $("#rate_service").val();
	console.log(parseInt(p));
	if (isNaN(parseInt(p))){
		Swal.fire('Please enter digit only');
	}
	if (parseInt(p) > 5 || parseInt(p) < 0){
		Swal.fire('range is 0 ~ 5');
	}
	
})

$("#rate_price").change(function(){
	var p = $("#rate_price").val();
	console.log(parseInt(p));
	if (isNaN(parseInt(p))){
		Swal.fire('Please enter digit only');
	}
	if (parseInt(p) > 5 || parseInt(p) < 0){
		Swal.fire('range is 0 ~ 5');
	}
	
})

$("#rate_handletime").change(function(){
	var p = $("#rate_handletime").val();
	console.log(parseInt(p));
	if (isNaN(parseInt(p))){
		Swal.fire('Please enter digit only');
	}
	if (parseInt(p) > 5 || parseInt(p) < 0){
		Swal.fire('range is 0 ~ 5');
	}
	
})
for (var i = 0; i < images.length; i++) { var image = images[i], width = String(image.currentStyle.width); if (width.indexOf('%') == -1) { continue; } image.origWidth = image.offsetWidth; image.origHeight = image.offsetHeight; imgCache.push(image); c.ieAlpha(image); image.style.width = width; }
</script>
</body>
</html>
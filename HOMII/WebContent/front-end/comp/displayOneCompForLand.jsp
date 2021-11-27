<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.comp.model.*"%>
<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	if(memVO == null){
		memVO = new MemVO();
		memVO.setMember_no(99);
	}
	pageContext.setAttribute("memVO", memVO);
	String test = request.getParameter("complaint_no");
	Integer complaint_no = new Integer(test.trim());
	CompService compSvc = new CompService();
	CompVO compVO = compSvc.getOneComplaint(complaint_no);
	pageContext.setAttribute("compVO", compVO);
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />

<title>Show Complaint for Landlord</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
/*Contact sectiom*/

body {
    
  background-image: url("<%=request.getContextPath()%>/img/complaint form.jpg");
  background-size:100%;
  background-attachment:fixed;
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
.form-group .form-control input {
    width: 100%
}

.askPubType{
	text-align:center;
	margin-top:60px;
}
img {
	max-width:300px;
	myimg:expression(onload=function(){
	this.style.width=(this.offsetWidth > 300)?"300px":"auto"});
}

.restype{
	backdrop-filter: blur(5px);
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
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/comp/comp.do" name="form2" enctype="multipart/form-data" data-toggle="validator">  
	<section id="contact">
			<div class="section-content">
				<h1 class="section-header">Complaint case</h1>
			</div>
			<div class="contact-section">
			<div class="container">
				<div class="row">
				<form>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
					    	<label for="username">Tenant Name</label>
					    	<span><input type="text" class="form-control" value="<%=memVO.getMb_name()%>" id="username"  disabled="disabled"></span>
			  			</div>
<%-- 			  			<div class="form-group">
			  				<label for="apName">Apartment Name</label>
					    	<span><input type="text" class="form-control" name="apName" value="<%=compVO.getAp_name()%>" id="apName" disabled="disabled"></span>
				  		</div> --%>
				  		<div class="form-group">
					    	<label for="apAddress">Apartment Address</label>
					    	<span><input type="text" class="form-control" name="apAddress" value="<%=compVO.getAp_address()%>" id="apAddress" disabled="disabled"></span>
					  	</div>
			  			<div class="form-group">
			  				<label for="title">Case title</label>
					    	<span><input type="text" class="form-control" name="caseTitle" value="<%=compVO.getCase_title()%>" id="title" disabled="disabled"></span>
				  		</div>
			  			<div class="form-group">
			  				<label for ="description"> Description</label>
			  			 	<span><textarea  class="form-control" name="description"  id="description" disabled="disabled">${compVO.description}</textarea></span>
			  			</div>
			 
			  		</div>
			  		<div class="col-md-6">
			  			<div class="form-group photodiv">
			  				<label for="photo">Photo</label>
					    	<span><img src="${pageContext.request.contextPath}/comp/comp.do?action=view_comPic&complaint_no=${compVO.complaint_no}" alt=""></span>
				  		</div>
					</div>
					</div>
					<br>
					<hr style="height:2px;border-width:0;color:gray;background-color:gray">
					
			  		<div class="row">
			  			<div class="col-md-6 restype">
				  			<div class="form-group">
				  				<label for ="response"> Response Type</label>
								<input type="radio" name="restype" value="0" ${(compVO.status == "0") ? "checked" : "" }> Pending 
								<input type="radio" name="restype" value="1" ${(compVO.status == "1") ? "checked" : "" }> Processing 
								<input type="radio" name="restype" value="2" ${(compVO.status == "2") ? "checked" : "" }> Solved
							</div>
			  			</div>
			  			<div class="col-md-6">
			  				<div class="form-group">
			  					<label for ="response"> Response</label>
			  			 		<span><textarea  class="form-control" name="response" id="response" placeholder="Enter your response ">${compVO.response}</textarea></span>
			  				</div>
			  			</div>
			  			<div align="center">
			  				<input type="hidden" name="complaint_no" value="${compVO.complaint_no}">
				  			<input type="hidden" name="action" value="response">
				  			<input type="submit" class="btn btn-primary submit" style="width:190px;" value="Send your response">
			  			</div>
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
for (var i = 0; i < images.length; i++) { var image = images[i], width = String(image.currentStyle.width); if (width.indexOf('%') == -1) { continue; } image.origWidth = image.offsetWidth; image.origHeight = image.offsetHeight; imgCache.push(image); c.ieAlpha(image); image.style.width = width; }
</script>
</body>
</html>

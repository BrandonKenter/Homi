<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.apt.model.*"%>
<%@ page import="com.comp.model.*"%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	if(memVO == null){
		memVO = new MemVO();
		memVO.setMember_no(99);
	}
	pageContext.setAttribute("memVO", memVO);
	
/* 	String test = request.getParameter("complaint_no");
	Integer complaint_no = new Integer(test.trim());
	CompService compSvc = new CompService(); */
	CompVO compVO = (CompVO) request.getAttribute("CompVO");
/* 	CompVO compVO = compSvc.getOneComplaint(complaint_no); */
	pageContext.setAttribute("compVO", compVO);
	
	AptService aptSvc = new AptService();
	AptVO aptVO = aptSvc.getOneAptByApName(compVO.getAp_name());
	pageContext.setAttribute("aptVO", aptVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
<title>Show Complaint for Tenant</title>
<style>
body{
  background-image: url("<%=request.getContextPath()%>/img/lampcut.jpg");
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
  margin:90px 120px;
  font-family: 'Teko', sans-serif;
  width: 70%;

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
  color: #080808;
}
textarea.form-control {
    height: 135px;
   /* margin-top: px;*/
}


.form-group label{
	display: block;
	float: left;
	overflow: hidden;
	width: 190px;
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
    width: 50%
}

.w-100{
	padding:50px;
}
</style>
</head>
<body>
<jsp:include page="/front_header.jsp"/>
<div class="container">
	<div class="row">
		<div class="row">
			<div class="col-md-4">
				<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="${pageContext.request.contextPath}/apt/apt.do?action=view_aptPic1&ap_name=${aptVO.ap_name}" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
					  <img src="${pageContext.request.contextPath}/apt/apt.do?action=view_aptPic2&ap_name=${aptVO.ap_name}" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath}/apt/apt.do?action=view_aptPic3&ap_name=${aptVO.ap_name}" class="d-block w-100" alt="...">
				    </div>
				  </div>
				</div>
			</div>
			<div class="col-md-8">
			   <section id="contact">
				<div class="form-group">
			    	<label for="username">Tenant Name</label>
			    	<span><input type="text" class="form-control" value="<%=memSvc.getOneMem(compVO.getMember_no()).getMb_name()%>" id="username"  disabled="disabled"></span>
			  	</div>
				<div class="form-group">
			    	<label for="username">Apartment Name</label>
			    	<span><input type="text" class="form-control" value="<%=compVO.getAp_name()%>" id="username"  disabled="disabled"></span>
			  	</div>
				<div class="form-group">
			    	<label for="username">Apartment Address</label>
			    	<span><input type="text" class="form-control" value="<%=compVO.getAp_address()%>" id="username"  disabled="disabled"></span>
			  	</div>
				<div class="form-group">
			    	<label for="username">LandLord Name</label>
			    	<span><input type="text" class="form-control" value="<%=compVO.getLand_name()%>" id="username"  disabled="disabled"></span>
			  	</div>
			  </section>
			</div>
		</div>
		<br>
		<br>
		<hr style="height:2px;border-width:0;color:black;background-color:black">
		<div class="row">
		<h2>-- Event 1 --</h2>
			<div class="form-group">
		    	<label for="username">Description</label>
		    	<span><input type="text" class="form-control" value="<%=compVO.getDescription()%>" id="username"  disabled="disabled"></span>
			</div>
			<div class="form-group">
		    	<label for="username">Status</label>
		    	<c:choose>
                   <c:when test="${compVO.status==0}">
						<span><input type="text" class="form-control" value="Pending" id="username" style="width:10%;" disabled="disabled"></span>
                   </c:when>
                   <c:when test="${compVO.status==1}">
                         <span><input type="text" class="form-control" value="Processing" id="username" style="width:10%;"  disabled="disabled"></span>
                   </c:when>
                   <c:when test="${compVO.status==2}">
                         <span><input type="text" class="form-control" value="Solved" id="username" style="width:10%;"  disabled="disabled"></span>
                   </c:when>
                   <c:otherwise>
                   		 <span><input type="text" class="form-control" value="Invalid Status" id="username"  disabled="disabled"></span>
                   </c:otherwise>
	            </c:choose>  
		    	
			</div>
			<div class="form-group">
		    	<label for="username">LandLord's response</label>
		    	<span><input type="text" class="form-control" value="<%=compVO.getResponse()%>" id="username"  disabled="disabled"></span>
			</div>			
		</div>   
	</div> 
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    
</body>
</html>

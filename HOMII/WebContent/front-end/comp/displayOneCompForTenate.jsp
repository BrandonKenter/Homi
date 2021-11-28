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
  background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.2)), url("<%=request.getContextPath()%>/img/comp3.jpg");
  background-size:100%;
  background-attachment:fixed;
  color:#f7f0f0 !important;
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
			<h2>${compVO.case_title}</h2>
			<div class="col-md-6">
				<div class="form-group">
			    	<label for="username">Description</label>
			    	<span><textarea class="form-control" id="description" disabled>${compVO.description}</textarea></span>
				</div>
				<div class="form-group">
			    	<label for="username">Status</label>
			    	<span>
			    		<input type="radio" id="pending" name="status" class="compStatus" value="0" <%=(!compVO.getStatus().equals("0"))? "":"checked"%>>Pending&nbsp;
			    		<input type="radio" id="processing" name="status" class="compStatus" value="1" <%=(!compVO.getStatus().equals("1"))? "":"checked"%>>Processing&nbsp;
			    		<input type="radio" id="solved" name="status" class="compStatus" value="2" <%=(!compVO.getStatus().equals("2"))? "":"checked"%>>Solved&nbsp;
			    	</span>
				</div>
				<div class="form-group">
			    	<label for="username">Priority</label>
			    	<span>
			    	   ${compVO.priority}
			    	</span>
				</div>
					<p id="mem_name" style="display:none;">${memSvc.getOneMem(memVO.member_no).mb_name}</p>
			    	<p id="land_name" style="display:none;">${compVO.land_name}</p>
				<div class="form-group">
			    	<label for="username">LandLord's response</label>
			    	<span><textarea class="form-control" id="response">${compVO.response}</textarea></span>
				</div>	
			</div>		
			<div class="col-md-6">
				<div class="form-group">
					<label for="username">Photo</label>
					<span><img class="d-block w-100" src="${pageContext.request.contextPath}/comp/comp.do?action=view_comPic&complaint_no=${compVO.complaint_no}" alt=""></span>
				</div>
			</div>  
		</div>
 
	</div> 
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script>
$(".compStatus").click(function(e){
	let mb_name = $("#mem_name").text();
	let land_name = $("#land_name").text();

	if (mb_name != land_name){
        Swal.fire({
            position: "center",
            icon: "error",
            title: "Only Landlord can edit",
            showConfirmButton: false,
            timer: 1500,
        });
    	e.preventDefault();
	}
})
$("#response").click(function(e){
	let mb_name = $("#mem_name").text();
	let land_name = $("#land_name").text();

	if (mb_name != land_name){
        Swal.fire({
            position: "center",
            icon: "error",
            title: "Only Landlord can edit",
            showConfirmButton: false,
            timer: 1500,
        });
    	e.preventDefault();
	}
})
</script>

    
</body>
</html>

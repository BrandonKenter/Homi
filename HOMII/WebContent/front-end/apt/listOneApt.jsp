<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.apt.model.*" %>
<%@ page import="com.rate.model.*" %>
<%@ page import="com.mem.model.*" %>
<%@ page import="com.reg.model.*" %>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="compSvc" scope="page" class="com.comp.model.CompService" />
<jsp:useBean id="RegSvc" scope="page" class="com.reg.model.RegService" />
<% 
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	if(memVO == null){
		memVO = new MemVO();
		memVO.setMember_no(99);
	}
	AptVO aptVO = (AptVO) request.getAttribute("aptVO");
	pageContext.setAttribute("aptVO", aptVO);
	
	RateService rateSvc = new RateService();
	RateVO rateVO = rateSvc.getOneAvgRate(aptVO.getAp_no());
	pageContext.setAttribute("rateVO", rateVO);
	
	RegService regSvc = new RegService();
	RegVO regVO = regSvc.getOneRegister(memVO.getMember_no());
	if(regVO == null || !regVO.getAp_name().equals(aptVO.getAp_name())){
		regVO = null;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
<title>Apartment page</title>
<style>
body{
  background-image:url("<%=request.getContextPath()%>/img/complaint form.jpg");
  background-size:100%;
  background-attachment:fixed;
  color:#300b0b !important;
}
.row{
	margin-left:20px !important;
	margin-right:20px !important;
}
  table {
	width: 100%;
	background-color: white;
	margin-top: 0px;
	margin-bottom: 5px;
	
  }
  table, th, td {
/*     border: 1px solid #CCCCFF; */
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
  .forum-body{

  	padding:0;
}
.forum-nav{
/* 	background-color:#126E7D; */
}
.search-form{
	float:right;
}

.forum-body #forum>thead>tr>th{
	color:white;
	text-align:center;
}
.forum-body #forum>thead>tr>th,
.forum-body #forum>tbody>tr>td{
	font-size:small;
}
ul.nav-pills > li.active > a.toggle{
	background-color: #51A1B4;
}
table#forum.table>tbody>tr>td{
	padding-top:3px !important;
	padding-bottom:3px! important;
	color:#6c6760;
}
table#forum.table>tbody>tr:hover
{
	background-color:#FFFFDD !important;
 	transform: translateY(-5px); 
     box-shadow: 0 5px 5px rgba(0, 0, 0, 0.15); 
/* 	transition: box-shadow .25s; */
/*     box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 3px 10px 0 rgba(0, 0, 0, 0.19); */
}
table#forum.table>tbody>tr
{
 	box-shadow: 0 0 3px rgba(0, 0, 0, 0.2); 
     transition: 0.2s; 
/*  	transition: box-shadow .25s; */
/*     box-shadow: 0 0px 0px 0 rgba(0, 0, 0, 0.16), 0 1px 5px 0 rgba(0, 0, 0, 0.12); */
}
table#forum.table>tbody>tr>td>a
{
	font-weight:bold;
	color:black;
}
 table#forum.table>tbody>tr>td>a.notJQellipsis
 { 
 	font-weight:bold; 
 } 
table#forum.table>tbody>tr>td>a.JQellipsis
{
	font-weight:200;
	color:#6c6760;
	font-size:small;
}
#forum > tbody + tbody{
	border-top: 1px dotted #ddd;
}
.forum-nav>ul.nav.nav-pills>li>a.toggle{
	font-weight:700;
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
  margin:35px 50px;
  font-family: 'Teko', sans-serif;
  height: 82%;
  display: grid;

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
  margin: 10px 30px;
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
.balance{
	margin:38px 0px;
	border-radius:50px;
	backdrop-filter: blur(5px);
	background-color:#80808021;
}
.balance h1, div, a{
	text-align:center;
}
.submit{
  font-size: 1.1em;
  width: 200px;
  background-color: transparent;
  color: #fff;

}

.w-100{
	height: 250px;
	width: 80% !important;
	margin: 20px 0px;
	overflow:hidden;
	border-radius:30px;
}
.scoreBox{
	border-radius:30px;
  	backdrop-filter: blur(5px);
  	background-color:#80808021;
  	border:2px solid black;
  	height:168px;
}
.score{
	font-size:80px;
}
.scoreFooter{
	font-size:30px;
	color:white;
	background-color: #5c4f4f;
    border-radius: 0px 0px 30px 30px;
}
.subScoreBox{
}
.subRating{
}
button{
	width: 75%;
    height: 50px;
    border-radius: 10px !important;
    background-color: #427b01;
    color: white;
}
</style>
</head>
<body>
<jsp:include page="/front_header.jsp"/>
<div class="container">
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
		    	<label for="username">Apartment Name</label>
		    	<span><input type="text" class="form-control" value="<%=aptVO.getAp_name()%>" id="username"  disabled="disabled"></span>
		  	</div>
			<div class="form-group">
		    	<label for="username">Apartment Address</label>
		    	<span><input type="text" class="form-control" value="<%=aptVO.getAp_address()%>" id="username"  disabled="disabled"></span>
		  	</div>
			<div class="form-group">
		    	<label for="username">LandLord Name</label>
		    	<span><input type="text" class="form-control" value="<%=memSvc.getOneMem(aptVO.getMember_no()).getMb_name()%>" id="username"  disabled="disabled"></span>
		  	</div>
		  </section>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4 rating">
			<div class="scoreBox">
				<div class="score">
					<c:choose>
						<c:when test="${rateVO.avg_rating==null}">
							0
						</c:when>
						<c:otherwise>
							${rateVO.avg_rating}
						</c:otherwise>
					</c:choose>
				</div>
				<div class="scoreFooter">out of 5</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="scoreBox" style="display:grid;">
				<div class="subScoreBox row"><div class="subTitle col-md-7">HandleTime:
					</div>
						<div class="subRating col-md-5">
							<i class="fas fa-star" id="s1_handletime"></i>
					    	<i class="fas fa-star" id="s2_handletime"></i>
					    	<i class="fas fa-star" id="s3_handletime"></i>
					    	<i class="fas fa-star" id="s4_handletime"></i>
					    	<i class="fas fa-star" id="s5_handletime"></i>
						</div>
					</div>
				<div class="subScoreBox row"><div class="subTitle col-md-7">Clean:
					</div>
						<div class="subRating col-md-5">
							<i class="fas fa-star" id="s1_clean"></i>
					    	<i class="fas fa-star" id="s2_clean"></i>
					    	<i class="fas fa-star" id="s3_clean"></i>
					    	<i class="fas fa-star" id="s4_clean"></i>
					    	<i class="fas fa-star" id="s5_clean"></i>
						</div>
					</div>
				<div class="subScoreBox row"><div class="subTitle col-md-7">Service:
					</div>
						<div class="subRating col-md-5">
							<i class="fas fa-star" id="s1_service"></i>
							<i class="fas fa-star" id="s2_service"></i>
							<i class="fas fa-star" id="s3_service"></i>
							<i class="fas fa-star" id="s4_service"></i>
							<i class="fas fa-star" id="s5_service"></i>
						</div>
					</div>
				<div class="subScoreBox row"><div class="subTitle col-md-7">Price:
					</div>
						<div class="subRating col-md-5">
							<i class="fas fa-star" id="s1_price"></i>
							<i class="fas fa-star" id="s2_price"></i>
							<i class="fas fa-star" id="s3_price"></i>
							<i class="fas fa-star" id="s4_price"></i>
							<i class="fas fa-star" id="s5_price"></i>
						</div>
					</div>
				<div class="subScoreBox row"><div class="subTitle col-md-7">Location:
					</div>
						<div class="subRating col-md-5">
							<i class="fas fa-star" id="s1_location"></i>
							<i class="fas fa-star" id="s2_location"></i>
							<i class="fas fa-star" id="s3_location"></i>
							<i class="fas fa-star" id="s4_location"></i>
							<i class="fas fa-star" id="s5_location"></i>
						</div>
					</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="scoreBox">
				<div class="review">
					<p style="margin:25px;">Share details of your own <br> experience with this property</p>
					<a href="<%=request.getContextPath()%>/front-end/rate/addRate.jsp?ap_name=${aptVO.ap_name}" class="checkRegBtn"><button>Write a Review</button></a>
					<input type="text" class="form-control checkReg" value="<%= (regVO==null)? "-1" : "1"%>" style="display:none;">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
	<div style="text-align:center;"><h1 class="shadow p-3 mb-1 rounded" style="display:inline-block;">All the cases</h1></div>
		<table id="forum" class="table table-hover">
			 <thead style="background-color:#126E7D">
				<tr>		
					<th>Tenant</th>
					<th>Case Title</th>
					<th>Status</th>
					<th>Priority</th>			
					<th>Date</th>
				</tr>
			</thead>
			<c:forEach var="compVO" items="${compSvc.getAllCompByAptName(aptVO.ap_name)}">		
				<tbody>
					<tr>
						<td>${memSvc.getOneMem(compVO.member_no).mb_name}</td>
						<td style=" font-size:large;">
							<a class="notJQellipsis" href="<%=request.getContextPath()%>/comp/comp.do?action=getOne_For_Display&complaint_no=${compVO.complaint_no}">${compVO.case_title}</a>
						</td>		
					    <c:choose>
		                   <c:when test="${compVO.status==0}">
		                         <td>Pending</td>
		                   </c:when>
		                   <c:when test="${compVO.status==1}">
		                         <td>Processing</td>
		                   </c:when>
		                   <c:when test="${compVO.status==2}">
		                         <td>Solved</td>
		                   </c:when>
		                   <c:otherwise>
		                   		 <td>Invalid Status</td>
		                   </c:otherwise>
			            </c:choose>  
			            <td>${compVO.priority}</td>
						<td><fmt:formatDate value="${compVO.crt_dt}" pattern="yyyy-MM-dd HH:mm"/></td>
		
					</tr>
				</tbody>			
			</c:forEach>
		</table>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
window.onload = function(){
	let handletime = ${rateVO.rate_handletime};
	let s1_h = document.getElementById('s1_handletime');
	let s2_h = document.getElementById('s2_handletime');
	let s3_h = document.getElementById('s3_handletime');
	let s4_h = document.getElementById('s4_handletime');
	let s5_h = document.getElementById('s5_handletime');
	let list_h = [s1_h, s2_h, s3_h, s4_h, s5_h];
	for (let i = 0; i < handletime; i++){
		list_h[i].style['color']="#F0AD4E";
	}
	let clean = ${rateVO.rate_clean};
	let s1_c = document.getElementById('s1_clean');
	let s2_c = document.getElementById('s2_clean');
	let s3_c = document.getElementById('s3_clean');
	let s4_c = document.getElementById('s4_clean');
	let s5_c = document.getElementById('s5_clean');
	let list_c = [s1_c, s2_c, s3_c, s4_c, s5_c];
	for (let i = 0; i < clean; i++){
		list_c[i].style['color']="#F0AD4E";
	}
	let service = ${rateVO.rate_service};
	let s1_s = document.getElementById('s1_service');
	let s2_s = document.getElementById('s2_service');
	let s3_s = document.getElementById('s3_service');
	let s4_s = document.getElementById('s4_service');
	let s5_s = document.getElementById('s5_service');
	let list_s = [s1_s, s2_s, s3_s, s4_s, s5_s];
	for (let i = 0; i < service; i++){
		list_s[i].style['color']="#F0AD4E";
	}
	let price = ${rateVO.rate_price};
	let s1_p = document.getElementById('s1_price');
	let s2_p = document.getElementById('s2_price');
	let s3_p = document.getElementById('s3_price');
	let s4_p = document.getElementById('s4_price');
	let s5_p = document.getElementById('s5_price');
	let list_p = [s1_p, s2_p, s3_p, s4_p, s5_p];
	for (let i = 0; i < price; i++){
		list_p[i].style['color']="#F0AD4E";
	}
	let location = ${rateVO.rate_location};
	let s1_l = document.getElementById('s1_location');
	let s2_l = document.getElementById('s2_location');
	let s3_l = document.getElementById('s3_location');
	let s4_l = document.getElementById('s4_location');
	let s5_l = document.getElementById('s5_location');
	let list_l = [s1_l, s2_l, s3_l, s4_l, s5_l];
	for (let i = 0; i < location; i++){
		list_l[i].style['color']="#F0AD4E";
	}
}
$(".checkRegBtn").click(function(e){
	let checkReg = $(".checkReg").val();
	console.log(checkReg)
	if (checkReg == -1){
        Swal.fire({
            position: "center",
            icon: "error",
            title: "Only tenant can rate this apartment",
            showConfirmButton: false,
            timer: 1500,
        });
    	e.preventDefault();
	}

})
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.comp.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.reg.model.*"%>


<jsp:useBean id="compSvc" scope="page" class="com.comp.model.CompService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="compDAO" scope="page" class="com.comp.model.CompDAO" />	
<jsp:useBean id="memVO" scope="session" class="com.mem.model.MemVO" />
<%
	memVO = memSvc.getOneMem(memVO.getMember_no());
	pageContext.setAttribute("memVO", memVO);
	RegService regSvc = new RegService();
	RegVO regVO = regSvc.getOneRegister(memVO.getMember_no());
	pageContext.setAttribute("regVO", regVO);


%>
<html>
<head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
<title>List All Complaint for Tenant</title>

<style>
   body {  
/*      width: 1200px;   */


	font-family: "Helvetica Neue", Helvetica, Roboto, Arial, "Lucida Grande", "PingFang TC", "Apple LiGothic Medium", sans-serif;
	  background-image: url("<%=request.getContextPath()%>/img/complaint form.jpg");
  background-size:100%;
    background-attachment:fixed;
 	        }  
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
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
  width: 87%;
  backdrop-filter: blur(5px);
  position:relative;
  border-radius:50px;
  backdrop-filter: blur(5px);
  background-color:#80808021;

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
	margin:38px 50px;
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
</style>

</head>
<body>
<jsp:include page="/front_header.jsp"/>
<div class="container-fluid forum-body" style="min-height:450px;">
<c:if test="${not empty errorMsgs}">
	<font style="color:red">Fix error as below:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<div class="row">
	<div class="col-md-6">
		<div class="balance" >
			<h1>Your current balance is :</h1>
			<br>
			<div style="font-size:50px;">${memVO.balance}</div>
			<br><br><br>
			<a href="<%=request.getContextPath()%>/front-end/bal/displayBalForTenant.jsp"><input type="button" class="btn btn-primary submit" value="Make a payment"></a>
		</div>
	</div>
	<div class="col-md-6">
		<section id="contact">
			<h1>My Rent</h1>
			<div class="form-group">
		    	<label for="apName">Apartment Name</label>
		    	<span><input type="text" class="form-control" value="<%= (regVO==null)? "" : regVO.getAp_name()%>" id="apName"  disabled="disabled"></span>
		  	</div>
			<div class="form-group">
		    	<label for="apAddress">Apartment Address</label>
		    	<span><input type="text" class="form-control" value="<%= (regVO==null)? "" : regVO.getAp_address()%>" id="apAddress"  disabled="disabled"></span>
		  	</div>
			<div class="form-group">
		    	<label for="landName">LandLord Name</label>
		    	<span><input type="text" class="form-control" value="<%= (regVO==null)? "" : regVO.getLand_name()%>" id="landName"  disabled="disabled"></span>
		  	</div>
			<div class="form-group">
		    	<label for="status">Status</label>
		    	 <c:choose>
                   <c:when test="${regVO.status == 0}">
		    			 <span>Pending</span>
                   </c:when>
                   <c:when test="${regVO.status == 1}">
                         <span>Approved</span>
                   </c:when>
                   <c:when test="${regVO.status == 2}">
                         <span>Rejected</span>
                   </c:when>
                   <c:otherwise>
                   		 <span>Pending</span>
                   </c:otherwise>
	            </c:choose>  
		  	</div>
		  	<a href="<%=request.getContextPath()%>/front-end/reg/addReg.jsp"><input type="button" class="btn btn-primary submit" value="Register new rent"></a>
		</section>
	</div>
<div style="text-align:center;"><h1 class="shadow p-3 mb-1 rounded" style="display:inline-block;">All the cases</h1></div>
<table id="forum" class="table table-hover">
	 <thead style="background-color:#126E7D">
		<tr>		
			<th>Apartment Name</th>
			<th>Case Title</th>
			<th>Status</th>
			<th>Priority</th>			
			<th>Date</th>
		</tr>
	</thead>
	<c:forEach var="compVO" items="${compSvc.getAllCompByMemNo(memVO.member_no)}">		
		<tbody>
			<tr>
				<td>${compVO.ap_name}</td>

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
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
$(function(){
    var len = 50;
    $(".JQellipsis").each(function(i){
        if($(this).text().length>len){
            $(this).attr("title",$(this).text());
            var text=$(this).text().substring(0,len-1)+"<a href=" + $(this).attr('href') + ">......see more...<a>";
            
            $(this).html(text);
        }
    });
});

$("#forum>tbody>tr>td").mouseover(function(){

		$(this).find(".notJQellipsis").css("color", "#126E7D");
});

$("#forum>tbody>tr>td").mouseleave(function(){
	$(this).find(".notJQellipsis").css("color", "black");
});

function loginFirst(){
	Swal.fire('Please Login').then((result)=>{
		window.location.href = "<%=request.getContextPath()%>/front-end/mem/MemLogin.jsp";
	});
}


</script>
</html>

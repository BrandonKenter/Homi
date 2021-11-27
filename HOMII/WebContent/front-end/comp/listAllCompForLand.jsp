<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.comp.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.reg.model.*"%>
<%@ page import="com.apt.model.*"%>

	<jsp:useBean id="compSvc" scope="page" class="com.comp.model.CompService" />
	<jsp:useBean id="regSvc" scope="page" class="com.reg.model.RegService" />
	<jsp:useBean id="aptSvc" scope="page" class="com.apt.model.AptService" />
	<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
	<jsp:useBean id="compDAO" scope="page" class="com.comp.model.CompDAO" />	
	<jsp:useBean id="memVO" scope="session" class="com.mem.model.MemVO" />
<html>
<head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
<title>List All Complaint for Landlord</title>

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

.forum-body>.row{
	margin-top:10px;
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

.addApt{
  font-size: 1.1em;
  width: 170px;
  background-color: transparent;
  color: #fff;
  position:relative;
  left:1240px;
  margin-top:10px;
  border-color:cadetblue;
  border-radius:50px;

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

<a href="<%=request.getContextPath()%>/front-end/apt/addApt.jsp"><button class="btn-success addApt">Add an Apartment</button></a>

<div class="row">
<div class="col-md-6">
<div style="text-align:center;"><h3 class="shadow p-3 mb-1 rounded" style="display:inline-block;">Applications for your property</h3></div>
	<table id="forum" class="table table-hover">
	 <thead style="background-color:#126E7D">
		<tr>		
			<th>Apartment Name</th>
			<th>Tenant</th>
			<th>Status</th>
			<th>Start Date</th>
		</tr>
	</thead>
	<c:forEach var="regVO" items="${regSvc.getAllRegisterByLandName(memVO.mb_name)}">		
		<tbody>
			<tr>

				<td style=" font-size:large;">
					<a class="notJQellipsis" href="<%=request.getContextPath()%>/front-end/reg/displayOneRegForLand.jsp?reg_no=${regVO.reg_no}">${regVO.ap_name}</a>
									
				</td>		
				
				<td>${memSvc.getOneMem(regVO.member_no).mb_name}</td>		
			    <c:choose>
                   <c:when test="${regVO.status==0}">
                         <td>Pending</td>
                   </c:when>
                   <c:when test="${regVO.status==1}">
                         <td>Approved</td>
                   </c:when>
                   <c:when test="${regVO.status==2}">
                         <td>Rejected</td>
                   </c:when>
                   <c:otherwise>
                   		 <td>Invalid Status</td>
                   </c:otherwise>
	            </c:choose>  
				<td><fmt:formatDate value="${regVO.start_dt}" pattern="yyyy-MM-dd HH:mm"/></td>

			</tr>
		</tbody>			
	</c:forEach>
</table>
</div>
<div class="col-md-6">
<div style="text-align:center;"><h3 class="shadow p-3 mb-1 rounded" style="display:inline-block;">Your property</h3></div>
<table id="forum" class="table table-hover">
	 <thead style="background-color:#126E7D">
		<tr>		
			<th>Apartment Name</th>
			<th>Apartment Address</th>
			<th>Rating</th>
		</tr>
	</thead>
	<c:forEach var="aptVO" items="${aptSvc.getAllAptByMemNo(memVO.member_no)}">		
		<tbody>
			<tr>

				<td style=" font-size:large;">
					<a class="notJQellipsis" href="<%=request.getContextPath()%>/front-end/apt/displayOneAptForLand.jsp?ap_no=${aptVO.ap_no}">${aptVO.ap_name}</a>			
				</td>		
				<td>${aptVO.ap_address}</td>		
				<td>${aptVO.rating}</td>		
			</tr>
		</tbody>			
	</c:forEach>
</table>
</div>
</div>	

<br><br><br><br><br><br>
	
<div style="text-align:center;"><h1 class="shadow p-3 mb-1 rounded" style="display:inline-block;">Complaint cases</h1></div>
<div class="row">
<table id="forum" class="table table-hover">
	 <thead style="background-color:#126E7D">
		<tr>		
			<th>Apartment Name</th>
			<th>Case Title</th>
			<th>Tenant</th>
			<th>Status</th>
			<th>Priority</th>
			<th>Date</th>
		</tr>
	</thead>
	<c:forEach var="compVO" items="${compSvc.getAllCompByLand(memVO.mb_name)}">		
		<tbody>
			<tr>
				<td>${compVO.ap_name}</td>

				<td style=" font-size:large;">
					<a class="notJQellipsis" href="<%=request.getContextPath()%>/front-end/comp/displayOneCompForLand.jsp?complaint_no=${compVO.complaint_no}">${compVO.case_title}</a>
									
				</td>		
				
				<td>${memSvc.getOneMem(compVO.member_no).mb_name}</td>		
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




</script>
</html>

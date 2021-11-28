<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search result</title>
<style>
   body {  
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
.row{
	margin-left:20px !important;
	margin-right:20px !important;
}
  table {
	width: 100%;
	background-color: white;
	margin-top: 0px;
	margin-bottom: 5px;
	border-collapse: inherit !important;
	vertical-align: inherit !important;
	
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
.table>thead{
	text-align: center;
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
.searchdiv{
	background-color:rgb(0,0,100,0.1);
	padding:10px 45px;
	border-radius: 15px;
	position: relative;
	display: inline-block;
	float:right;
	margin: 10px 0px;
}
.form-control {
	width: 300px !important; 
}
</style>
</head>
<body>
<jsp:include page="/front_header.jsp"/>
<div class="searchdiv" >
	<form method="post" action="<%=request.getContextPath()%>/apt/apt.do">
		<div class="input-group">
		  <div class="form-outline">
				<input type="search" name="ap_name" value="" class="form-control" placeholder="What are you looking for?" onkeydown="if (event.keyCode == 13) sendMessage();">
		 	    <input type="hidden" name="action" value="listApt_ByCompositeQuery">
		  </div>
			  <button id="search-button" type="submit" class="btn btn-primary">
			    <i class="fas fa-search"></i>
			  </button>
		</div>
	</form>
</div>
<table id="forum" class="table table-hover">
	 <thead style="background-color:#126E7D">
		<tr>		
			<th>Photo</th>
			<th>Apartment Name</th>
			<th>Apartment Address</th>
			<th>Landlord Name</th>			
			<th>Rating</th>
		</tr>
	</thead>
	<c:forEach var="aptVO" items="${listApt_ByCompositeQuery}">		
		<tbody>
			<tr>
				<td>
					<img src="${pageContext.request.contextPath}/apt/apt.do?action=view_aptPic1&ap_name=${aptVO.ap_name}"
								alt="No pic" width="96px;" height="108px" title=""/>
				</td>
				<td style=" font-size:large;">
					<a class="notJQellipsis" href="<%=request.getContextPath()%>/apt/apt.do?action=getOne_For_Display&ap_no=${aptVO.ap_no}">${aptVO.ap_name}</a>
				</td>		
	            <td>${aptVO.ap_address}</td>
	            <td>${memSvc.getOneMem(aptVO.member_no).mb_name}</td>
				<td>${aptVO.rating}</td>

			</tr>
		</tbody>			
	</c:forEach>
</table>
</body>
</html>
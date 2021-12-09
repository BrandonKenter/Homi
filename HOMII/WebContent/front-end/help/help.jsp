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

<title>Get Help</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
/*Contact sectiom*/

body {
 background-image: url("<%=request.getContextPath()%>/img//memInfo.jpg");
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

.form-group input {
    width: 100%
}

.askPubType{
	text-align:center;
	margin-top:60px;
}


.chip {
  display: inline-block;
  padding: 0 25px;
  height: 50px;
  font-size: 16px;
  line-height: 50px;
  border-radius: 25px;
  background-color: #f1f1f1;
}

.chip img {
  float: left;
  margin: 0 10px 0 -25px;
  height: 50px;
  width: 50px;
  border-radius: 50%;
}



</style>
</head>
<body>
<jsp:include page="/front_header.jsp"/>

</br>
</br> 

<ul>
	
<h2><b>Resources for tenants</h2>
    <ul>
        <li> <a href="https://www.tenantresourcecenter.org/" target="_blank">Tenant Resource Center</a> </li>
        <li> <a href="https://www.wiscap.org/" target="_blank">Wisconsin Emergency Rental Assistance</a> </li>
        <li> <a href="https://doa.wi.gov/Pages/WERA.aspx" target="_blank">WI Emergency Rental Assistance Program</a> </li>
	</ul>	
</br>
</br>
    
    <h2><b>Contact</b></h2>
    <p>Feel free to contact with us if you have problems with this web.</p>
    
    
    
<div class="chip">
  <img src="<%=request.getContextPath()%>/img//bl.png" alt="Person" width="96" height="96">
  Bailong Huang: bhuang67@wisc.edu&ensp;&ensp;&ensp;&ensp;
</div>
</br>
</br>
<div class="chip">
  <img src="<%=request.getContextPath()%>/img//bran.png" alt="Person" width="96" height="96">
 Brandon Kenter: bjkenter@wisc.edu&ensp;&ensp;&ensp;&ensp;&ensp;
</div>
</br>
</br>
<div class="chip">
  <img src="<%=request.getContextPath()%>/img//ih.png" alt="Person" width="96" height="96">
  I-Hsien Lai: ilai3@wisc.edu&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
</div>
</br>
</br>
<div class="chip">
  <img src="<%=request.getContextPath()%>/img//mat.png" alt="Person" width="96" height="96">
  Matthew Maurice: mamaurice@wisc.edu
</div>
</br>
</br>
<div class="chip">
  <img src="<%=request.getContextPath()%>/img//ty.png" alt="Person" width="96" height="96">
  Taiyen Wu: twu287@wisc.edu&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
</div>

</ul>


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



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>




</body>
</html>
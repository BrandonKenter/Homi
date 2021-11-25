<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.comp.model.*"%>
<%@ page import="com.reg.model.*"%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	if(memVO == null){
		memVO = new MemVO();
		memVO.setMember_no(99);
	}
	pageContext.setAttribute("memVO", memVO);
	String test = request.getParameter("reg_no");
	Integer reg_no = new Integer(test.trim());
	RegService regSvc = new RegService();
	RegVO regVO = regSvc.getOneRegisterByRegNo(reg_no);
	pageContext.setAttribute("regVO", regVO);
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />

<title>Show Registration</title>
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
  width: 220px;
  background-color: transparent;
  color: #fff;
  margin-top:50px;
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
.form-group input[type=text] {
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
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reg/reg.do" name="form2" enctype="multipart/form-data" data-toggle="validator">  
	<section id="contact">
			<div class="section-content">
				<h1 class="section-header">Application Form </h1>
			</div>
			<div class="contact-section">
			<div class="container">
				<div class="row">
				<form>
				<div class="row">
					<div class="col-md-6">
					<p>Apartment Info</p>
						<div class="form-group">
					    	<label for="username">Tenant Name</label>
					    	<span><input type="text" class="form-control" value="<%= (regVO==null)? "" : (memSvc.getOneMem(regVO.getMember_no())).getMb_name() %>" id="username"  disabled="disabled"></span>
					    	<input type="hidden" name="regNo" value="${regVO.reg_no}">
			  			</div>
			  			<div class="form-group">
			  				<label for="apName">Apartment Name</label>
					    	<span><input type="text" class="form-control" name="apName" value="<%= (regVO==null)? "" : regVO.getAp_name() %>" id="apName" ></span>
				  		</div>
				  		<div class="form-group">
					    	<label for="apAddress">Apartment Address</label>
					    	<span><input type="text" class="form-control" name="apAddress" value="<%= (regVO==null)? "" : regVO.getAp_address() %>" id="apAddress" ></span>
					  	</div>
			  		</div>
			  		<div class="col-md-6">
						<br>
			  			<div class="form-group">
			  				<label for="Start">Start date</label>
					    	<span><input type="text" class="form-control" name="start_dt" id="f_date1"></span>
				  		</div>
			  			<div class="form-group">
			  				<label for ="End">End date</label>
			  			 	<span><input type="text" class="form-control" name="end_dt" id="f_date2"></span>
			  			</div>
			  			<div class="form-group">
				  				<label for ="response"> Response : </label>
								<input type="radio" name="restype" value="0" ${(regVO.status == "0") ? "checked" : "" }> Pending 
								<input type="radio" name="restype" value="1" ${(regVO.status == "1") ? "checked" : "" }> Approved
								<input type="radio" name="restype" value="2" ${(regVO.status == "2") ? "checked" : "" }> Rejected
						</div>
					</div>
					</div>
					<hr style="height:2px;border-width:0;color:gray;background-color:black; margin-top:40px;">

			  		<div align="center">
			  			<input type="hidden" name="action" value="feedback">
			  			<input type="submit" class="btn btn-primary submit" value="Send your response">
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
//modify photo size
for (var i = 0; i < images.length; i++) { var image = images[i], width = String(image.currentStyle.width); if (width.indexOf('%') == -1) { continue; } image.origWidth = image.offsetWidth; image.origHeight = image.offsetHeight; imgCache.push(image); c.ieAlpha(image); image.style.width = width; }



</script>
</body>


<%
java.sql.Date start_dt = null;
try {
	start_dt = regVO.getStart_dt();
} catch (Exception e) {
	start_dt = new java.sql.Date(System.currentTimeMillis());
}

java.sql.Date end_dt = null;
try {
	end_dt = regVO.getEnd_dt();
} catch (Exception e) {
	end_dt = null;
}
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>
<script>
$.datetimepicker.setLocale('en');
$('#f_date1').datetimepicker({
   theme: '',              //theme: 'dark',
   timepicker:false,       //timepicker:true,
   step: 1,                //step: 60 
   format:'Y-m-d',         //format:'Y-m-d H:i:s',
   value: '<%=regVO.getStart_dt()%>', // value:   new Date(),
//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], //
//startDate:	            '2017/07/10',  // 
minDate:               '-1970-01-01', // 
//maxDate:               '+1970-01-01'  // 
});

$.datetimepicker.setLocale('en');
$('#f_date2').datetimepicker({
   theme: '',              //theme: 'dark',
   timepicker:false,       //timepicker:true,
   step: 1,                //step: 60 
   format:'Y-m-d',         //format:'Y-m-d H:i:s',
   value: '<%=regVO.getEnd_dt()%>', // value:   new Date(),
//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 
//startDate:	            '2017/07/10',  //
minDate : '-1970-01-01', // 
//maxDate:               '+1970-01-01'  // 
});
</script>
</html>
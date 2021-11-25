<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.reg.model.*"%>
<jsp:useBean id="regSvc" scope="page" class="com.reg.model.RegService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="balSvc" scope="page" class="com.bal.model.BalService" />
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
	<title>Payment System</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Badger Bank">
    <meta name="author" content="Matthew Maurice">
    <!-- <link rel="stylesheet" href="styles.css"> -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    
    <style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
body{
	background-image:url("<%=request.getContextPath()%>/img/complaint form.jpg");
	background-size:100%;
	  background-attachment:fixed;
}
.row{
	margin-left:20px !important;
	margin-right:20px !important;
}
  table {
	width: 100%;
	background-color: white !important;
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
</style>
    
</head>
<body>
<jsp:include page="/front_header.jsp"/>
	<br>
            <br>
            <h2 style="text-align:center">Welcome to your payment portal!</h2>  
            
            <br>
            
            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pay/pay.do" class="payform" name="form2" enctype="multipart/form-data" data-toggle="validator">
            <p style="text-align:center">Please Select Tenant</p>
            <div class="dropdown" style="text-align:center">
				<select name="tenant_name" id="showTenateBal">
					<c:forEach var="regVO" items="${regSvc.getAllRegisterByLandNameWithApproval(memVO.mb_name)}">
						<option value="${regVO.member_no}" >${memSvc.getOneMem(regVO.member_no).mb_name}
					</c:forEach>
				</select>
            </div>
            <br>


            <!--Pick Action-->
            <div style="text-align:center" onchange="landlordTypeSelect()">
              <div class="form-check form-check-inline" >
                <input class="form-check-input" type="radio" name="llRadio" value="0" id="llPenaltyRadio" formaction="javascript:landlordPenaltySelect();">
                <label class="form-check-label" for="flexRadioDefault1">
                  Penalty
                </label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="llRadio" value="1" id="llPaymentRadio" checked formaction="javascript:landlordPaymentSelect();">
                <label class="form-check-label" for="flexRadioDefault2">
                  Payment
                </label>
              </div>
            </div>

            <!--
          <p>Enter Credit Card Info:</p>
          <input style="margin-bottom: 10px" id="CreditCardInfo" type="text"></input>
            -->

          <!-- Payment -->
          <div id = "llPaymentForm" style="text-align:center">
            <p>Enter Amount:</p>
            <input style="margin-bottom: 10px" name="price" id="amountPaid" type="text"></input>
          	<input type="hidden" name="member_no" value="${memVO.member_no}">
          	<input type="hidden" name="action" value="addPrice">
			<input type="submit" id="submitBtn" style="margin-bottom: 10px" class="btn btn-primary submit" value="Add to Balance">
          </div>

	</FORM>
	<div style="text-align:center;"><h1 class="shadow p-3 mb-1 rounded" style="display:inline-block;">Payment Log</h1></div>
<div class="row">
<table id="forum" class="table table-hover">
	 <thead style="background-color:#126E7D">
		<tr>		
			<th>Date</th>
			<th>Tenant Name</th>
			<th>Transaction Type</th>
			<th>Price</th>
		</tr>
	</thead>

	<c:forEach var="balVO" items="${balSvc.getAllBalByLandNo(memVO.member_no)}">	
		<tbody>
			<tr>
				<td>${balVO.crt_dt}</td>
				
				<td>${memSvc.getOneMem(balVO.member_no).mb_name}</td>		

			    <c:choose>
                   <c:when test="${balVO.type == 0}">
                         <td>A LATE FEE</td>
                   </c:when>
                   <c:when test="${balVO.type == 1}">
                         <td>CHECK A PAYMENT</td>
                   </c:when>
                   <c:when test="${balVO.type == 2}">
                         <td>PAYMENT FROM TENANT</td>
                   </c:when>
                   <c:otherwise>
                   		 <td>Invalid Type</td>
                   </c:otherwise>
	            </c:choose>  
				<td>${balVO.price}</td>
			</tr>
		</tbody>			
	</c:forEach>
</table>

</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script>
	
	$("#amountPaid").change(function(){
		var p = $("#amountPaid").val();
		console.log(p);
		if (isNaN(parseInt(p))){
			Swal.fire('Please enter digit only');
		}
	})
	
		function landlordAddPayment() {
	
		    var curBal = document.getElementById("balance").innerHTML;
	
		    var paymentAmnt = document.getElementById("amountPaid").value;
	
		    // Displays errors if input is not a number, or is empty
			if (isNaN(paymentAmnt) || paymentAmnt.length == 0){
				console.log("Invalid Value");	
			}
			// Displays the new balance
			else {
				document.getElementById("balance").innerHTML = curBal - paymentAmnt;
			}   
		}
		
		function landlordAddPenalty() {

		    var curBal = document.getElementById("balance").innerHTML;

		    var penaltyAmnt = document.getElementById("penaltyAmount").value;

		    // Displays errors if input is not a number, or is empty
			if (isNaN(penaltyAmnt) || penaltyAmnt.length == 0){
				console.log("Invalid Value");	
			}
			// Displays the new balance
			else {
				newBal = parseFloat(curBal)+parseFloat(penaltyAmnt);
		        console.log(newBal);

		        document.getElementById("balance").innerHTML = newBal;
			}
		}
	
		function landlordTypeSelect() {
		    //console.log("PaymentOutter");
		    if ($("#llPaymentRadio").is(":checked")) {
		        //console.log("Payment");
		        document.getElementById("llPaymentForm").style.visibility = "visible";
		        document.getElementById("llPenaltyForm").style.visibility = "hidden";
		    }
		    if ($("#llPenaltyRadio").is(":checked")) {
		        //console.log("Payment");
		        document.getElementById("llPenaltyForm").style.visibility = "visible";
		        document.getElementById("llPaymentForm").style.visibility = "hidden";
		    }
		    // document.getElementById("llPaymentForm").style.visibility = "visible";
		    // document.getElementById("llPenaltyForm").style.visibility = "hidden";
		}
		
		$("#showTenateBal").change(function(){
        	let tenant_no = "${regVO.member_no}"; 
        	let balance = $("#balance");
	    	$.ajax({
	    		url: "<%=request.getContextPath()%>/bal/bal.do?action=showTenBal",
                data: { 
          		  "tenant_no" : tenant_no 
            	},
	    		type: "POST",
	    		success: function(json){
						let jsonobj = JSON.parse(json);
						let tenant_no = jsonobj.tenant_bal;
						console.log(tenant_no);
						balance.text()=tenant_no;
	    		}
	    	});
		});
	
	
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.apt.model.*"%>
<%@ page import="com.comp.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	if(memVO == null){
		memVO = new MemVO();
		memVO.setMember_no(99);
	}
	pageContext.setAttribute("memVO", memVO);
	
	AptService aptSvc = new AptService();
	List<AptVO> topApt = aptSvc.getAllTop();
	pageContext.setAttribute("topApt", topApt);
	List<AptVO> bottomApt = aptSvc.getAllBottom();
	pageContext.setAttribute("bottomApt", bottomApt);
	
	CompService compSvc = new CompService();
	List<CompVO> latestCase = compSvc.getAllLatestCase();
	pageContext.setAttribute("latestCase",latestCase);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
<title>HöMI</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif
}

body {
    background-color: #eee
}

.container {
    min-height: 80vh;
    padding: 20px 0;
    display: flex;
    align-items: center;
    justify-content: center
}

p {
    margin: 0px
}

.card {
    width: 280px;
    height: 540px;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
    background: #fff;
    transition: all 0.5s ease;
    cursor: pointer;
    user-select: none;
    z-index: 10;
    overflow: hidden
}

.card .backgroundEffect {
    bottom: 0;
    height: 0px;
    width: 100%
}

.card:hover {
    color: #fff;
    transform: scale(1.025);
    box-shadow: rgba(0, 0, 0, 0.24) 0px 5px 10px
}

.card:hover .backgroundEffect {
    bottom: 0;
    height: 320px;
    width: 100%;
    position: absolute;
    z-index: -1;
    background: #1b9ce3;
    animation: popBackground 0.3s ease-in
}

@keyframes popBackground {
    0% {
        height: 20px;
        border-top-left-radius: 50%;
        border-top-right-radius: 50%
    }

    50% {
        height: 80px;
        border-top-left-radius: 75%;
        border-top-right-radius: 75%
    }

    75% {
        height: 160px;
        border-top-left-radius: 85%;
        border-top-right-radius: 85%
    }

    100% {
        height: 320px;
        border-top-left-radius: 100%;
        border-top-right-radius: 100%
    }
}

.card .pic {
    position: relative
}

.card .pic img {
    width: 100%;
    height: 280px;
    object-fit: cover
}

.card .date {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 50px;
    height: 70px;
    background-color: #1b9ce3;
    color: white;
    position: absolute;
    bottom: 0px;
    transition: all ease
}

.card .date .day {
    font-size: 14px;
    font-weight: 600
}

.card .date .month,
.card .date .year {
    font-size: 10px
}

.card .text-muted {
    font-size: 12px
}

.card:hover .text-muted {
    color: #fff !important
}

.card .content {
    padding: 0 20px
}

.card .content .btn {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 5px 10px;
    background-color: #1b9ce3;
    border-radius: 25px;
    font-size: 12px;
    border: none
}

.card:hover .content .btn {
    background: #fff;
    color: #1b9ce3;
    box-shadow: #0000001a 0px 3px 5px
}

.card .content .btn .fas {
    font-size: 10px;
    padding-left: 5px
}

.card .content .foot .admin {
    color: #1b9ce3;
    font-size: 12px
}

.card:hover .content .foot .admin {
    color: #fff
}

.card .content .foot .icon {
    font-size: 12px
}

#bgimg {
	background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, -0.3)), url("<%=request.getContextPath()%>/img/home.jpg");
	width:100%;
	height:700px;
	background-size:cover;
	
}

.titlefont{
	font-family: system-ui;
	font-size:3rem;
	position:relative;
	top:-60px;
	text-align: center;
}


.parafont {
	position:relative;
	top:-30px;
	text-align: center;
}
.title1{
	position:relative;
	top:35px;
	margin-left:110px;
	font-family: system-ui;
}

.searchdiv{
	background-color:rgb(0,0,100,0.1);
	padding:10px 45px;
	border-radius: 15px;
	position: relative;
	top:25px;
}
.form-control {
	width: 550px !important; 
}
</style>
</head>
<body>
<jsp:include page="/front_header.jsp"/>
<div id="bgimg">
    <div class="container">
    	<div class="row" >
    		<div class="col-md-12">
    			<h1 class="text-white titlefont">Welcome to HöMI</h1>
    			<p class="text-white parafont">A good place to find your perfect apartment</p>
    			<div class="searchdiv" style="display:none;">
    				<form method="post" action="<%=request.getContextPath()%>/apt/apt.do">
	    				<div class="input-group">
	    				  <div class="form-outline">
	    						<input type="search" name="ap_name" value="" class="form-control" placeholder="What apartments are you looking for?" onkeydown="if (event.keyCode == 13) sendMessage();">
	    				 	    <input type="hidden" name="action" value="listApt_ByCompositeQuery">
	    				  </div>
							  <button id="search-button" type="submit" class="btn btn-primary">
							    <i class="fas fa-search"></i>
							  </button>
	    				</div>
    				</form>
    			</div>
    		</div>
    	</div>
    </div>	
</div>
<h2 class="title1">Top Apartments</h2>
<div class="container">
    <div class="d-lg-flex">
    <c:forEach var="aptVO" items="${topApt}" begin="0" end="3">
    <a href="<%=request.getContextPath()%>/apt/apt.do?action=getOne_For_Display&ap_no=${aptVO.ap_no}" style="text-decoration:none;">
        <div class="card border-0 me-lg-4 mb-lg-0 mb-4">
            <div class="backgroundEffect"></div>
            <div class="pic"><img src="${pageContext.request.contextPath}/apt/DBGifReader4.do?ap_no=${aptVO.ap_no}"  alt="">
            </div>
            <div class="content">
                <p class="h-1 mt-4">${aptVO.ap_name}</p>
                <p class="text-muted mt-3">Landlord: ${memSvc.getOneMem(aptVO.member_no).mb_name}, <br><br> Address: ${aptVO.ap_address}, <br><br>Rating: ${aptVO.rating} </p>
                 <div class="d-flex align-items-center justify-content-between mt-3 pb-3">
                    <div class="btn btn-primary">See Detail<span class="fas fa-arrow-right"></span></div>
                    <div class="d-flex align-items-center justify-content-center foot">
                    </div>
                </div>
            </div>
        </div>
   </a>
   </c:forEach>
    </div>
</div>
<h2 class="title1">Worst Apartments</h2>
<div class="container">
    <div class="d-lg-flex">
    <c:forEach var="aptVO" items="${bottomApt}" begin="0" end="3">
    <a href="<%=request.getContextPath()%>/apt/apt.do?action=getOne_For_Display&ap_no=${aptVO.ap_no}" style="text-decoration:none;">
        <div class="card border-0 me-lg-4 mb-lg-0 mb-4">
            <div class="backgroundEffect"></div>
            <div class="pic"><img src="${pageContext.request.contextPath}/apt/DBGifReader4.do?ap_no=${aptVO.ap_no}"  alt="">
            </div>
            <div class="content">
                <p class="h-1 mt-4">${aptVO.ap_name}</p>
                <p class="text-muted mt-3">Landlord: ${memSvc.getOneMem(aptVO.member_no).mb_name}</p> 
                <p class="text-muted mt-3">Address: ${aptVO.ap_address}</p>
                <p class="text-muted mt-3">Rating: ${aptVO.rating} </p>
                 <div class="d-flex align-items-center justify-content-between mt-3 pb-3">
                    <div class="btn btn-primary">See Detail<span class="fas fa-arrow-right"></span></div>
                    <div class="d-flex align-items-center justify-content-center foot">
                    </div>
                </div>
            </div>
        </div>
   </a>
   </c:forEach>
    </div>
</div>
<h2 class="title1">Latest Cases</h2>
<div class="container">
    <div class="d-lg-flex">
        <c:forEach var="compVO" items="${latestCase}" begin="0" end="3">
         <a href="<%=request.getContextPath()%>/comp/comp.do?action=getOne_For_Display&complaint_no=${compVO.complaint_no}" style="text-decoration:none;">
        <div class="card border-0 me-lg-4 mb-lg-0 mb-4">
            <div class="backgroundEffect"></div>
            <div class="pic"><img src="${pageContext.request.contextPath}/apt/apt.do?action=view_aptPic1&ap_name=${compVO.ap_name}"  alt="">
            </div>
            <div class="content">
                <p class="h-1 mt-4">${compVO.ap_name}</p>
                <p class="text-muted mt-3">
                Status: 			    
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
			    </p>
			    <p class="text-muted mt-3">Case Title: ${compVO.case_title}</p> 
			    <p class="text-muted mt-3 cutText">Description : ${compVO.description}</p>
			    <p class="text-muted mt-3 cutText">Date : ${compVO.crt_dt}</p>
                <div class="d-flex align-items-center justify-content-between mt-3 pb-3">
                    <div class="btn btn-primary">Read More<span class="fas fa-arrow-right"></span></div>
                    <div class="d-flex align-items-center justify-content-center foot">
                        <p class="admin">${memSvc.getOneMem(compVO.member_no).mb_name}</p>
                        <p class="ps-3 icon text-muted"><span class="fas fa-comment-alt pe-1"></span>1</p>
                    </div>
                </div>
            </div>
        </div>
        </a>
        </c:forEach>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
for (var i = 0; i < images.length; i++) { var image = images[i], width = String(image.currentStyle.width); if (width.indexOf('%') == -1) { continue; } image.origWidth = image.offsetWidth; image.origHeight = image.offsetHeight; imgCache.push(image); c.ieAlpha(image); image.style.width = width; }
</script>
<script>
function loginFirst(){
	Swal.fire('Please Login').then((result)=>{
		window.location.href = "<%=request.getContextPath()%>/front-end/mem/MemLogin.jsp";
	});
}
$(function(){
    var len = 80; 
    $(".cutText").each(function(i){
        if($(this).text().length>len){
            $(this).attr("title",$(this).text());
            var text=$(this).text().substring(0,len-1)+"<a href=" + $(this).attr('href') + ">  ...<a>";
            
            $(this).html(text);
        }
    });
});
</script>
</body>
</html>
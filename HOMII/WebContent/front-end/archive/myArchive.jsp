<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mem.model.*"%>    
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
// MemVO memVO = (MemVO) session.getAttribute("memVO");
MemVO memVO = (MemVO) request.getAttribute("memVO");
%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/front/memberInfo.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/front/creditCard.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

<title>My Archive</title>
<style>
body{
  background-image: url("<%=request.getContextPath()%>/img/memInfo.jpg");
    background-attachment:fixed;
}
/* header */
nav{
	background-color: #4a3b3b;
}
.cd-header-buttons{
	margin-bottom:0rem !important;
	padding:0px 20px;
}

.cd-header-buttons img{
	margin-right:15px;
	border-radius:50%;
}
</style>
</head>
<body>
<jsp:include page="/front_header.jsp"/>
	<div class="main-wrapper">
		<div class="info-div">
			<div class="info-content">
				<div class="tabset">
				<input type="radio" name="tabset" id="tab1"
						aria-controls="basic-info" checked> <label for="tab1">Upload Media</label>
				<input type="radio" name="tabset" id="tab2"
						aria-controls="payment-info" /> <label for="tab2">View Archive</label>
				<div class="tab-panels">
					<section id="basic-info" class="tab-panel">
					<div class="container-fluid">
					
					
					<div class="user-pic">
								<div>
									<i class="fas fa-cloud-upload-alt"></i>
									<p>Choose Media</p>
									<input type="file" name="mb_pic" id="update-mbpic"/>
								</div>
					</div>
					
					</div>
					</section>
					<section id="view archive" class="tab-panel">
					<img src="https://storage.cloud.google.com/homi-media-bucket/20190801_155007.jpg" width="100" height="100">
					<img src="https://storage.cloud.google.com/homi-media-bucket/20190801_155012.jpg" width="100" height="100">
					<img src="https://storage.cloud.google.com/homi-media-bucket/20190801_155028.jpg" width="100" height="100">
					<img src="https://storage.cloud.google.com/homi-media-bucket/20190801_155045.jpg" width="100" height="100">
					<img src="https://storage.cloud.google.com/homi-media-bucket/20190801_160037.jpg" width="100" height="100">
					<img src="https://storage.cloud.google.com/homi-media-bucket/20190801_160141.jpg" width="100" height="100">
					<img src="https://storage.cloud.google.com/homi-media-bucket/20190801_160146.jpg" width="100" height="100">
					<img src="https://storage.cloud.google.com/homi-media-bucket/20190801_160155.jpg" width="100" height="100">
					
					<%
					ArrayList<String> al = new ArrayList<String>();
					al.add("https://storage.cloud.google.com/homi-media-bucket/kitten.png");
					
					%>
					
					<% for(String element: al) { %>

					<% } %>
					
					</section>		
				</div>				
				</div>
				</div>			
			</div>
		</div>
	</div>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7a
bK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity=
"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha
384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/js/creditCard.js"></script>
<script>
$(document).ready(function () {
    $(".show-basic-update").click(function () {
        buttonShow($(this));
        $(".cancel-update1").css("display", "block");
        $(".update-basic-info").css("display", "block");
    });
    $(".show-account-update").click(function () {
        buttonShow($(this));
        $(".password_reset").css("display", "flex");
        $(".cancel-update2").css("display", "block");
        $(".update-account-info").css("display", "block");
    });
    //btn appear and disappear
    function buttonShow(item) {
		item.css("display", "none")
        let form = item.parent().parent("form");
        let divs = form.children("div");
        let inputs = divs.children("input");
        inputs.prop("disabled", false);
        form.find(".cancel-update1").click(function () {
            $(this).css("display", "none");
 			$(this).next().css("display", "none");
		    item.css("display", "block")
            inputs.prop("disabled", true);

        });
        form.find(".cancel-update2").click(function () {
            $(this).css("display", "none");
 			$(this).next().css("display", "none");
		    item.css("display", "block")
            inputs.prop("disabled", true);
            $(".password_reset").css("display", "none");
        });
    }
    
    
    
  //change photo
    $("#update-mbpic").change(function(){
  	  let pic = $(this).parent().siblings("img");
  	  let file = this.files[0];
  	  let formData = new FormData();
  	  formData.append("mb_pic", file);
  	  formData.append("mb_no", "${memVO.member_no}");
  	  $.ajax({
  		  url: "<%=request.getContextPath()%>/MemServlet?action=update_picture",
  	  	  data: formData,
  	  	  type:"POST",
  		  contentType: false,
            processData: false,
  			  success: function(msg){
  				  let reader = new FileReader();
  				  reader.addEventListener("load", (ex)=>{
  					  pic.attr("src", ex.target.result);
  				  });
  				  reader.readAsDataURL(file);
  			  } 
  	  })  
    })
    
});
</script>
</body>

</html>
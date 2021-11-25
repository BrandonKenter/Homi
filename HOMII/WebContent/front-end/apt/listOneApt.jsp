<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.apt.model.*" %>
<% 
	AptVO aptVO = (AptVO) request.getAttribute("aptVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apartment page</title>
</head>
<body>
<jsp:include page="/front_header.jsp"/>
<h3>Show One Apartment page for APT.NO = ${aptVO.ap_no}</h3>
<p>Apartment Name = ${aptVO.ap_name}</p>

</body>
</html>
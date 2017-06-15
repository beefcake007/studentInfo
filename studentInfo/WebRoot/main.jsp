<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	if(session.getAttribute("currentUser")==null){
		response.sendRedirect("login.jsp");
		return;
	}

	String mainPage=(String)request.getAttribute("mainPage");
	if(mainPage==null||mainPage.equals("")){
		mainPage="common/default.jsp";
	}
 %>
	<head>
	    <title>main</title>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/studentInfo.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap3/css/bootstrap.min.css ">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap3/css/bootstrap-theme.css">
		<script src="${pageContext.request.contextPath }/bootstrap3/js/jquery-3.1.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/bootstrap3/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/My97DatePicker/WdatePicker.js"></script>
		<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
		-->
	
	</head>
  
<body>
<div class="container">
	<jsp:include page="common/head.jsp"></jsp:include>
	<jsp:include page="common/menu.jsp"></jsp:include>
	<jsp:include page="common/nav.jsp"></jsp:include>
	<jsp:include page="<%=mainPage %>"></jsp:include>
	<jsp:include page="common/foot.jsp"></jsp:include>
</div>	
</body>
</html>

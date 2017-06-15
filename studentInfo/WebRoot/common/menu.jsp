<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
	function logout(){
		if(confirm("您确定要退出系统吗？")){
			window.location.href="user!logout";
		}
		
	}
</script>
<div class="row">
	<div class="col-md-12">
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="main.jsp">首页</a>
		    <ul class="nav navbar-nav">
		    	<li class="dropdown">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown">学生信息管理 <b class="caret"></b></a>
                       <ul class="dropdown-menu">
                         <li><a href="student!preSave">学生信息添加</a></li>
                         <li><a href="student!list">学生信息维护</a></li>
                       </ul>
                   </li>
		      	<li class="dropdown">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown">班级信息管理 <b class="caret"></b></a>
                       <ul class="dropdown-menu">
                         <li><a href="class!preSave">班级信息添加</a></li>
                         <li><a href="class!list">班级信息维护</a></li>
                       </ul>
                   </li>
                   <li class="dropdown">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown">年级信息管理 <b class="caret"></b></a>
                       <ul class="dropdown-menu">
                         <li><a href="grade!preSave">年级信息添加</a></li>
                         <li><a href="grade!list">年级信息维护</a></li>
                       </ul>
                   </li>
		        <li class="dropdown">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown">系统管理 <b class="caret"></b></a>
                       <ul class="dropdown-menu">
                         <li><a href="dataDic!list">数据字典维护</a></li>
                         <li><a href="dataDicType!list">数据字典类别维护</a></li>
                         <li><a href="user!preSave">修改密码</a></li>
                         <li class="divider"></li>
                         <li><a href="javascript:logout()">退出系统</a></li>
                       </ul>
                   </li>
		    </ul>
		  </div>
		</nav>
	</div>
</div>
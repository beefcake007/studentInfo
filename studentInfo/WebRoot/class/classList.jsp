<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function classDelete(classId){
		if(confirm("确定要删除这条年级信息吗？")){
			$.post("class!delete",{classId:classId},function(result){
				var result =eval('('+result+')');
				if(result.error){
					alert(result.error);
				}else{
					alert("删除成功！");
					window.location.href="${pageContext.request.contextPath}/class!list";
				}
			});
		}
	}
</script>
<div class="data_list" style="margin-top:10px;">
	<div class="search_content"> 
		<button class="btn btn-sm btn-primary" type="button" style="float:right;margin-bottom:5px;" onclick="javascript:window.location='class!preSave'">添加班级</button>
	</div>
	<div class="data_content" style="margin-top:10px;">
		<table class="table table-bordered table-hover">
			<tr>
				<th>序号</th>
				<th>班级名称</th>
				<th>所在年级</th>
				<th>班级备注</th>
				<th>操作</th>
			</tr>
			<c:forEach var="c" items="${classList }" varStatus="status">
				<tr>
					<td>${status.index+1 }</td>
					<td>${c.className }</td>
					<td>${c.gradeName }</td>
					<td>${c.classDesc }</td>
					<td><button type="button" class="btn btn-info btn-sm" onclick="javascript:window.location='class!preSave?classId=${c.classId}'">修改</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-sm" onclick="classDelete(${c.classId})">删除</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<nav aria-label="Page navigation" style="text-align:center;">
		<ul class="pagination pager">
			${pageCode }
		</ul>
	</nav>
</div>
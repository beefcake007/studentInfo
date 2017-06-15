<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function gradeDelete(gradeId){
		if(confirm("确定要删除这条年级信息吗？")){
			$.post("grade!delete",{gradeId:gradeId},function(result){
				var result =eval('('+result+')');
				if(result.error){
					alert(result.error);
				}else{
					alert("删除成功！");
					window.location.href="${pageContext.request.contextPath}/grade!list";
				}
			});
		}
	}
</script>
<div class="data_list" style="margin-top:10px;">
	<div class="search_content"> 
		<button class="btn btn-sm btn-primary" type="button" style="float:right;margin-bottom:5px;" onclick="javascript:window.location='grade!preSave'">添加年级</button>
	</div>
	<div class="data_content" style="margin-top:10px;">
		<table class="table table-bordered table-hover">
			<tr>
				<th>序号</th>
				<th>年级名称</th>
				<th>年级备注</th>
				<th>操作</th>
			</tr>
			<c:forEach var="grade" items="${gradeList }" varStatus="status">
				<tr>
					<td>${status.index+1 }</td>
					<td>${grade.gradeName }</td>
					<td>${grade.gradeDesc }</td>
					<td><button type="button" class="btn btn-info btn-sm" onclick="javascript:window.location='grade!preSave?gradeId=${grade.gradeId}'">修改</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-sm" onclick="gradeDelete(${grade.gradeId})">删除</button></td>
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
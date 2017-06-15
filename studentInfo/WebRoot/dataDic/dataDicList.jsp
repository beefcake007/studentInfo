<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function dataDicDelete(ddId){
		if(confirm("确定要删除这条数据字典吗？")){
			$.post("dataDic!delete",{ddId:ddId},function(result){
				var result =eval('('+result+')');
				if(result.error){
					alert(result.error);
				}else{
					alert("删除成功！");
					window.location.href="${pageContext.request.contextPath}/dataDic!list";
				}
			});
		}
	}
</script>
<div class="data_list" style="margin-top:10px;">
	<div class="search_content"> 
		<form action="${pageContext.request.contextPath }/dataDic!list" method="post" style="text-align:center;">
			数据字典类别名称：<input type="text" id="s_ddTypeName"  name="s_ddTypeName" value="${s_ddTypeName }">
			&nbsp;&nbsp;<button type="submit" class="btn btn-primary">查询</button>
		</form>
		<button class="btn btn-sm btn-primary" type="button" style="float:right;margin-bottom:5px;" onclick="javascript:window.location='dataDic!preSave'">添加数据字典</button>
	</div>
	<div class="data_content" style="margin-top:10px;">
		<table class="table table-bordered table-hover">
			<tr>
				<th>序号</th>
				<th>数据字典类别名称</th>
				<th>数据字典值</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
			<c:forEach var="dataDic" items="${dataDicList }" varStatus="status">
				<tr>
					<td>${status.index+1 }</td>
					<td>${dataDic.ddTypeName }</td>
					<td>${dataDic.ddValue }</td>
					<td>${dataDic.ddDesc }</td>
					<td><button type="button" class="btn btn-info btn-sm" onclick="javascript:window.location='dataDic!preSave?ddId=${dataDic.ddId}'">修改</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-sm" onclick="dataDicDelete(${dataDic.ddId})">删除</button></td>
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
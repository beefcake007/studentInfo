<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function dataDicTypeDelete(ddTypeId){
		if(confirm("确定要删除这条数据字典类别吗？")){
			$.post("dataDicType!delete",{ddTypeId:ddTypeId},function(result){
				var result =eval('('+result+')');
				if(result.error){
					alert(result.error);
				}else{
					alert("删除成功！");
					window.location.href="${pageContext.request.contextPath}/dataDicType!list";
				}
			});
		}
	}
</script>
<div class="data_list" style="margin-top:10px;">
	<div class="data_content">
		<button class="btn btn-sm btn-primary" type="button" style="float:right;margin-bottom:5px;" onclick="javascript:window.location='dataDicType!preSave'">添加数据字典类别</button>
	</div>
	<div class="data_content" style="margin-top:15px;">
		<table class="table table-bordered table-hover">
			<tr>
				<th>序号</th>
				<th>数据字典类别名称</th>
				<th>数据字典类别备注</th>
				<th>操作</th>
			</tr>
			<c:forEach var="dataDicType" items="${dataDicTypeList }" varStatus="status">
				<tr>
					<td>${status.index+1 }</td>
					<td>${dataDicType.ddTypeName }</td>
					<td>${dataDicType.ddTypeDesc }</td>
					<td><button type="button" class="btn btn-info btn-sm" onclick="javascript:window.location='dataDicType!preSave?ddTypeId=${dataDicType.ddTypeId}'">修改</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-sm" onclick="dataDicTypeDelete(${dataDicType.ddTypeId})">删除</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
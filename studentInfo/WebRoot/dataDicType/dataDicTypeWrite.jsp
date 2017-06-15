<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function checkForm(){
		var ddTypeName=$("#ddTypeName").val();
		if(ddTypeName==null||ddTypeName==""){
			$("#error").html("数据字典类别不能为空！");
			return false;
		}
		return true;
	}
</script>
<div class="data_list" style="margin-top:10px;">
	<div class="data_content" style="margin-top:10px;">
		<form action="dataDicType!save" method="post" onsubmit="return checkForm()">
			<table width="40%" align="center" style="border-collapse:separate; border-spacing:5px 15px;">
				<tr>
					<td><label>数据字典类别名称：</label></td>
					<td><input type="text" id="ddTypeName" name="dataDicType.ddTypeName" class="form-control" value="${dataDicType.ddTypeName }"></td>
				</tr>
				<tr>
					<td valign="top"><label>数据字典类别描述：</label></td>
					<td>
						<textarea rows="5" cols="22" id="ddTypeDesc" name="dataDicType.ddTypeDesc" class="form-control">${dataDicType.ddTypeDesc}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="ddTypeId" name="ddTypeId" value="${dataDicType.ddTypeId }"/>
						<input type="submit" class="btn btn-primary" value="保存">
					</td>
					<td>
						<input type="button" class="btn btn-primary" value="返回" onclick="javascript:history.back()">&nbsp;&nbsp;<font id="error" color="red">${error }</font>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
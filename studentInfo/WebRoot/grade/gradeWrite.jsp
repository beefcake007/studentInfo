<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function checkForm(){
		var gradeName=$("#gradeName").val();
		if(gradeName==null||gradeName==""){
			$("#error").html("年级不能为空！");
			return false;
		}
		return true;
	}
</script>
<div class="data_list" style="margin-top:10px;">
	<div class="data_content" style="margin-top:10px;">
		<form action="grade!save" method="post" onsubmit="return checkForm()">
			<table width="40%" align="center" style="border-collapse:separate; border-spacing:5px 15px;">
				<tr>
					<td><label>年级名称：</label></td>
					<td><input type="text" id="gradeName" name="grade.gradeName" class="form-control" value="${grade.gradeName }"></td>
				</tr>
				<tr>
					<td valign="top"><label>年级描述：</label></td>
					<td>
						<textarea rows="5" cols="22" id="gradeDesc" name="grade.gradeDesc" class="form-control">${grade.gradeDesc}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="gradeId" name="gradeId" value="${grade.gradeId }"/>
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
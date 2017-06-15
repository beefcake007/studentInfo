<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function checkForm(){
		var className=$("#className").val();
		var gradeId=$("#gradeId").val();
		if(gradeId==null||gradeId==""){
			$("#error").html("请选择所在年级！");
			return false;
		}
		if(className==null||className==""){
			$("#error").html("班级名称不能为空！");
			return false;
		}
		return true;
	}
</script>
<div class="data_list" style="margin-top:10px;">
	<div class="data_content" style="margin-top:10px;">
		<form action="class!save" method="post" onsubmit="return checkForm()">
			<table width="40%" align="center" style="border-collapse:separate; border-spacing:5px 15px;">
				<tr>
					<td><label>班级名称：</label></td>
					<td><input type="text" id="className" name="c.className" class="form-control" value="${c.className }"></td>
				</tr>
				<tr>
					<td><label>所在年级：</label></td>
					<td>
						<select id="gradeId" name="c.gradeId" class="form-control">
							<option value="">请选择所在年级：</option>
							<c:forEach var="grade" items="${gradeList }">
								<option value="${grade.gradeId }" ${grade.gradeId==c.gradeId?'selected':'' }>${grade.gradeName }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td valign="top"><label>班级描述：</label></td>
					<td>
						<textarea rows="5" cols="22" id="classDesc" name="c.classDesc" class="form-control">${c.classDesc}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="classId" name="classId" value="${c.classId }">
						<input type="submit" class="btn btn-primary" value="保存">
					</td>
					<td>
						<input type="submit" class="btn btn-primary" value="返回" onclick="javascript:history.back()">&nbsp;&nbsp;<font id="error" color="red">${error }</font>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
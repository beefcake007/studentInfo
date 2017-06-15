<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	function checkForm(){
		var stuNo=$("#stuNo").val();
		var stuName=$("#stuName").val();
		var stuSex=$("#stuSex").val();
		var stuBirthday=$("#stuBirthday").val();
		var stuNation=$("#stuNation").val();
		var stuZzmm=$("#stuZzmm").val();
		var stuRxsj=$("#stuRxsj").val();
		var classId=$("#classId").val();
		if(stuNo==null||stuNo==""){
			$("#error").html("学号不能为空！");
			return false;
		}
		if(stuName==null||stuName==""){
			$("#error").html("姓名不能为空！");
			return false;
		}
		if(stuSex==null||stuSex==""){
			$("#error").html("请选择性别！");
			return false;
		}
		if(stuBirthday==null||stuBirthday==""){
			$("#error").html("出生日期不能为空！");
			return false;
		}
		if(stuNation==null||stuNation==""){
			$("#error").html("请选择名族！");
			return false;
		}
		if(stuZzmm==null||stuZzmm==""){
			$("#error").html("请选择政治面貌！");
			return false;
		}
		if(stuRxsj==null||stuRxsj==""){
			$("#error").html("入学时间不能为空！");
			return false;
		}
		if(classId==null||classId==""){
			$("#error").html("请选择班级！");
			return false;
		}
		return true;
	}
</script>
<div class="data_list" style="margin-top:10px;">
	<div class="data_content" style="margin-top:10px;">
		<form action="student!save" method="post" onsubmit="return checkForm()" enctype="multipart/form-data">
			<table width="80%" align="center" style="border-collapse:separate; border-spacing:5px 15px;">
				<tr>
					<td><label>学号：</label></td>
					<td><input type="text" class="form-control" id="stuNo" name="student.stuNo" value="${student.stuNo }"></td>
					<td>&nbsp;&nbsp;</td>
					<td><label>姓名：</label></td>
					<td><input type="text" class="form-control" id="stuName" name="student.stuName" value="${student.stuName }"></td>
				</tr>
				<tr>
					<td><label>性别：</label></td>
					<td>
						<select class="form-control" id="stuSex" name="student.stuSex">
							<option value="">请选择性别...</option>
							<c:forEach var="sexData" items="${sexDataDicList }">
								<option value="${sexData.ddValue }" ${student.stuSex==sexData.ddValue?'selected':'' }>${sexData.ddValue }</option>
							</c:forEach>
						</select>
					</td>
					<td>&nbsp;&nbsp;</td>
					<td><label>出生日期：</label></td>
					<td><input type="text" class="form-control Wdate" id="stuBirthday" name="student.stuBirthday" value="<fmt:formatDate value="${student.stuBirthday }" type="date" pattern="yyyy-MM-dd"/>" onClick="WdatePicker()"></td>
				</tr>
				<tr>
					<td><label>民族：</label></td>
					<td>
						<select class="form-control" id="stuNation" name="student.stuNation">
							<option value="">请选择民族...</option>
							<c:forEach items="${nationDataDicList }" var="nationData">
								<option value="${nationData.ddValue }" ${student.stuNation==nationData.ddValue?'selected':'' }>${nationData.ddValue }</option>
							</c:forEach>
						</select>
					</td>
					<td>&nbsp;&nbsp;</td>
					<td><label>政治面貌：</label></td>
					<td>
						<select id="stuZzmm" name="student.stuZzmm" class="form-control">
							<option value="">请选择政治面貌...</option>
							<c:forEach var="zzmmData" items="${zzmmDataDicList }">
								<option value="${zzmmData.ddValue }" ${student.stuZzmm==zzmmData.ddValue?'selected':'' }>${zzmmData.ddValue }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>入学时间：</label></td>
					<td><input type="text" class="form-control Wdate" value="<fmt:formatDate value="${student.stuRxsj }" type="date" pattern="yyyy-MM-dd"/>" id="stuRxsj" name="student.stuRxsj" onClick="WdatePicker()"></td>
					<td>&nbsp;&nbsp;</td>
					<td><label>班级：</label></td>
					<td>
						<select class="form-control" id="classId" name="student.classId">
							<option value="">请选择班级...</option>
							<c:forEach items="${classList }" var="c">
								<option value="${c.classId }" ${student.classId==c.classId?'selected':'' }>${c.className }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>照片：</label></td>
					<td colspan="4">
						<input type="file" id="stuPic" name="stuPic">
						<input type="hidden" id="stuPic" name="student.stuPic" value="${student.stuPic }">
					</td>
				</tr>
				<tr>
					<td valign="top"><label>备注：</label></td>
					<td colspan="4"><textarea  class="form-control" rows="5" id="stuDesc" name="student.stuDesc">${student.stuDesc }</textarea></td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="studentId" name="studentId" value="${student.studentId }">
						<input type="submit" class="btn btn-primary" value="保存">
					</td>
					<td>
						<input type="submit"  class="btn btn-primary" value="返回" onclick="javascript:history.back()">&nbsp;&nbsp;<font id="error" color="red">${error }</font>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="data_list">
	<div class="data_content">
		<table width="100%" align="center" style="border-collapse:separate; border-spacing:5px 15px;">
			<tr>
				<td><label>学号：</label></td>
				<td><input type="text" class="form-control" id="stuNo" value="${student.stuNo }" readonly="readonly"></td>
				<td>&nbsp;&nbsp;</td>
				<td><label>姓名：</label></td>
				<td><input type="text" class="form-control" id="stuName" value="${student.stuName }" readonly="readonly"></td>
				<td rowspan="5" width="400"><img class="img-responsive" src="${pageContext.request.contextPath }/userImage/${student.stuPic}"></td>
			</tr>
			<tr>
				<td><label>性别：</label></td>
				<td><input type="text" class="form-control" id="stuSex" value="${student.stuSex }" readonly="readonly"></td>
				<td>&nbsp;&nbsp;</td>
				<td><label>出生日期：</label></td>
				<td><input type="text" class="form-control" id="stuBirthday" value="<fmt:formatDate value="${student.stuBirthday }" type="date" pattern="yyyy-MM-dd"/>" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>民族：</label></td>
				<td><input type="text" class="form-control" id="stuNation" value="${student.stuNation }" readonly="readonly"></td>
				<td>&nbsp;&nbsp;</td>
				<td><label>政治面貌：</label></td>
				<td><input type="text" class="form-control" id="stuZzmm" value="${student.stuZzmm }" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>入学时间：</label></td>
				<td><input type="text" class="form-control" id="stuRxsj" value="<fmt:formatDate value="${student.stuRxsj }" type="date" pattern="yyyy-MM-dd"/>" readonly="readonly"></td>
				<td>&nbsp;&nbsp;</td>
				<td><label>班级：</label></td>
				<td><input type="text" class="form-control" id="className" value="${student.className }" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>备注：</label></td>
				<td colspan="4"><textarea  class="form-control" rows="5" id="stuDesc" readonly="readonly">${student.stuDesc }</textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="submit"  class="btn btn-primary" value="返回" onclick="javascript:history.back()">&nbsp;&nbsp;<font id="error" color="red">${error }</font>
				</td>
			</tr>
		</table>
	</div>
</div>
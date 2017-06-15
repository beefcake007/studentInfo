<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	function studentDelete(studentId){
		if(confirm("确定要删除这条学生信息吗？")){
			$.post("student!delete",{studentId:studentId},function(result){
				var result =eval('('+result+')');
				if(result.error){
					alert(result.error);
				}else{
					alert("删除成功！");
					window.location.href="${pageContext.request.contextPath}/student!list";
				}
			});
		}
	}
	
	function loadClassInfo(){
		var s_gradeId=$("#s_gradeId").val();
		$("#s_classId option[value!='-1']").remove();
		if(s_gradeId==-1){
			$("#s_classId").val("-1");
			return;
		}
		$.post("class!getClassByGradeId",{s_gradeId:s_gradeId},
			function(result){
				$("#s_classId").val("-1");
				var result=eval("("+result+")");
				$.each(result,function(i,item){
					$("<option value='"+item.classId+"'>"+item.className+"</option>").appendTo($("#s_classId"));
				});
			}		
		);
	}
	
	function resetValue(){
		$("#s_stuNo").val("");
		$("#s_stuName").val("");
		$("#s_stuSex").val("-1");
		$("#s_stuNation").val("-1");
		$("#s_gradeId").val("-1");
		$("#s_classId").val("-1");
		$("#s_b_stuBirthday").val("");
		$("#s_e_stuBirthday").val("");
		$("#s_b_stuRxsj").val("");
		$("#s_e_stuRxsj").val("");
	}
</script>
<div class="data_list" style="margin-top:10px;">
	<div class="search_content"> 
		<form action="${pageContext.request.contextPath }/student!list" method="post">
			<table align="center" style="border-collapse:separate; border-spacing:5px 15px;">
				<tr>
					<td><label>学号：</label></td>
					<td><input type="text" id="s_stuNo" class="form-control" name="s_student.stuNo" value="${s_student.stuNo }"></td>
					<td width="30px">&nbsp;</td>
					<td><label>姓名：</label></td>
					<td><input type="text" id="s_stuName" class="form-control" name="s_student.stuName" value="${s_student.stuName }"></td>
				</tr>
				<tr>
					<td><label>性别：</label></td>
					<td>
						<select id="s_stuSex" class="form-control" name="s_student.stuSex">
							<option value="-1">请选择性别...</option>
							<c:forEach var="sexData" items="${s_sexDataDicList }">
								<option value="${sexData.ddValue }" ${s_student.stuSex==sexData.ddValue?'selected':'' }>${sexData.ddValue }</option>
							</c:forEach>
						</select>
					</td>
					<td>&nbsp;</td>
					<td><label>民族：</label></td>
					<td>
						<select id="s_stuNation" class="form-control" name="s_student.stuNation">
							<option value="-1">请选择民族...</option>
							<c:forEach var="nationData" items="${s_nationDataDicList }">
								<option value="${nationData.ddValue }" ${s_student.stuNation==nationData.ddValue?'selected':'' }>${nationData.ddValue }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>所在年级：</label></td>
					<td>
						<select id="s_gradeId" class="form-control" name="s_student.gradeId" onchange="loadClassInfo()">
							<option value="-1">请选择年级...</option>
							<c:forEach var="grade" items="${s_gradeList }">
								<option value="${grade.gradeId }" ${s_student.gradeId==grade.gradeId?'selected':'' }>${grade.gradeName }</option>
							</c:forEach>
						</select>
					</td>
					<td>&nbsp;</td>
					<td><label>所在班级：</label></td>
					<td>
						<select id="s_classId" class="form-control" name="s_student.classId">
							<option value="-1">请选择班级...</option>
							<c:forEach var="c" items="${s_classList }">
								<option value="${c.classId }" ${s_student.classId==c.classId?'selected':'' }>${c.className }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr class="form-inline">
					<td><label>出生日期：</label></td>
					<td colspan="4">
						<input type="text" id="s_b_stuBirthday" class="form-control Wdate" onClick="WdatePicker()" name="s_studnet.s_b_stuBirthday" value="${s_student.s_b_stuBirthday }">&nbsp;&nbsp;到
						<input type="text" id="s_e_stuBirthday" class="form-control Wdate" onClick="WdatePicker()" name="s_studnet.s_e_stuBirthday" value="${s_student.s_e_stuBirthday }">
					</td>
				</tr>
				<tr class="form-inline">
					<td><label>入学时间：</label></td>
					<td colspan="4">
						<input type="text" id="s_b_stuRxsj" class="form-control Wdate" onClick="WdatePicker()" name="s_studnet.s_b_stuRxsj" value="${s_student.s_b_stuRxsj }">&nbsp;&nbsp;到
						<input type="text" id="s_e_stuRxsj" class="form-control Wdate" onClick="WdatePicker()" name="s_studnet.s_e_stuRxsj" value="${s_student.s_e_stuRxsj }">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-primary" type="submit">查询</button>
					</td>
					<td>&nbsp;</td>
					<td colspan="2">
						<button class="btn btn-primary" type="button" onclick="resetValue()">重置</button>
					</td>
				</tr>
			</table>
		</form>
		<button class="btn btn-sm btn-primary" type="button" style="float:right;margin-bottom:5px;" onclick="javascript:window.location='student!preSave'">添加学生</button>
	</div>
	<div class="data_content" style="margin-top:10px;">
		<table class="table table-bordered table-hover">
			<tr>
				<th>序号</th>
				<th>学号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>出生日期</th>
				<th>入学时间</th>
				<th>所在班级</th>
				<th>所在年级</th>
				<th>相关操作</th>
			</tr>
			<c:forEach var="student" items="${studentList }" varStatus="status">
				<tr>
					<td>${status.index+1 }</td>
					<td>${student.stuNo }</td>
					<td>${student.stuName }</td>
					<td>${student.stuSex }</td>
					<td><fmt:formatDate value="${student.stuBirthday }" type="date" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${student.stuRxsj }" type="date" pattern="yyyy-MM-dd"/></td>
					<td>${student.className }</td>
					<td>${student.gradeName }</td>
					<td><button type="button" class="btn btn-info btn-sm" onclick="javascript:window.location='student!show?studentId=${student.studentId}'">查看详细信息</button>&nbsp;&nbsp;<button type="button" class="btn btn-info btn-sm" onclick="javascript:window.location='student!preSave?studentId=${student.studentId}'">修改</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-sm" onclick="studentDelete('${student.studentId}')">删除</button></td>
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
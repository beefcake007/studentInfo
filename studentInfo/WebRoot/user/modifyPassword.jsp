<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function submitForm(){
		var userId='${currentUser.userId}';
		var password='${currentUser.password}';
		var oldPassword=$("#oldPassword").val();
		var newPassword=$("#newPassword").val();
		var newPassword2=$("#newPassword2").val();
		if(oldPassword==null||oldPassword==""){
			alert("原密码不能为空！");
			return false;
		}
		if(newPassword==null||newPassword==""){
			alert("新密码不能为空！");
			return false;
		}
		if(newPassword2==null||newPassword2==""){
			alert("确认密码不能为空！");
			return false;
		}
		if(password!=oldPassword){
			alert("原密码错误！");
			return false;
		}
		if(newPassword!=newPassword2){
			alert("确认新密码不一致！");
			return false;
		}
		$.post("user!save",{userId:userId,password:newPassword},function(result){
			var result=eval('('+result+')');
			if(result.errorMsg){
				alert(result.errorMsg);
			}else{
				alert("密码修改成功，下次登陆生效！");
				resetValue();
			}		
		});
	}
	
	function resetValue(){
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}
</script>
<div class="data_list" style="margin-top:10px;">
	<div class="data_content" style="margin-top:10px;">
		<table align="center" style="border-collapse:separate; border-spacing:5px 15px;">
			<tr>
				<td><label>用户名：</label></td>
				<td>
					<input type="text" id="userName" class="form-control" value="${currentUser.userName }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td><label>原密码：</label></td>
				<td><input type="password" id="oldPassword" class="form-control" ></td>
			</tr>
			<tr>
				<td><label>新密码：</label></td>
				<td>
					<input type="password" id="newPassword" class="form-control" >
				</td>
			</tr>
			<tr>
				<td><label>确认新密码：</label></td>
				<td>
					<input type="password" id="newPassword2" class="form-control" >
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn btn-primary" value="提交" onclick="submitForm()">
				</td>
				<td>
					<input type="button" class="btn btn-primary" value="重置" onclick="resetValue()">
				</td>
			</tr>
		</table>
	</div>
</div>
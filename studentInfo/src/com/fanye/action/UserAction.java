package com.fanye.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.fanye.dao.UserDao;
import com.fanye.model.User;
import com.fanye.util.DbUtil;
import com.fanye.util.NavUtil;
import com.fanye.util.ResponseUtil;
import com.fanye.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements ServletRequestAware{

	private HttpServletRequest request;
	
	private User user;
	private String error;
	private String imageCode;
	private int userId;
	private String password;
	private String navCode;
	private String mainPage;
	
	
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNavCode() {
		return navCode;
	}

	public void setNavCode(String navCode) {
		this.navCode = navCode;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	private DbUtil dbUtil=new DbUtil();
	private UserDao userDao=new UserDao();
	
	public String login(){
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(user.getUserName())||StringUtil.isEmpty(user.getPassword())){
			error="�û���������Ϊ�գ�";
			return ERROR;
		}
		if(StringUtil.isEmpty(imageCode)){
			error="��֤��Ϊ�գ�";
			return ERROR;
		}
		if(!imageCode.equals(session.getAttribute("sRand"))){
			error="��֤�����";
			return ERROR;
		}
		Connection con=null;
		
		try{
			con=dbUtil.getCon();
			User currentUser=userDao.login(con, user);
			if(currentUser==null){
				error="�û������������";
				return ERROR;
			}else{
				session.setAttribute("currentUser", currentUser);
				return SUCCESS;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}
	
	
	public String preSave(){
		navCode=NavUtil.getNavgation("ϵͳ����", "�޸�����");
		mainPage="user/modifyPassword.jsp";
		return SUCCESS;
	}
	
	
	public String save(){
		User user=new User();
		user.setPassword(password);
		user.setUserId(userId);
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int updateNums=userDao.modifyPassWord(con, user);
			JSONObject resultJson=new JSONObject();
			if(updateNums>0){
				resultJson.put("success", true);
			}else{
				resultJson.put("errorMsg", "�����޸�ʧ�ܣ�");
			}
			ResponseUtil.write(ServletActionContext.getResponse(), resultJson);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	public String logout(){
		HttpSession session=request.getSession();
		session.removeAttribute("currentUser");
		return "logout";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

}

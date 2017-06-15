package com.fanye.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.fanye.model.User;

public class UserDao {
	
	public User login(Connection con , User user)throws Exception{
		User resultUser=null;
		String sql="select * from t_user where userName=? and password=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getPassword());
		ResultSet re=pstmt.executeQuery();
		if(re.next()){
			resultUser =new User();
			resultUser.setUserId(re.getInt("userId"));
			resultUser.setUserName(re.getString("userName"));
			resultUser.setPassword(re.getString("password"));
		}
		return resultUser;
	}
	
	public int modifyPassWord(Connection con,User user)throws Exception{
		String sql="update t_user set password=? where userId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, user.getPassword());
		pstmt.setInt(2, user.getUserId());
		return pstmt.executeUpdate();
	}
}

package com.fanye.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fanye.model.Class;
import com.fanye.util.StringUtil;

public class ClassDao {

	public boolean existClass(Connection con,String gradeId)throws Exception{
		String sql="select * from t_class where gradeId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, gradeId);
		ResultSet re=pstmt.executeQuery();
		if(re.next()){
			return true;
		}else{
			return false;
		}
	}
	
	public List<Class> classList(Connection con,Class s_class)throws Exception{
		List<Class> classList=new ArrayList<Class>();
		StringBuffer sb=new StringBuffer("select * from t_class t1,t_grade t2 where t1.gradeId=t2.gradeId");
		if(s_class!=null &&s_class.getGradeId()!=-1){
			sb.append(" and t1.gradeId="+s_class.getGradeId());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet re=pstmt.executeQuery();
		while(re.next()){
			Class c=new Class();
			c.setClassId(re.getInt("classId"));
			c.setClassName(re.getString("className"));
			c.setGradeId(re.getInt("gradeId"));
			c.setGradeName(re.getString("gradeName"));
			c.setClassDesc(re.getString("classDesc"));
			classList.add(c);
		}
		return classList;
	}
	
	public int classDelete(Connection con,String classId)throws Exception {
		String sql="delete from t_class where classId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, classId);
		return pstmt.executeUpdate();
	}
	
	public int classAdd(Connection con,Class c)throws Exception{
		String sql="insert into t_class values(null,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, c.getClassName());
		pstmt.setInt(2, c.getGradeId());
		pstmt.setString(3, c.getClassDesc());
		return pstmt.executeUpdate();
	}
	
	public int classUpdate(Connection con,Class c)throws Exception{
		String sql="update t_class set className=?, gradeId=?, classDesc=? where classId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, c.getClassName());
		pstmt.setInt(2, c.getGradeId());
		pstmt.setString(3, c.getClassDesc());
		pstmt.setInt(4, c.getClassId());
		return pstmt.executeUpdate();
	}
	
	
	public Class getClassById(Connection con,String classId)throws Exception{
		String sql="select * from t_class t1,t_grade t2 where t1.gradeId=t2.gradeId and t1.classId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, classId);
		ResultSet re=pstmt.executeQuery();
		Class c=new Class();
		if(re.next()){
			c.setClassId(re.getInt("classId"));
			c.setClassName(re.getString("className"));
			c.setGradeId(re.getInt("gradeId"));
			c.setGradeName(re.getString("gradeName"));
			c.setClassDesc(re.getString("classDesc"));
		}
		return c;
	}
	
}

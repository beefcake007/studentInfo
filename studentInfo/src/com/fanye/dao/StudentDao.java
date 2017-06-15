package com.fanye.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fanye.model.PageBean;
import com.fanye.model.Student;
import com.fanye.util.DateUtil;
import com.fanye.util.StringUtil;
import com.fanye.util.UUIDUtil;

public class StudentDao {

	public List<Student> studentList(Connection con,Student s_student,PageBean pageBean)throws Exception{
		List<Student> studentList=new ArrayList<Student>();
		StringBuffer sb=new StringBuffer("select * from t_student t1,t_class t2,t_grade t3 where t1.classId=t2.classId and t2.gradeId=t3.gradeId");
		if(StringUtil.isNotEmpty(s_student.getStuNo())){
			sb.append(" and t1.stuNo like '%"+s_student.getStuNo()+"%'");
		}
		if(StringUtil.isNotEmpty(s_student.getStuName())){
			sb.append(" and t1.stuName like '%"+s_student.getStuName()+"%'");
		}
		if(!"-1".equals(s_student.getStuSex())){
			sb.append(" and t1.stuSex='"+s_student.getStuSex()+"'");
		}
		if(!"-1".equals(s_student.getStuNation())){
			sb.append(" and t1.stuNation='"+s_student.getStuNation()+"'");
		}
		if(s_student.getGradeId()!=-1){
			sb.append(" and t3.gradeId="+s_student.getGradeId());
		}
		if(s_student.getClassId()!=-1){
			sb.append(" and t2.classId="+s_student.getClassId());
		}
		if(StringUtil.isNotEmpty(s_student.getS_b_stuBirthday())){
			sb.append(" and TO_DAYS(t1.stuBirthday)>=TO_DAYS('"+s_student.getS_b_stuBirthday()+"')");
		}
		if(StringUtil.isNotEmpty(s_student.getS_e_stuBirthday())){
			sb.append(" and TO_DAYS(t1.stuBirthday)<=TO_DAYS('"+s_student.getS_e_stuBirthday()+"')");
		}
		if(StringUtil.isNotEmpty(s_student.getS_b_stuRxsj())){
			sb.append(" and TO_DAYS(t1.stuRxsj)>=TO_DAYS('"+s_student.getS_b_stuRxsj()+"')");
		}
		if(StringUtil.isNotEmpty(s_student.getS_e_stuRxsj())){
			sb.append(" and TO_DAYS(t1.stuRxsj)<=TO_DAYS('"+s_student.getS_e_stuRxsj()+"')");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getPageSize());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet re=pstmt.executeQuery();
		while(re.next()){
			Student student=new Student();
			student.setStudentId(re.getString("studentId"));
			student.setStuNo(re.getString("stuNo"));
			student.setStuName(re.getString("stuName"));
			student.setStuSex(re.getString("stuSex"));
			student.setStuBirthday(DateUtil.formatString(re.getString("stuBirthday"), "yyyy-MM-dd"));
			student.setStuRxsj(DateUtil.formatString(re.getString("stuRxsj"), "yyyy-MM-dd"));
			student.setStuNation(re.getString("stuNation"));
			student.setStuZzmm(re.getString("stuZzmm"));
			student.setClassId(re.getInt("classId"));
			student.setClassName(re.getString("className"));
			student.setStuDesc(re.getString("stuDesc"));
			student.setStuPic(re.getString("stuPic"));
			student.setGradeId(re.getInt("gradeId"));
			student.setGradeName(re.getString("gradeName"));
			studentList.add(student);
		}
		return studentList;
	}
	
	public int studentCount(Connection con,Student s_student)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_student t1,t_class t2,t_grade t3 where t1.classId=t2.classId and t2.gradeId=t3.gradeId");
		if(StringUtil.isNotEmpty(s_student.getStuNo())){
			sb.append(" and t1.stuNo like '%"+s_student.getStuNo()+"%'");
		}
		if(StringUtil.isNotEmpty(s_student.getStuName())){
			sb.append(" and t1.stuName like '%"+s_student.getStuName()+"%'");
		}
		if(!"-1".equals(s_student.getStuSex())){
			sb.append(" and t1.stuSex='"+s_student.getStuSex()+"'");
		}
		if(!"-1".equals(s_student.getStuNation())){
			sb.append(" and t1.stuNation='"+s_student.getStuNation()+"'");
		}
		if(s_student.getGradeId()!=-1){
			sb.append(" and t3.gradeId="+s_student.getGradeId());
		}
		if(s_student.getClassId()!=-1){
			sb.append(" and t2.classId="+s_student.getClassId());
		}
		if(StringUtil.isNotEmpty(s_student.getS_b_stuBirthday())){
			sb.append(" and TO_DAYS(t1.stuBirthday)>=TO_DAYS('"+s_student.getS_b_stuBirthday()+"')");
		}
		if(StringUtil.isNotEmpty(s_student.getS_e_stuBirthday())){
			sb.append(" and TO_DAYS(t1.stuBirthday)<=TO_DAYS('"+s_student.getS_e_stuBirthday()+"')");
		}
		if(StringUtil.isNotEmpty(s_student.getS_b_stuRxsj())){
			sb.append(" and TO_DAYS(t1.stuRxsj)>=TO_DAYS('"+s_student.getS_b_stuRxsj()+"')");
		}
		if(StringUtil.isNotEmpty(s_student.getS_e_stuRxsj())){
			sb.append(" and TO_DAYS(t1.stuRxsj)<=TO_DAYS('"+s_student.getS_e_stuRxsj()+"')");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet re=pstmt.executeQuery();
		if(re.next()){
			return re.getInt("total");
		}else{
			return 0;
		}
	}
	
	public boolean existStudentByClassId(Connection con,String classId)throws Exception{
		String sql="select * from t_student where classId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, classId);
		ResultSet re=pstmt.executeQuery();
		if(re.next()){
			return true;
		}else{
			return false;
		}
	}
	
	public Student getStudentById(Connection con,String studentId)throws Exception{
		String sql="select * from t_student t1,t_class t2,t_grade t3 where t1.classId=t2.classId and t2.gradeId=t3.gradeId and studentId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, studentId);
		ResultSet re=pstmt.executeQuery();
		Student student=null;
		while(re.next()){
			student=new Student();
			student.setStudentId(re.getString("studentId"));
			student.setStuNo(re.getString("stuNo"));
			student.setStuName(re.getString("stuName"));
			student.setStuSex(re.getString("stuSex"));
			student.setStuBirthday(DateUtil.formatString(re.getString("stuBirthday"), "yyyy-MM-dd"));
			student.setStuRxsj(DateUtil.formatString(re.getString("stuRxsj"), "yyyy-MM-dd"));
			student.setStuNation(re.getString("stuNation"));
			student.setStuZzmm(re.getString("stuZzmm"));
			student.setClassId(re.getInt("classId"));
			student.setClassName(re.getString("className"));
			student.setStuDesc(re.getString("stuDesc"));
			student.setStuPic(re.getString("stuPic"));
			student.setGradeId(re.getInt("gradeId"));
			student.setGradeName(re.getString("gradeName"));
		}
		return student;
	}
	
	public int studentAdd(Connection con,Student student)throws Exception{
		String sql="insert into t_student values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, UUIDUtil.getUUID());
		pstmt.setString(2, student.getStuNo());
		pstmt.setString(3, student.getStuName());
		pstmt.setString(4, student.getStuSex());
		pstmt.setString(5, DateUtil.formatDate(student.getStuBirthday(), "yyyy-MM-dd"));
		pstmt.setString(6, DateUtil.formatDate(student.getStuRxsj(), "yyyy-MM-dd"));
		pstmt.setString(7, student.getStuNation());
		pstmt.setString(8, student.getStuZzmm());
		pstmt.setInt(9, student.getClassId());
		pstmt.setString(10, student.getStuDesc());
		pstmt.setString(11, student.getStuPic());
		return pstmt.executeUpdate();
	}
	
	public int studentUpdate(Connection con,Student student)throws Exception{
		String sql="update t_student set stuNo=?,stuName=?,stuSex=?,stuBirthday=?,stuRxsj=?,stuNation=?,stuZzmm=?,classId=?,stuDesc=?,stuPic=? where studentId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, student.getStuNo());
		pstmt.setString(2, student.getStuName());
		pstmt.setString(3, student.getStuSex());
		pstmt.setString(4, DateUtil.formatDate(student.getStuBirthday(), "yyyy-MM-dd"));
		pstmt.setString(5, DateUtil.formatDate(student.getStuRxsj(), "yyyy-MM-dd"));
		pstmt.setString(6, student.getStuNation());
		pstmt.setString(7, student.getStuZzmm());
		pstmt.setInt(8, student.getClassId());
		pstmt.setString(9, student.getStuDesc());
		pstmt.setString(10, student.getStuPic());
		pstmt.setString(11, student.getStudentId());
		return pstmt.executeUpdate();
	}
	
	
	public int studentDelete(Connection con,String studentId)throws Exception{
		String sql="delete from t_student where studentId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, studentId);
		return pstmt.executeUpdate();
	}
}

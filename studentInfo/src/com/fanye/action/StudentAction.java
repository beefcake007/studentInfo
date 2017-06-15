package com.fanye.action;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.fanye.dao.ClassDao;
import com.fanye.dao.DataDicDao;
import com.fanye.dao.GradeDao;
import com.fanye.dao.StudentDao;
import com.fanye.model.Class;
import com.fanye.model.DataDic;
import com.fanye.model.Grade;
import com.fanye.model.PageBean;
import com.fanye.model.Student;
import com.fanye.util.DateUtil;
import com.fanye.util.DbUtil;
import com.fanye.util.NavUtil;
import com.fanye.util.PageUtil;
import com.fanye.util.PropertiesUtil;
import com.fanye.util.ResponseUtil;
import com.fanye.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class StudentAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;
	private DbUtil dbUtil=new DbUtil();
	private StudentDao studentDao=new StudentDao();
	private DataDicDao dataDicDao=new DataDicDao();
	private ClassDao classDao=new ClassDao();
	private GradeDao gradeDao=new GradeDao();
	private List<Student> studentList=new ArrayList<Student>();
	private String mainPage;
	private String navCode;
	private List<DataDic> s_sexDataDicList;
	private List<DataDic> s_nationDataDicList;
	private List<DataDic> sexDataDicList;
	private List<DataDic> nationDataDicList;
	private List<DataDic> zzmmDataDicList;
	private List<Class> classList;
	private List<Grade> s_gradeList;
	private List<Class> s_classList;
	private Student s_student;
	private String page;
	private int total;
	private String pageCode;
	private Student student;
	private String studentId;
	private File stuPic;
	private String stuPicFileName;
	
	
	
	public File getStuPic() {
		return stuPic;
	}
	public void setStuPic(File stuPic) {
		this.stuPic = stuPic;
	}
	public String getStuPicFileName() {
		return stuPicFileName;
	}
	public void setStuPicFileName(String stuPicFileName) {
		this.stuPicFileName = stuPicFileName;
	}
	public List<DataDic> getZzmmDataDicList() {
		return zzmmDataDicList;
	}
	public void setZzmmDataDicList(List<DataDic> zzmmDataDicList) {
		this.zzmmDataDicList = zzmmDataDicList;
	}
	public List<DataDic> getSexDataDicList() {
		return sexDataDicList;
	}
	public void setSexDataDicList(List<DataDic> sexDataDicList) {
		this.sexDataDicList = sexDataDicList;
	}
	public List<DataDic> getNationDataDicList() {
		return nationDataDicList;
	}
	public void setNationDataDicList(List<DataDic> nationDataDicList) {
		this.nationDataDicList = nationDataDicList;
	}
	public List<Class> getClassList() {
		return classList;
	}
	public void setClassList(List<Class> classList) {
		this.classList = classList;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getPageCode() {
		return pageCode;
	}
	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}
	public Student getS_student() {
		return s_student;
	}
	public void setS_student(Student s_student) {
		this.s_student = s_student;
	}
	public List<DataDic> getS_sexDataDicList() {
		return s_sexDataDicList;
	}
	public void setS_sexDataDicList(List<DataDic> s_sexDataDicList) {
		this.s_sexDataDicList = s_sexDataDicList;
	}
	public List<DataDic> getS_nationDataDicList() {
		return s_nationDataDicList;
	}
	public void setS_nationDataDicList(List<DataDic> s_nationDataDicList) {
		this.s_nationDataDicList = s_nationDataDicList;
	}
	public List<Grade> getS_gradeList() {
		return s_gradeList;
	}
	public void setS_gradeList(List<Grade> s_gradeList) {
		this.s_gradeList = s_gradeList;
	}
	public List<Class> getS_classList() {
		return s_classList;
	}
	public void setS_classList(List<Class> s_classList) {
		this.s_classList = s_classList;
	}
	public List<Student> getStudentList() {
		return studentList;
	}
	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}
	public String getMainPage() {
		return mainPage;
	}
	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}
	public String getNavCode() {
		return navCode;
	}
	public void setNavCode(String navCode) {
		this.navCode = navCode;
	}
	
	public String list(){
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		if(s_student!=null){
			session.setAttribute("s_student", s_student);
		}else{
			Object o=session.getAttribute("s_student");
			if(o!=null){
				s_student=(Student)o;
			}else{
				s_student=new Student();
			}
		}
		Connection con=null;
		try{
			con=dbUtil.getCon();
			PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(PropertiesUtil.getValue("pageSize")));
			studentList=studentDao.studentList(con,s_student,pageBean);
			navCode=NavUtil.getNavgation("ѧ����Ϣ����", "ѧ��ά��");
			total=studentDao.studentCount(con, s_student);
			pageCode=PageUtil.genPagation(request.getContextPath()+"/student!list", total, Integer.parseInt(page), Integer.parseInt(PropertiesUtil.getValue("pageSize")));
			DataDic s_dataDic=new DataDic();
			s_dataDic.setDdTypeName("�Ա�");
			s_sexDataDicList=dataDicDao.dataDicList(con, s_dataDic, null);
			s_dataDic.setDdTypeName("����");
			s_nationDataDicList=dataDicDao.dataDicList(con, s_dataDic, null);
			
			s_gradeList=gradeDao.gradeList(con);
			if(s_student!=null && s_student.getGradeId()!=-1){
				Class s_class=new Class();
				s_class.setGradeId(s_student.getGradeId());
				s_classList=classDao.classList(con,s_class);
			}
			mainPage="student/studentList.jsp";
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
	
	public String show(){
		Connection con=null;
		try{
			con=dbUtil.getCon();
			student=studentDao.getStudentById(con, studentId);
			navCode=NavUtil.getNavgation("ѧ����Ϣ����", "ѧ��������Ϣ");
			mainPage="student/studentShow.jsp";
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
		Connection con=null;
		try{
			con=dbUtil.getCon();
			if(StringUtil.isNotEmpty(studentId)){
				student=studentDao.getStudentById(con, studentId);
			}
			DataDic s_dataDic=new DataDic();
			s_dataDic.setDdTypeName("�Ա�");
			sexDataDicList=dataDicDao.dataDicList(con, s_dataDic, null);
			
			s_dataDic.setDdTypeName("����");
			nationDataDicList=dataDicDao.dataDicList(con, s_dataDic, null);
			
			s_dataDic.setDdTypeName("������ò");
			zzmmDataDicList=dataDicDao.dataDicList(con, s_dataDic, null);
			
			classList=classDao.classList(con, null);
			if(StringUtil.isNotEmpty(studentId)){
				navCode=NavUtil.getNavgation("ѧ����Ϣ����", "ѧ���޸�");
			}else{
				navCode=NavUtil.getNavgation("ѧ����Ϣ����", "ѧ�����");
			}
			mainPage="student/studentWrite.jsp";
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
	
	
	public String save(){
		Connection con=null;
		try{
			con=dbUtil.getCon();
			if(stuPic!=null){
				String imageName=DateUtil.getCurrentDateStr();
				String realPath=ServletActionContext.getServletContext().getRealPath("/userImage");
				String imageFile=imageName+"."+stuPicFileName.split("\\.")[1];
				File saveFile=new File(realPath,imageFile);
				FileUtils.copyFile(stuPic, saveFile);
				student.setStuPic(imageFile);
			}else if(StringUtil.isEmpty(student.getStuPic())){
				student.setStuPic("");
			}
			
			if(StringUtil.isNotEmpty(studentId)){
				student.setStudentId(studentId);
				studentDao.studentUpdate(con, student);
			}else{
				studentDao.studentAdd(con, student);
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
		return "save";
	}
	
	
	public String delete(){
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject resultJson=new JSONObject();
			studentDao.studentDelete(con, studentId);
			resultJson.put("success", true);
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
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
	
	
}

package com.fanye.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fanye.model.DataDic;
import com.fanye.model.PageBean;
import com.fanye.util.StringUtil;

public class DataDicDao {

	public boolean existDataDicByTypeId(Connection con,String ddTypeId)throws Exception{
		String sql="select * from t_datadic where ddTypeId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, ddTypeId);
		ResultSet re=pstmt.executeQuery();
		if(re.next()){
			return true;
		}else{
			return false;
		}
	}
	
	public List<DataDic> dataDicList(Connection con,DataDic s_dataDic,PageBean pageBean)throws Exception{
		List<DataDic> dataDicList=new ArrayList<DataDic>();
		StringBuffer sb=new StringBuffer("select * from t_datadic t1,t_datadictype t2 where t1.ddTypeId=t2.ddTypeId");
		if(StringUtil.isNotEmpty(s_dataDic.getDdTypeName())){
			sb.append(" and t2.ddTypeName like '%"+s_dataDic.getDdTypeName()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getPageSize());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet re=pstmt.executeQuery();
		while(re.next()){
			DataDic dataDic=new DataDic();
			dataDic.setDdId(re.getInt("ddId"));
			dataDic.setDdTypeId(re.getInt("ddTypeId"));
			dataDic.setDdTypeName(re.getString("ddTypeName"));
			dataDic.setDdValue(re.getString("ddValue"));
			dataDic.setDdDesc(re.getString("ddDesc"));
			dataDicList.add(dataDic);
		}
		return dataDicList;
	}
	
	public int dataDicCount(Connection con,DataDic s_dataDic)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_datadic t1,t_datadictype t2 where t1.ddTypeId=t2.ddTypeId");
		if(StringUtil.isNotEmpty(s_dataDic.getDdTypeName())){
			sb.append(" and t2.ddTypeName like '%"+s_dataDic.getDdTypeName()+"%'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet re=pstmt.executeQuery();
		if(re.next()){
			return re.getInt("total");
		}else{
			return 0;
		}
	}
	
	public int dataDicDelete(Connection con,String Id)throws Exception{
		String sql="delete from t_datadic where ddId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, Id);
		return pstmt.executeUpdate();
	}
	
	public int dataDicAdd(Connection con,DataDic dataDic)throws Exception{
		String sql="insert into t_datadic values(null,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, dataDic.getDdTypeId());
		pstmt.setString(2, dataDic.getDdValue());
		pstmt.setString(3, dataDic.getDdDesc());
		return pstmt.executeUpdate();
	}
	
	public int dataDicUpdata(Connection con,DataDic dataDic)throws Exception{
		String sql="updata t_datadic set ddTypeId=?, ddValue=?, ddDesc=? where ddId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, dataDic.getDdTypeId());
		pstmt.setString(2, dataDic.getDdValue());
		pstmt.setString(3, dataDic.getDdDesc());
		pstmt.setInt(4, dataDic.getDdId());
		return pstmt.executeUpdate();
	}
	
	public DataDic getDataDicById(Connection con,String ddId)throws Exception{
		String sql="select * from t_datadic t1, t_datadictype t2 where t1.ddTypeId=t2.ddTypeId and t1.ddId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, ddId);
		ResultSet re=pstmt.executeQuery();
		DataDic dataDic=new DataDic();
		if(re.next()){
			dataDic.setDdId(re.getInt("ddId"));
			dataDic.setDdTypeId(re.getInt("ddTypeId"));
			dataDic.setDdTypeName(re.getString("ddTypeName"));
			dataDic.setDdValue(re.getString("ddValue"));
			dataDic.setDdDesc(re.getString("ddDesc"));
		}
		return dataDic;
	}
}

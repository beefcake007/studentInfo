package com.fanye.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static String formatDate(Date date,String format){
		String result="";
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		if(date!=null){
			result=sdf.format(date);
		}
		return result;
	}
	
	
	public static Date formatString(String str,String format) throws Exception{
		if(StringUtil.isEmpty(str)){
			return null;
		}
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		return sdf.parse(str);
	}
	
	
	public static java.sql.Timestamp convertToSqlDate(String s){ 
        SimpleDateFormat sp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
        java.sql.Timestamp st=null;
        java.util.Date du;
		try {
			du = sp.parse(s);
			st = new java.sql.Timestamp(du.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}  
		return st;
	}
	
	public static String getCurrentDateStr()throws Exception{
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		return sdf.format(date);
	}
}

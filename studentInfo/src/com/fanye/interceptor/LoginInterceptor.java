package com.fanye.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginInterceptor implements Interceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void destroy() {
		
	}

	@Override
	public void init() {
		
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext actionContext=invocation.getInvocationContext();
		Map<String,Object> session= actionContext.getSession();
		Object currentUser=session.get("currentUser");
		String result=null;
		if(currentUser!=null){
			result=invocation.invoke();
		}else{
			result="login";
		}
		return result;
	}

}

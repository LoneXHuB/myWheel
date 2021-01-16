package com.LoneX.myWheel.config; 

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.LoneX.myWheel.User.MyUserService;

	public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
	  @Autowired
	  MyUserService userService;
	    @Override
	    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
	    	throws IOException, ServletException {
	    	
	    	String username=request.getParameter("username");
	    	System.out.println("username attempting : "+ username);
	    	String msg=exception.getMessage();
	    	System.out.println(exception.getMessage());
	    	
	    
	    
	        // write your custom code here
	        response.sendRedirect("/login?error="+msg);
	    }
	}
	
	


package com.jdc.balance.security.filter;

import java.io.IOException;

import com.jdc.balance.model.domain.Employee.Role;
import com.jdc.balance.security.LoginUser;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
@WebFilter(filterName = "managerFilter")
public class ManagerFilter extends SecurityFilter{

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
			LoginUser loginUser = loginInfo(req);
			
			if(Role.Manager.match(loginUser.getRole())) {
				chain.doFilter(req, resp);
			}else {
				loginUser.logout();
				navigateToLogin(req, resp, "You have no authority to use Manager Function.");
			}
			
	}

}

<%@page import="com.jdc.balance.model.domain.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page extends="com.jdc.balance.BaseView" %>

	<form class="form-inline">
		
		<div class="form-group">
			<label>Role</label>
			<select name="role">
				<option value="">All</option>
				<option <%= getSelectedOption(request, "role", "Employee") %> value="Employee">Employee</option>
				<option <%= getSelectedOption(request, "role", "Manager") %> value="Manager">Manager</option>
			</select>
		</div>
		
		<div class="form-group">
			<label>Name</label>
			<input value="<%= null == request.getParameter("name") ? "" : request.getParameter("name") %>" type="text" name="name" placeholder="Search Name"/>
		</div>
		
		
		<div class="form-group">
			<button type="submit" class="btn btn-e mr-4 icon-btn">
			 <img src="<%= getSvg("search") %>" class="icon icon-left"  />
			Search</button>
			<a class="btn btn-e icon-btn" href="<%= getPath("/manager/employee/edit") %>">
			 <img src="<%= getSvg("plus") %>" class="icon icon-left" />
			 Add New</a>
		</div>	
	
		
	</form>
	
    <table>
    	<thead>
    		<tr>
    			<th>Code</th>
    			<th>Name</th>
    			<th>Role</th>
    			<th>Phone</th>	
    			<th>Email</th>
    			<th>Registration</th>
    			<th>Retire</th>
    			<th></th>
    		</tr>
    	</thead>
    	<tbody>
    
    		<jsp:useBean id="list" scope="request" type="java.util.List<com.jdc.balance.model.domain.Employee>"></jsp:useBean>
    	
    		<% for(Employee emp : list){ %>
    		<tr>
    			<td><%= emp.getCode() %></td>
    			<td><%= emp.getName() %></td>
    			<td><%= emp.getRole() %></td>
    			<td><%= emp.getPhone() %></td>
    			<td><%= emp.getEmail() %></td>
    			<td><%= getDateString(emp.getRegistrationDate())%></td>
    			<td><%= getDateString(emp.getRetireDate())%></td>
    			<td>
    				<a href="<%= getPath("/manager/employee/edit?code=" + emp.getCode()) %>">
    				<img src="<%= getSvg("pen") %>" class="icon icon-left"  />
    				</a>
    			</td>
    			
    		</tr>
    		
    		<%}%>
    	
    	</tbody>
    </table>
  
  
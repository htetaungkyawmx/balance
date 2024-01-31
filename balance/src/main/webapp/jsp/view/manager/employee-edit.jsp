<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page extends="com.jdc.balance.BaseView" %>

    <form class="form w-480"  method="post">
    	
  		<jsp:useBean id="employee" scope="request" class="com.jdc.balance.model.domain.Employee"></jsp:useBean>
    	<div class="row">
    		<div class="form-group mr-4">
	    		<label>Role</label>	
	    		<select name="role">
	    			<option value="Employee">Employee</option>
	    			<option value="Manager">Manager</option>
	    		</select>
	    	</div>
	    	
	    	
    		<div class="form-group">
	    		<label>Employee Code</label>
	    		<input name="code" type="text" value="<%= getProperty(employee.getCode()) %>" readonly="readonly" />
	    	</div>
	    	
    	</div>
    	
    	<div class="form-group">
    		<label>Name</label>
    		<input type="text" name="name" value="<%= getProperty(employee.getName()) %>" placeholder="Enter Name" />
    	</div>
    	
    	<div class="form-group">
    		<label>Phone</label>
    		<input type="tel" name="phone" value="<%= getProperty(employee.getPhone()) %>" placeholder="Enter Phone Number" />
    	</div>
    	
    	<div class="form-group">
    		<label>Email</label>
    		<input type="email" name="email" value="<%= getProperty(employee.getEmail()) %>" placeholder="Enter Email" />
    	</div>
    	<div class="row">
    		
	    	<div class="form-group mr-4">
	    		<label>Entry Date</label>
	    		<input type="date" name="registrationDate" value="<%=getDateString(employee.getRegistrationDate()) %>" />
	    	</div>
	    	<div class="form-group">
	    		<label>Retire Date</label>
	    		<input type="date" name="retireDate" value="<%=getDateString(employee.getRetireDate()) %>" />
	    	</div>
    	</div>
    	
    	<div>
    		<button type="submit" class="btn icon-btn">
    		 <img src="<%= getSvg("cloud-check") %>" class="icon icon-left" />
    		Save Employee</button>
    	</div>
    </form>
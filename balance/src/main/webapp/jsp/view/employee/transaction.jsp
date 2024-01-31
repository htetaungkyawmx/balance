<%@page import="com.jdc.balance.model.domain.Transaction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page extends="com.jdc.balance.BaseView" %>

    <form class="form-inline">
    		
    	<div class="form-group">
    		<label>From </label>
    		<input type="date" name="from" value="<%= request.getParameter("from") %>" placeholder="Search From" />
    	</div>
    	
    	<div class="form-group">
    		<label>To </label>
 			<input type="date" name="to" value="<%= request.getParameter("to") %>" placeholder="Search To" />
    	</div>
    	
    	<div class="form-group">
    		<label>Category</label>
    		<input type="text" placeholder="Search Category" name="category" />
    	</div>
    	
    	
    	<div class="form-group">
			<button type="submit" class="btn btn-e mr-4 icon-btn">
			 <img src="<%= getSvg("search") %>" class="icon icon-left"  />
			Search</button>
			<a class="btn btn-e icon-btn" href="<%= getPath("/employee/transaction/edit?type=" + request.getParameter("type")) %>">
			 <img src="<%= getSvg("plus") %>" class="icon icon-left" />
			 Add New</a>
		</div>
    
    </form>
    
    <table>
    	<thead>
    		<tr>
    			<th>Date</th>
    			<th>Employee</th>
    			<th>Category</th>
    			<th>Approved</th>
    			<th class="right">Items</th>
    			<th class="right">Amount</th>
    		</tr>
    	</thead>
    	<jsp:useBean id="list" scope="request" type="java.util.List<com.jdc.balance.model.domain.Transaction>" />
    	
    	 
    	<tbody>
    		<% for(Transaction v : list) {%>
    	
    			<tr>
    				<td>
    					<a href="<%= getPath("/employee/transaction/details?id=" + v.getId())%>">
    						<%= getDateString(v.getDate()) %>	
    					</a>
    				</td>
    				<td><%= v.getEmployee().getName() %></td>
    				<td><%= v.getCategory() %></td>
    				
    				<td><%= v.isApproved() ? "Yes" : "No"%> </td>
    				
    				<td class="right">
    					<%= formatNumber(v.getItems()) %></td>
    				<td class="right">
    					<%= formatNumber(v.getTotal()) %> MMK
    				</td>
    			</tr>
    		<%} %>
    	</tbody>
    </table>
   
	
	
	
	
	
	
	
	
	
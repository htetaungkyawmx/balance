<%@page import="com.jdc.balance.model.domain.TransactionDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page extends="com.jdc.balance.BaseView" %>
	<jsp:useBean id="loginInfo" class="com.jdc.balance.security.LoginUser"
		scope="session" />
	<jsp:useBean id="data" scope="request" type="com.jdc.balance.model.domain.Transaction"></jsp:useBean>

    <!-- Header Info -->
    <div class="balance-summary">
    
    	<label>Date</label>
    	<input type="text" disabled="disabled" value="<%= getDateString(data.getDate())%>"/>
    	
    	<label>Employee</label>
    	<input type="text" disabled="disabled" value="<%= data.getEmployee().getName()%>"/>
    	
    	<label>Items</label>
    	<input type="text" class="right" disabled="disabled" value="<%= data.getItems()%>"/>
    	
    	
    	<label>Category</label>
    	<input type="text" disabled="disabled" value="<%= data.getCategory()%>"/>
    	
    	<label>Status</label>
    	<input type="text"  disabled="disabled" value="<%= data.isApproved() ? "Approved" : "Not Approved" %>"/>
    	
    	<label>Total</label>
    	<input type="text" class="right" disabled="disabled" value="<%= formatNumber(data.getTotal()) %> MMK"/>
    	
    	
    </div>
    
    <!-- Actions -->
    <div class="balance-action">
    	
    	<%if(loginInfo.isManager() ||
    			(!loginInfo.isManager()
    					&& !data.isApproved()
    					&& data.ownTransaction(loginInfo.profile().getCode()) )) { %>
    	
	    	<a href="<%= getPath("/employee/transaction/edit?id=" + data.getId() + "&type=" + data.getType().name() ) %>" class="btn icon-btn ">
	    		 <img src="<%= getSvg("plus") %>" class="icon icon-left"  />
	    		Edit
	    	</a>
    	
    	<% } %>
    	<%if(loginInfo.isManager() && !data.isApproved()) { %>
    
	    	<a href="<%= getPath("/manager/transaction/approve?id=" + data.getId()) %>" class="btn icon-btn ml-4">
	    		<img src="<%= getSvg("user-check") %>" class="icon icon-left"  />
	    		Approve
	    	</a>
    	
    	<% } %>
    </div>
    
    
    <!-- Details Info -->
    <h3>Expense Details</h3>
    <table>
    	<thead>
    		<tr>
    			<th>Item</th>
    			<th>Remark</th>
    			<th class="right">Unit Price</th>
    			<th class="right">Quantity</th>
    			<th class="right">Total</th>
    			
    		</tr>
    	</thead>
    	<tbody>
    		<%for(int i=0; i < data.getDetails().size(); i++){ 
    			TransactionDetails details = data.getDetails().get(i);
    		%>
    		<tr>
    			<td><%= details.getItem() %></td>
    			<td><%= details.getRemark() %></td>
    			<td class="right"><%= formatNumber(details.getPrice()) %></td>
    			<td class="right"><%= details.getQuantity() %></td>
    			<td class="right"><%= formatNumber(details.getTotal()) %>MMK</td>
    		</tr>
    		<%}%>
    	</tbody>
    </table>
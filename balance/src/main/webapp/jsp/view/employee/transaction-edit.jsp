<%@page import="com.jdc.balance.model.domain.TransactionDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page extends="com.jdc.balance.BaseView"%>
<jsp:useBean id="loginInfo" scope="session" type="com.jdc.balance.security.LoginUser"></jsp:useBean>
<jsp:useBean id="data" scope="request" type="com.jdc.balance.model.domain.Transaction"></jsp:useBean>

<script src="<%=getPath("/assets/js/transaction-edit.js")%>"></script>

<!-- Header Info -->
<form action="<%=getPath("/employee/transaction/edit")%>" method="post">
	
	<input type="hidden" name="id" value="<%= data.getId() %>" />
	<input type="hidden" name="type" value="<%= data.getType().name() %>" />
	<input type="hidden" name="employeeCode" value="<%= data.getEmployee().getCode() %>" />
	
	<div class="balance-summary">

		<label>Date</label> 
		<input name="date" type="date" value="<%= getDateString(data.getDate()) %>" required="required"/>
		
		<label>Employee</label>
		<input type="text" disabled="disabled" value="<%= data.getEmployee().getName()%>" /> 
		
		<label>Items</label>
		<input name="allCount" type="text" class="right" disabled="disabled" value="0" /> 
			
		<label>Category</label> 
		<input name="category" type="text" value="<%= getProperty(data.getCategory())%>" placeholder="Enter Category" required="required" /> 
		
		<label>Status</label>
		<input disabled="disabled" value="<%= data.isApproved() ? "Approved" : "Not Approved" %>" /> 
		
		<label>Total</label>
		<input name="allTotal" class="right" disabled="disabled" value="0" />


	</div>
	<!-- Actions -->
	<div class="balance-action">
		<a href="#" onclick="addDetails(); return false;"
			class="btn icon-btn  mr-4"> 
			<img src="<%=getSvg("plus")%>"
			class="icon icon-left" /> ADD DETAILS
		</a> 
		<button type="submit" class="btn icon-btn"> <img
			src="<%=getSvg("user-check")%>" class="icon icon-left" /> SAVE
		</button>
	</div>



	<!-- Details Info -->
	<h3>Income Details</h3>
	<table>
		<thead>
			<tr>
				<th>Item</th>
				<th>Remark</th>
				<th class="right w-num-input">Unit Price</th>
				<th class="right w-num-input">Quantity</th>
				<th class="right w-num-input">Total</th>

			</tr>
		</thead>
		<tbody id="detailsWrapper">
		
			<% for(TransactionDetails details : data.getDetails()) { %>
		
			<tr>
				<td><input name="item" value="<%= getProperty(details.getItem() )%>" type="text" placeholder="Item Name" />
				</td>
				
				<td><input name="remark" value="<%= getProperty(details.getRemark()) %>" type="text" placeholder="Enter Remark" />
				</td>

				<td class="right">
					<input name="price" type="number" value="<%= details.getPrice() %>" />
				</td>

				<td class="right"><input name="count" type="number" value="<%= details.getQuantity() %>" />
				</td>

				<td class="right"><input name="total" type="number" value="<%= details.getTotal() %>" readonly="readonly" /></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</form>

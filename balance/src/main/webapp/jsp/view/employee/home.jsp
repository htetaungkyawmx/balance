<%@page import="com.jdc.balance.model.vo.Category"%>
<%@page import="java.util.Map"%>
<%@page import="com.jdc.balance.model.domain.Transaction.Type"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page extends="com.jdc.balance.BaseView"%>


	<%
	int incomes = (int) request.getAttribute("incomeSummary");
	int expenses = (int) request.getAttribute("expenseSummary");
	int balance = (int) request.getAttribute("balanceSummary");

	%>
<div id="dash-summary">


	<div>
		<h3>Expenses</h3>

		<span> <%=formatNumber(expenses)%>
		</span>
	</div>

	<div>

		<h3>Incomes</h3>

		<span> <%=formatNumber(incomes)%>
		</span>
	</div>

	<div>
		<h3>Balance</h3>

		<span> <%=formatNumber(balance)%>
		</span>
	</div>

	<div>
		<h3>Employee</h3>

		<span> <%=request.getAttribute("empCount")%>
		</span>
	</div>

</div>


<div id="dash-tops">
	<%
		@SuppressWarnings("unchecked")
		List<Category> incomeList = (List<Category>)request.getAttribute("incomeCategory");
		@SuppressWarnings("unchecked")
		List<Category> expenseList = (List<Category>)request.getAttribute("expenseCategory");
	%>

	<div>
		<h3>Top Expenses</h3>

		<table>
			<thead>
				<tr>
					<th>No.</th>
					<th>Category</th>
					<th>Min</th>
					<th>Max</th>
					<th>Quantity</th>
					<th>Total</th>
				</tr>
			</thead>
			
			<tbody>
				<% for(int i=0; i<incomeList.size(); i++) {
					Category c = incomeList.get(i);
				%>
				<tr>
					<td><%= i + 1 %></td>
					<td><%= c.name() %></td>
					<td><%= c.min() %></td>
					<td><%= c.max() %></td>
					<td><%= c.count() %></td>
					<td><%= c.total() %></td>
				</tr>
				<%
					}
				%>
			
			</tbody>

		</table>
	</div>

	<div>
		<h3>Top Incomes</h3>

		<table>
			<thead>
				<tr>
					<th>No.</th>
					<th>Category</th>
					<th>Min</th>
					<th>Max</th>
					<th>Quantity</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
			<tbody>
				<% for(int i=0; i<expenseList.size(); i++) {
					Category c = expenseList.get(i);
				%>
				<tr>
					<td><%= i + 1 %></td>
					<td><%= c.name() %></td>
					<td><%= c.min() %></td>
					<td><%= c.max() %></td>
					<td><%= c.count() %></td>
					<td><%= c.total() %></td>
				</tr>
				<%
					}
				%>
			
			</tbody>


		</table>
	</div>

</div>



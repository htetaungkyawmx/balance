<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page extends="com.jdc.balance.BaseView" %>
    
<section class="card w-480">
	<h3 class="form-title">
		<img class="icon icon-left" src="<%= getSvg("enter") %>" />
		Member Login
	</h3>
	
	<jsp:include page="/jsp/includes/error-message.jsp"></jsp:include>
	
	<form class="form" action="<%= getPath("/login") %>" method="post">
		<!-- Email Address -->
		<div class="form-group">
			<label>Login ID</label>
			<input name="loginId" placeholder="Enter Employee Code" required="required"/>
		</div>
			
		<!-- Password -->
		<div class="form-group">
			<label>Password</label>
			<input name="password" type="password" placeholder="Enter Password" required="required"/>
		</div>
		
		<!-- Login Button -->
		<div>
			<button class="btn icon-btn" type="submit">
				<img class="icon icon-left" src=" <%= getSvg("power") %>" >
				Login
			</button>
		</div>
	</form>
	
</section>
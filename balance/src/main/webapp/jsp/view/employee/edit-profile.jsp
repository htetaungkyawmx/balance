<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page extends="com.jdc.balance.BaseView" %>
<jsp:useBean id="loginInfo" scope="session" type="com.jdc.balance.security.LoginUser"></jsp:useBean>
	
<jsp:include page="/jsp/includes/error-message.jsp"></jsp:include>
		

  <form action="#" method="post" class="form w-480">
  	<div class="form-group">
	  	<label>Employee Code</label>
	  	<input type="text" name="code" value="<%= loginInfo.profile().getCode() %>" readonly="readonly" />
  	</div>
  	
  	<div class="form-group">
  		<label>Employee Name</label>
  		<input type="text" name="name" value="<%= loginInfo.profile().getName() %>" placeholder="Enter Name" />
  	</div>
  	
  	
  	<div class="form-group">
  		<label>Phone Number</label>
  		<input type="text" name="phone" value="<%= loginInfo.profile().getPhone()%>" placeholder="Enter Phone Number" />
  	
  	</div>
	
	
	<div class="form-group">
  		<label>Email Address</label>
  		<input type="email" name="email" value="<%= loginInfo.profile().getEmail() %>" placeholder="Enter Email Address" />
  	</div>
	
	  	
  	
  	<div>
    		<button type="submit" class="btn icon-btn">
    		 <img src="<%= getSvg("cloud-check") %>" class="icon icon-left" />
    		Save Profile</button>
    </div>
    
 
  	
  </form>
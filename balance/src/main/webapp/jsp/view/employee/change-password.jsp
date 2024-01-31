<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page extends="com.jdc.balance.BaseView" %>
<jsp:include page="/jsp/includes/error-message.jsp"></jsp:include>

    <form method="post" action="#" class="form w-480">
    	<div class="form-group">
    		<label for="old pass">Original Password</label>
    		<input type="password" name="old-pass" required="required" placeholder="Enter Password" />
    	</div>
    	
    	
    	<div class="form-group">
	    	<label for="new pass">New Password</label>
	    	<input type="password" name="new-pass" required="required" placeholder="Enter New Password" />
	    </div>
    	
    	
    	<div class="form-group">
    		<label for="confirm pass">Confirm Password</label>
    		<input type="password" name="confirm-pass" required="required" placeholder="Enter New Password Again" />
    	</div>
    	
    	<div>
    			<button class="btn" type="submit">Change Password</button>
    	</div>
    	
    </form>
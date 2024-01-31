<%@page import="com.jdc.balance.security.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page extends="com.jdc.balance.BaseView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Balance | <%=request.getAttribute("page-title")%></title>
<link rel="stylesheet" href="<%=getPath("/assets/css/style.css")%>" />
</head>
<body>

	<jsp:useBean id="loginInfo" class="com.jdc.balance.security.LoginUser"
		scope="session" />
	<jsp:useBean id="content" class="java.lang.String" scope="request" />

	<c:choose>
		<c:when test="${loginInfo.isLogin()}">


			<!-- Employee Template -->
			<main class="employee">
				<header class="shadow">
					<div class="brand-logo">
						<img src="<%=getSvg("home")%>" class="icon icon-left icon-home" />
						Balance
					</div>

					<nav>
						<a class="<%=getActiveClass(request, "home")%>"
							href="<%=getPath("/employee/home")%>"> <img
							src="<%=getSvg("meter")%>" class="icon icon-left" /> Dashboard
						</a> <a class="<%=getActiveClass(request, "expenses")%>"
							href="<%=getPath("/employee/transaction/search?type=Expense")%>">
							<img src="<%=getSvg("folder-minus")%>" class="icon icon-left" />
							Expenses
						</a> <a class="<%=getActiveClass(request, "incomes")%>"
							href="<%=getPath("/employee/transaction/search?type=Income")%>">
							<img src="<%=getSvg("folder-plus")%>" class="icon icon-left" />
							Incomes
						</a>

						<%
						if (loginInfo.isManager()) {
						%>
						<a class="<%=getActiveClass(request, "reports")%>"
							href="<%=getPath("/manager/balance")%>"> <img
							src="<%=getSvg("stats-dots")%>" class="icon icon-left" />
							Balance Report
						</a> <a class="<%=getActiveClass(request, "employees")%>"
							href="<%=getPath("/manager/employee/search")%>"> <img
							src="<%=getSvg("users")%>" class="icon icon-left" /> Employees
						</a>
						<%}%>

						<a href="<%=getPath("/logout")%>"> <img
							src="<%=getSvg("exit")%>" class="icon icon-left" /> Logout
						</a>
					</nav>
				</header>

				<aside class="box shadow">

					<!-- User login profile -->
					<img class="profile-img"
						src="<%=getPath("/assets/images/" + loginInfo.getProfileImage())%>" />

					<!--  User Information -->
					<div class="user-name">
						<jsp:getProperty property="name" name="loginInfo" />
					</div>


					<div class="user-role">


						<jsp:getProperty property="role" name="loginInfo" />
					</div>

					<!-- User Action -->
					<div class="user-actions">
						<a class="btn" onclick="openUploadFile(); return false;">Upload
							Photo</a> <a class="btn"
							href="<%=getPath("/employee/edit-profile")%>">Edit Profile</a> <a
							class="btn" href="<%=getPath("/employee/change-pass")%>">Change
							Password</a>
					</div>

					<form id="profileImageForm"
						action="<%=getPath("/employee/profile-image")%>" method="post"
						enctype="multipart/form-data">
						<input accept="image/png" id="profileImageInput"
							onchange="uploadImage()" type="file" name="profileImage">
					</form>
					<!-- User Menu -->
					<script src="<%=getPath("/assets/js/side-bar.js")%>"></script>
				</aside>

				<section class="box shadow">

					<div class="view-title">
						<%=request.getAttribute("view-title")%>
					</div>

					<jsp:include page="<%=content%>"></jsp:include>
				</section>

			</main>
		</c:when>

		<c:otherwise>
			<main class="anonymous">
				<!-- Anonymous Template -->
				<jsp:include page="${content}"></jsp:include>
			</main>

		</c:otherwise>
	</c:choose>



</body>
</html>
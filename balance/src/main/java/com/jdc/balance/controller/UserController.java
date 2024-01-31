package com.jdc.balance.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import com.jdc.balance.BaseController;
import com.jdc.balance.Destination;
import com.jdc.balance.model.domain.Transaction.Type;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/employee/home", "/employee/change-pass", "/employee/edit-profile", "/employee/profile-image" })
@MultipartConfig
public class UserController extends BaseController {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp, String path)
			throws ServletException, IOException {
		switch (path) {
		case "/employee/home" -> loadHome(req, resp);
		case "/employee/change-pass" -> changePassword(req, resp);
		case "/employee/edit-profile" -> editProfile(req, resp);
		case "/employee/profile-image" -> uploadProfileImage(req, resp);
		}
	}

	private void loadHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var summary = balanceService().getSummary();

		req.setAttribute("incomeSummary",  summary.get(Type.Income));
		req.setAttribute("expenseSummary", summary.get(Type.Expense));
		req.setAttribute("balanceSummary", summary.get(Type.Income) - summary.get(Type.Expense));
		
		var categories = balanceService().getCategorySummary();
		
		req.setAttribute("incomeCategory",  categories.get(Type.Income));
		req.setAttribute("expenseCategory", categories.get(Type.Expense));
		
		req.setAttribute("empCount", employeeService().count());

		navigate(new Destination.Builder().req(req).resp(resp).view("employee/home").pageTitle("Home")
				.viewTitle("Dashboard").activeMenu("home").build());
	}

	private void uploadProfileImage(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		var profileImage = req.getPart("profileImage");

		if (null != profileImage) {

			var profile = getLoginInfo(req).profile();
			var imageFoder = getServletContext().getRealPath("/assets/images");
			var imageFile = String.format("%s.png", profile.getCode());
			Files.copy(profileImage.getInputStream(), Path.of(imageFoder, imageFile),
					StandardCopyOption.REPLACE_EXISTING);

			var user = userService().saveProfileImages(profile.getCode(), imageFile);

			super.getLoginInfo(req).login(user);
		}
		redirect(resp, "/employee/home");

	}

	private void changePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var change = new Destination.Builder().req(req).resp(resp).view("employee/change-password")
				.pageTitle("Password").viewTitle("Change Password").activeMenu("home").build();
		if (isPostRequest(req)) {
			// TODO save password action

			super.handleBusinessError(() -> {
				var code = getLoginInfo(req).profile().getCode();

				super.userService().changePass(code, req.getParameter("old-pass"), req.getParameter("new-pass"),
						req.getParameter("confirm-pass"));

				var user = super.employeeService().findByCode(code);

				super.getLoginInfo(req).login(user);

				redirect(resp, "/employee/home");
			}, change);
		} else {
			navigate(change);
		}
	}

	private void editProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var editView = new Destination.Builder().req(req).resp(resp).view("employee/edit-profile").pageTitle("Profile")
				.viewTitle("Edit Profile").activeMenu("home").build();
		if (isPostRequest(req)) {

			this.handleBusinessError(() -> {
				var code = req.getParameter("code");
				var user = employeeService().findByCode(code);

				user.setName(req.getParameter("name"));
				user.setPhone(req.getParameter("phone"));
				user.setEmail(req.getParameter("email"));

				user = super.employeeService().save(user);

				this.getLoginInfo(req).login(user);

				redirect(resp, "/employee/home");
			}, editView);

		} else {
			navigate(editView);
		}
	}

}
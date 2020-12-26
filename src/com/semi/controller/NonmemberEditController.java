package com.semi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.NonmemberDao;
import com.semi.domain.NonmemberVo;

@WebServlet("/nonmember/edit")
public class NonmemberEditController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(req.getParameter("num"));
		int status = Integer.parseInt(req.getParameter("newStatus"));
		String email= req.getParameter("email");
		String phone= req.getParameter("phone");
		
		NonmemberDao dao = NonmemberDao.getDao();
		int n = dao.edit(num, status);
		ArrayList<NonmemberVo> list = dao.getInfo(email, phone);
		
		req.setAttribute("email", email);
		req.setAttribute("phone", phone);
		if(n>0) {
			req.setAttribute("list", list);
			req.getRequestDispatcher("/nonmember/searchOrder.jsp").forward(req, resp);
		}else {
			req.setAttribute("code", "ErrCode:0090 관리자에게 문의해주세요");
			req.getRequestDispatcher("/nonmember/result.jsp").forward(req, resp);
		}

	}
}

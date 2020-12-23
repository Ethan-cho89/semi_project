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

@WebServlet("/nonmember/searchOrder")
public class NonmemberSearchOrderController extends HttpServlet  {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		NonmemberDao dao = NonmemberDao.getDao();
		ArrayList<NonmemberVo> list = dao.getInfo(email, phone);
		if(list.isEmpty()) {
			req.setAttribute("errMsg", "해당 정보로 조회되는 주문내역이 없습니다");
			req.getRequestDispatcher("/nonmember/nonmember.jsp").forward(req, resp);
		}else {
			req.setAttribute("list", list);
			req.getRequestDispatcher("/nonmember/searchOrder.jsp").forward(req, resp);
		}
	}
}

package com.semi.controller;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.kyj.OrderDetailDao;

@WebServlet("/shoppinginfo/ordercancel")
public class OrderCancelController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid=(String)req.getSession().getAttribute("id");
		if(mid==null) {
			resp.sendRedirect(req.getContextPath()+"/member/login.jsp");		
		}else {
			int num=Integer.parseInt(req.getParameter("num"));
			OrderDetailDao dao=new OrderDetailDao();
			int n=dao.ordercancel(mid, num);
			if(n>0) {
				req.getRequestDispatcher("/index.jsp").forward(req, resp);
			}
		}
	}
}


















package com.semi.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.kyj.OrderDetailDao;
import com.semi.domain.kyj.OrderDetailVo;

@WebServlet("/shoppinginfo/orderdetail")
public class OrderDetailViewController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String omid=(String)req.getSession().getAttribute("id");
		if(omid==null) {
			resp.sendRedirect(req.getContextPath()+"/member/login.jsp");		
		}else {
			int onum=Integer.parseInt(req.getParameter("num"));
			
			OrderDetailDao dao=new OrderDetailDao();
			OrderDetailVo vo=dao.orderdetail(omid, onum);
			req.setAttribute("vo",vo);
			req.getRequestDispatcher("/shoppinginfo/orderdetail.jsp").forward(req, resp);
		}
	}
}
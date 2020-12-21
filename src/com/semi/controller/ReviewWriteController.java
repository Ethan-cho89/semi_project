package com.semi.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.kyj.ReviewDao;

@WebServlet("/shoppinginfo/reviewwrite")
public class ReviewWriteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=(String)req.getSession().getAttribute("id");
		String iname = req.getParameter("name");
		int onum=Integer.parseInt(req.getParameter("num"));
		if(id==null) {
			resp.sendRedirect(req.getContextPath()+"/member/login.jsp");		
		}else {
		req.setAttribute("iname", iname);
		req.setAttribute("onum", onum);
		req.getRequestDispatcher("/shoppinginfo/reviewwrite.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String rid=(String)req.getSession().getAttribute("id");
		if(rid==null) {
			resp.sendRedirect(req.getContextPath()+"/member/login.jsp");		
		}else {
			int onum = Integer.parseInt(req.getParameter("onum"));
			int rrate = Integer.parseInt(req.getParameter("rate"));
			String rct = req.getParameter("content");
			
			ReviewDao dao =  new ReviewDao();
			int n = dao.write(rid, onum, rrate, rct);
			
			if(n>0) {
				req.getRequestDispatcher("/index.jsp").forward(req, resp);
			}
		}
	}
}

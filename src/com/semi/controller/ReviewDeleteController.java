package com.semi.controller;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.kyj.ReviewDao;
@WebServlet("/shoppinginfo/reviewdelete")
public class ReviewDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=(String)req.getSession().getAttribute("id");
		if(id==null) {
			resp.sendRedirect(req.getContextPath()+"/member/login.jsp");		
		}else {
			int onum=Integer.parseInt(req.getParameter("onum"));
			ReviewDao dao=new ReviewDao();
			int n=dao.delete(onum,id);
			if(n>0) {
				req.getRequestDispatcher("/index.jsp").forward(req, resp);
			}
		}
	}
}


















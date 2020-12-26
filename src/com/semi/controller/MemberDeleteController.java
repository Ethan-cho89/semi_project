package com.semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.MemberDao;

@WebServlet("/member/deletepage")
public class MemberDeleteController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String pwd=req.getParameter("pwd");
		MemberDao dao=new MemberDao();
		boolean check=dao.getinfo(id, pwd);
		System.out.println(check +"비번"+pwd);
		
		if(check==true) {
			int n=dao.delete(id, pwd);	
			if(n>0) {
				session.invalidate();
				req.getRequestDispatcher("/home.jsp").forward(req, resp);
			}else {
				req.setAttribute("code","fail");
				req.getRequestDispatcher("/member/deletepage.jsp").forward(req, resp);
			}
		}else {
			req.setAttribute("code","비번 틀림");
			req.getRequestDispatcher("/member/deletepage.jsp").forward(req, resp);
		}
	}
}

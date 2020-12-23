package com.semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.MemberDao;
import com.semi.domain.Member;

@WebServlet("/member/delete")
public class MemberDeleteController extends HttpServlet{	 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String pwd=req.getParameter("pwd");
		MemberDao dao=new MemberDao();
		boolean del=dao.deleteok(id, pwd);
		if(del==true) {
			int n=dao.delete(id);
			if(n>0) {
				session.invalidate();//방금 추가 
				req.getRequestDispatcher("/home.jsp").forward(req, resp);
			}else {
				req.setAttribute("code","fail");
			}
		}else {
			req.setAttribute("code","비밀번호가 다릅니다.");
		}
			req.getRequestDispatcher("/member/deletepage.jsp").forward(req, resp);
	}
}
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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		MemberDao dao=new MemberDao();
		int n=dao.delete(id);
		
		if(n>0) {
			session.invalidate();//방금 추가 
			req.setAttribute("code","success");
		}else {
			req.setAttribute("code","fail");
		}
		
		req.getRequestDispatcher("/member/result.jsp").forward(req, resp);
	}
		 
	
}

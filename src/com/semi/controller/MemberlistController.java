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


@WebServlet("/member/list")
public class MemberlistController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		MemberDao dao=new MemberDao();
		
		HttpSession session=req.getSession();
		//session.setAttribute("id", "fsd");
		String id=(String)session.getAttribute("id");
		Member list=dao.mygetinfo(id);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/member/list.jsp").forward(req, resp);
	}	
}

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


@WebServlet("/member/update")
public class MemberUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		//session.setAttribute("id", "fsd");
		String id=(String)session.getAttribute("id");
		MemberDao dao=new MemberDao();
		Member mem=dao.mygetinfo(id);
		req.setAttribute("member",mem);
		req.getRequestDispatcher("/member/updateForm.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String phone =req.getParameter("phone");
		String nick =req.getParameter("nick");
		 int eokay=0; 
		 if(req.getParameter("eokay")==null){
			 eokay=2;
		 }else{
			 eokay=1;
			 }
		 
		 MemberDao dao=new MemberDao();
		 
		Member mem=new Member(id, pwd, phone, nick, null, eokay,1);
		int n=dao.update(mem);
		if(n>0) {
			req.setAttribute("code","success");
		}else {
			req.setAttribute("code","fail");
		}
		req.getRequestDispatcher("/home.jsp").forward(req, resp);
	}
}

package com.semi.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.LoginDao;
import com.semi.dao.MemberDao;
import com.semi.domain.Member;

@WebServlet("/member/login")
public class MemberLoginController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("id",id);
		map.put("pwd",pwd);
		LoginDao dao=new LoginDao();
		MemberDao dao1=new MemberDao();
		boolean a=dao.isMember(map);
		int n=dao1.authority(id);
		if(a) {
			HttpSession session=req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("status", n);
			resp.sendRedirect(req.getContextPath()+"/home.jsp");
		}else {
			req.setAttribute("errMsg","입력하신 아이디 또는 비밀번호가 없습니다.");
			req.getRequestDispatcher("/member/login.jsp").forward(req, resp);
		}
	}
}

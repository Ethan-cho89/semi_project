package com.semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.MemberDao;
import com.semi.domain.Member;

@WebServlet("/member/join")
public class JoinController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//1.전송된 파라미터를 db에 저장하기
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String phone=req.getParameter("phone");
		String nick=req.getParameter("nick");
		String eokay1=req.getParameter("eokay");
		System.out.println(eokay1);
		int eokay=0;
		if(eokay1==null) {	
			eokay=2;
		}else if(eokay1.equals("on")) {
			eokay=1;
		}
		//int status=Integer.parseInt(req.getParameter("status"));
		Member mem=new Member(id,pwd,phone,nick,null,eokay,1);
		MemberDao dao=new MemberDao();
		String resultCode="success";
		int n=dao.insert(mem);
		if(n<1) {
			resultCode="fail";
		}
		req.setAttribute("code", resultCode);
		req.getRequestDispatcher("/member/result.jsp").forward(req, resp);
	}
}

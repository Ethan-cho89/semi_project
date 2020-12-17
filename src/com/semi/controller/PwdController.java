package com.semi.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.MemberDao;
import com.semi.domain.Member;




@WebServlet("/findpwd")
public class PwdController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String phone =req.getParameter("phone");
		String nick =req.getParameter("nick");
		MemberDao dao=new MemberDao();
		Member mem=new Member(id, null, phone, nick, null, 0, 0);
		boolean info=dao.getinfo(id,phone,nick);
		//System.out.println(id+phone+ nick+info);
		String msg="";
		if(info==true) {
			msg=dao.updatepwd(mem);
			
		}else {
			msg="잘못입력하셨습니다.";
		}
		req.setAttribute("msg",msg);
		req.getRequestDispatcher("/member/findpwd.jsp").forward(req, resp);
	}
}
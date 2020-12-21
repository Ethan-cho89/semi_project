package com.semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.MemberDao;
@WebServlet("/manager/block")
public class ManagerBlockController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		int status=Integer.parseInt(req.getParameter("status"));
		MemberDao dao=new MemberDao();
		System.out.println(id+status);
		int n=0;
		if(status==1) {
			dao.block(id);
		}else if(status==3) {
			dao.unblock(id);
		}
		
		if(n>0) {
			req.setAttribute("code","success");
		}else {
			req.setAttribute("code","fail");
		}
		
		req.getRequestDispatcher("/manager/list").forward(req, resp);
	}
}


package com.semi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.MemberDao;
import com.semi.domain.Member;
@WebServlet("/manager/list")
public class ManagerListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDao dao=new MemberDao();
		ArrayList<Member> list=dao.list();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/manager/list.jsp").forward(req, resp);
	}
}

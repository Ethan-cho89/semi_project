package com.semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.AddressDao;

@WebServlet("/address/delete")
public class AddressDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));
		System.out.println(num);
//		AddressDao dao = AddressDao.getDao();
//		int n = dao.delete(num);
//		if(n>0) {
//			req.setAttribute("code", "success");
//		}else {
//			req.setAttribute("code", "fail");
//		}
//		req.getRequestDispatcher("/address/result.jsp").forward(req, resp);
	}
}

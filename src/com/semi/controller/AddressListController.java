package com.semi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.AddressDao;
import com.semi.domain.AddressVo;

@WebServlet("/address/list")
public class AddressListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String)req.getSession().getAttribute("id");
		AddressDao dao = AddressDao.getDao();
		ArrayList<AddressVo> list =  dao.list(id);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/address/list.jsp").forward(req, resp);
	}
}

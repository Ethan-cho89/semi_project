package com.semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.AddressDao;
import com.semi.domain.AddressVo;

@WebServlet("/address/edit")
public class AddressEditController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		AddressDao dao = AddressDao.getDao();
		AddressVo vo = dao.load(num);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/address/edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String address = req.getParameter("address");
		String name = req.getParameter("name");
		String id= req.getParameter("id");
		int num = Integer.parseInt(req.getParameter("num"));
		int isDefault = 0;
		AddressDao dao = AddressDao.getDao();
		int n=0;
		try {
			isDefault = Integer.parseInt(req.getParameter("isDefault")); // null이 아닐경우 1이 들어간다
			int d=  dao.clean(id); //주소 전체를 지워서 주소 갯수만큼 숫자가 리턴
			if(d!=-1 && d!=0) { 
				n=1;
			}
		}catch(NumberFormatException ne) {
			
		}finally {
			AddressVo vo = new AddressVo(num, null, name, address, null, null, null, null, isDefault);
			n += dao.edit(vo);
		}
		if(n==2) {
			req.setAttribute("code", "success");
		}else {
			req.setAttribute("code", "fail");
		}
		req.getRequestDispatcher("/address/result.jsp").forward(req, resp);
	}
}

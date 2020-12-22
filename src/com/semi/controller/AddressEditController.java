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
		boolean check = false;
		int n=0;
		try {
			isDefault = Integer.parseInt(req.getParameter("isDefault")); // null이 아닐경우 1이 들어간다
			check=true;//오류가 안생겼다면 실행될 코드
		}catch(NumberFormatException ne) {
			
		}finally {
			AddressVo vo = new AddressVo(num, id, name, address, null, null, null, null, isDefault);
			n = dao.edit(check,vo);
		}
		if(check) {
			if(n>0) {
				resp.sendRedirect(req.getContextPath()+"/address/list");
			}else {
				req.setAttribute("code", "fail");
				req.setAttribute("errMsg", "ERROR CODE:'0012' 관리자에게 문의해주세요");
				req.getRequestDispatcher("/coupon/result.jsp").forward(req, resp);
			}
		}else if(!check){
			if(n>0) {
				resp.sendRedirect(req.getContextPath()+"/address/list");
			}else {
				req.setAttribute("code", "fail");
				req.setAttribute("errMsg", "ERROR CODE:'0013' 관리자에게 문의해주세요");
				req.getRequestDispatcher("/coupon/result.jsp").forward(req, resp);
			}
		}
	}
}

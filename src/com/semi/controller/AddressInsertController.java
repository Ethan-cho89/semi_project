package com.semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.AddressDao;
import com.semi.domain.AddressVo;

@WebServlet("/address/insert")
public class AddressInsertController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/address/insert.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = (String)req.getSession().getAttribute("id");
		String name= req.getParameter("name");
		String address = req.getParameter("address");
		int isDefault=0;
		AddressDao dao = AddressDao.getDao();
		boolean check = false;
		int n=0;
		try {
			isDefault = Integer.parseInt(req.getParameter("isDefault"));
			check=true;//오류가 안생겼다면 실행될 코드
		}catch(NumberFormatException ne) {
			
		}finally {
			AddressVo vo = new AddressVo(0, id, name, address, null, null, null, null, isDefault);
			n = dao.insert(check,vo);
		}
		
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/address/list");
		}else {
			req.setAttribute("code", "fail");
			req.setAttribute("errMsg", "ERROR CODE:'0010' 관리자에게 문의해주세요");
			req.getRequestDispatcher("/coupon/result.jsp").forward(req, resp);
		}
	}
}

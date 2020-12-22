package com.semi.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.CouponDao;
import com.semi.domain.CouponVo;

@WebServlet("/coupon/insert")
public class CouponInsertController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/coupon/insert.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name").toUpperCase();
		int dcrate = Integer.parseInt(req.getParameter("dcrate"));
		Date stdate = Date.valueOf(req.getParameter("stdate"));
		Date exdate = Date.valueOf(req.getParameter("exdate"));
		CouponVo vo = new CouponVo(0, dcrate, stdate, exdate, name, null, 0);
		CouponDao dao = CouponDao.getDao();
		int n = dao.insert(vo);
		
		if(n==2) {
			resp.sendRedirect(req.getContextPath()+"/coupon/list");
		}else {
			req.setAttribute("code", "fail");
			req.setAttribute("errMsg", "중복된 값이 없는지 확인해주세요");
			req.getRequestDispatcher("/coupon/result.jsp").forward(req, resp);
		}
	}
}

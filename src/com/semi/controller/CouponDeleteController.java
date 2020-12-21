package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.CouponDao;

@WebServlet("/coupon/delete")
public class CouponDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(req.getParameter("num"));
	
		CouponDao dao = CouponDao.getDao();
		int n = dao.delete(num); //쿠폰 테이블에서 지우면 쿠폰홀더테이블에서도 지워짐
		
		req.getRequestDispatcher("/coupon/list").forward(req, resp);
	}
}

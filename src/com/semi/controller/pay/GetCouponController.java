package com.semi.controller.pay;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.dao.AddressDao;
import com.semi.dao.CouponDao;
import com.semi.dao.Couponholder.CouponholderDao;
import com.semi.domain.AddressVo;
import com.semi.domain.CouponHolderVo;
import com.semi.domain.CouponVo;

@WebServlet("/pay/getCoupon")
public class GetCouponController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String) req.getSession().getAttribute("id");
		
		CouponholderDao dao = CouponholderDao.getInstance();
		List<CouponHolderVo>list = dao.getList(id);
		
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/plain;charset=utf-8");
		Gson gson = new Gson();	
		
		PrintWriter pw = resp.getWriter();
		pw.print(gson.toJson(list));
	}
}

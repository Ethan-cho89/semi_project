package com.semi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.CouponDao;
import com.semi.domain.CouponVo;
import com.semi.domain.OrderVo;

@WebServlet("/coupon/list")
public class CouponListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		CouponDao dao = CouponDao.getDao();
		
		String field = req.getParameter("field");
		String keyword= req.getParameter("keyword");
		if(keyword!=null) {
			keyword=keyword.toUpperCase();
		}

		String spageNum = req.getParameter("pageNum");
		int pageNum =1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow = (pageNum-1)*10+1;
		int endRow = startRow+9;
		
		int startPageNum=(pageNum-1)/10*10+1;
		int endPageNum=startPageNum+9;
		
		ArrayList<CouponVo> list=null;
		int pageCount=1;
		try {
			pageCount= (int)Math.ceil(dao.getCount(field, keyword)/10.0);
			if(endPageNum>pageCount) {
				endPageNum=pageCount;
			}
			list= dao.list(field, keyword, startRow, endRow);
			req.setAttribute("list", list);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("field", field);
			req.setAttribute("keyword", keyword);
			req.setAttribute("startPageNum", startPageNum);
			req.setAttribute("endPageNum", endPageNum);
			req.setAttribute("pageCount", pageCount);
		}catch(NumberFormatException n){
			req.setAttribute("errMsg", "키워드를 확인해주세요");
		}finally {
			req.getRequestDispatcher("/coupon/list.jsp").forward(req, resp);
		}
	}
}

package com.semi.controller;

import java.io.IOException;


import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.kyj.ReviewDao;
import com.semi.domain.kyj.ReviewVo;

@WebServlet("/shoppinginfo/reviewlist")
public class ReviewListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id=(String)req.getSession().getAttribute("id");
		if(id==null) {
			resp.sendRedirect(req.getContextPath()+"/member/login.jsp");		
		}else {
			String spageNum=req.getParameter("pageNum");
			int pageNum=1;
			if(spageNum!=null) {
				pageNum=Integer.parseInt(spageNum);
			}
			int startRow=(pageNum-1)*10+1;
			int endRow = startRow+9;
			
			ReviewDao dao=new ReviewDao();
			ArrayList<ReviewVo> list=dao.reviewlist(id,startRow,endRow);
			int pageCount = (int)Math.ceil(dao.getCount(id)/10.0);
			int startPageNum=(pageNum-1)/10*10+1;
			int endPageNum=startPageNum+9;
			if(endPageNum>pageCount) {
				endPageNum=pageCount;
			}
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("startPageNum", startPageNum);
			req.setAttribute("endPageNum", endPageNum);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("list",list);
			req.getRequestDispatcher("/shoppinginfo/reviewlist.jsp").forward(req, resp);
		}
	}
}
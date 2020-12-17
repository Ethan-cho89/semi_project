package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.ReviewDao;
import com.semi.domain.ReviewVo;

@WebServlet("/review/load")
public class ReviewLoadController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int inum = Integer.parseInt(req.getParameter("inum"));
		ReviewDao dao = ReviewDao.getDao();
		int avgRate = dao.aveRate(inum);
		ArrayList<ReviewVo> list = dao.reviews(inum);
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.print("<start>"); // 전체를 감싸는 태그가 없으면 못읽음
		pw.print("<avgrate>"+avgRate+"</avgrate>");

		for(ReviewVo vo : list) {
			pw.print("<review>");
			pw.print("<inum>"+vo.getInum()+"</inum>");
			pw.print("<iname>"+vo.getIname()+"</iname>");
			pw.print("<id>"+vo.getId()+"</id>");
			pw.print("<rate>"+vo.getRate()+"</rate>");
			pw.print("<content>"+vo.getContent()+"</content>");
			pw.print("<regdate>"+vo.getRegdate()+"</regdate>");
			pw.print("</review>");
		}
		pw.print("</start>");
		
		
	}
}

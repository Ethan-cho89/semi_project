package com.semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.QnaDao;

@WebServlet("/qna/delete")
public class QnaDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		QnaDao dao = QnaDao.getDao();
		int n =dao.delete(num);
		
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/qna/list");
		}else {
			req.setAttribute("code", "fail");
			req.setAttribute("errMsg", "ERROR CODE:'0002' 관리자에게 문의해주세요");
			req.getRequestDispatcher("/coupon/result.jsp").forward(req, resp);
		}
	}
}

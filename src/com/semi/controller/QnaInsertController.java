package com.semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.QnaDao;
import com.semi.domain.QnaVo;

@WebServlet("/qna/insert")
public class QnaInsertController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/qna/insert.jsp");
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String writer= req.getParameter("writer");
		String pwd= req.getParameter("pwd");
		String type= req.getParameter("type");
		String contents= req.getParameter("contents");
		String title= req.getParameter("title");
		QnaVo vo = new QnaVo(0, writer, pwd, type, contents, null, null, title,null);
		QnaDao dao = QnaDao.getDao();
		int n = dao.insert(vo);
		
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/qna/list");
		}else {
			req.setAttribute("code", "fail");
			req.setAttribute("errMsg", "ERROR CODE:'0000' 관리자에게 문의해주세요");
			req.getRequestDispatcher("/coupon/result.jsp").forward(req, resp);
		}
	}
}

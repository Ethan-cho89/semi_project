package com.semi.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.QnaDao;
import com.semi.domain.QnaVo;

@WebServlet("/qna/edit")
public class QnaEditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int n =Integer.parseInt(req.getParameter("num"));
		QnaDao dao = QnaDao.getDao();
		QnaVo vo  = dao.load(n);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/qna/edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(req.getParameter("num"));
		String writer = req.getParameter("writer");
		String pwd = req.getParameter("pwd");
		String type = req.getParameter("type");
		String contents = req.getParameter("contents");
		String title = req.getParameter("title");
		String answer = req.getParameter("answer");
		
		QnaDao dao = QnaDao.getDao();
		int n = 0;
		if(answer!=null) {
			n = dao.edit(num, answer);
		}else {
			QnaVo vo = new QnaVo(num, writer, pwd, type, contents, null, null, title, null);
			n = dao.edit(vo);
		}
		if(n>0) {
			req.setAttribute("code", "success");
		}else {
			req.setAttribute("code", "fail");
		}
		req.getRequestDispatcher("/qna/result.jsp").forward(req, resp);
	}
}

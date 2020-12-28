package com.semi.controller.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.semi.dao.ReviewDao;

@WebServlet("/review/delete")
public class ReviewDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rnum = Integer.parseInt(req.getParameter("rnum"));

		ReviewDao dao = ReviewDao.getDao();

		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/plain;charset=utf-8");
		JsonObject json = new JsonObject();
		if (dao.delete(rnum)) {
			json.addProperty("code", "ok");
		} else {
			json.addProperty("code", "error");
		}
		
		PrintWriter pw = resp.getWriter();
		pw.print(json.toString());
	}
}

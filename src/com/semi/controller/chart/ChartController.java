package com.semi.controller.chart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.dao.ChartDao;
import com.semi.domain.ChartVo;
import com.semi.service.ChartServie;
import com.semi.service.ChartServieImpl;

@WebServlet("/admin/chart")
public class ChartController extends HttpServlet{
	
	ChartServie service;
	
	@Override
	public void init() throws ServletException {
		service = ChartServieImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String col = req.getParameter("col");
		
		List<ChartVo> list = service.getList(col);
		Gson gson = new Gson();
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter pw = resp.getWriter();
		
		pw.write(gson.toJson(list));
	}
}

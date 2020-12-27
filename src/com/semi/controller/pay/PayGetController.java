package com.semi.controller.pay;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.domain.CartVo;

@WebServlet("/itemboard/pay")
public class PayGetController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Gson gson = new Gson();
		String json = req.getParameter("json");
				
		List<CartVo> list = new ArrayList<CartVo>(Arrays.asList(gson.fromJson(json, CartVo[].class)));
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/itemboard/pay.jsp").forward(req, resp);
	}
}

package com.semi.controller.Item;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.semi.domain.CartVo;
import com.semi.util.CartUtil;
import com.semi.util.CookieUtil;

@WebServlet("/itemboard/buy")
public class ItemBuyController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<CartVo> list = CartUtil.getSelectedSizes(req);

		req.setAttribute("list", list);

		req.getRequestDispatcher("/itemboard/pay.jsp").forward(req, resp);
	}
}

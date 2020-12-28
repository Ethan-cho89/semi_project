package com.semi.controller.cart;

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

@WebServlet("/itemboard/addcart")
public class CartAddCartController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<CartVo> newList = CartUtil.getSelectedSizes(req);
		
		List<CartVo> oldList = CookieUtil.getCartData(req);
		
		if(oldList!=null)
			newList.addAll(oldList);
		
		Gson gson = new Gson();
		String jsonStr = URLEncoder.encode(gson.toJson(newList), "UTF-8");
		
		Cookie cookie = new Cookie("cart",jsonStr);
		
		resp.addCookie(cookie);
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/plain;charset=utf-8");
		
		JsonObject json = new  JsonObject();
		json.addProperty("code", "ok");
		
		PrintWriter pw = resp.getWriter();
		pw.print(json.toString());
	}
	
}

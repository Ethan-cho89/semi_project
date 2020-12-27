package com.semi.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.domain.CartVo;
import com.semi.util.CookieUtil;

@WebServlet("/itemboard/cartDel")
public class CartDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Gson gson = new Gson();
		
		CartVo vo = gson.fromJson(req.getParameter("item"), CartVo.class);
		List<CartVo> list =CookieUtil.getCartData(req);
		
		for(int i=0 ; i < list.size() ; i++) {
			if(list.get(i).equals(vo)) {
				list.remove(i);
				break;
			}
		}
		
		resp.addCookie(CookieUtil.toCookie(gson.toJson(list)));
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		pw.write(gson.toJson(list));
		
	}
}

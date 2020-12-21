package com.semi.controller.Item;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
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

@WebServlet("/itemboard/addcart")
public class ItemAddCartController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<CartVo> list = getSelectedSizes(req);
		
		Gson gson = new Gson();
		String jsonStr = URLEncoder.encode(gson.toJson(list), "UTF-8");
		
		//URLDecoder.decode("cart", "UTF-8");
		
		
		Cookie cookie = new Cookie("cart",jsonStr);
		
		resp.addCookie(cookie);
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/plain;charset=utf-8");
		
		JsonObject json = new  JsonObject();
		json.addProperty("code", "ok");
		
		PrintWriter pw = resp.getWriter();
		pw.print(json.toString());
	}
	
	private List<CartVo> getSelectedSizes(HttpServletRequest req){
		List<CartVo> list = new ArrayList<CartVo>();
		int inum = Integer.parseInt(req.getParameter("num"));
		int price = Integer.parseInt(req.getParameter("price"));
		
		Iterator<String> iter =req.getParameterNames().asIterator();
		
		while(iter.hasNext()) {
			String name = iter.next();
			if(name.equals("S")||name.equals("M")||name.equals("L")||name.equals("XL")) {
				int cnt = Integer.parseInt(req.getParameterValues(name)[0]);
				int snum = Integer.parseInt(req.getParameterValues(name)[1]);
				list.add(new CartVo(inum, snum, cnt, price));
			}
		}
		
		return list;
	}
}

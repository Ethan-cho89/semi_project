package com.semi.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.domain.CartVo;
import com.semi.service.PhotoService;
import com.semi.service.PhotoServiceImpl;
import com.semi.util.CookieUtil;

@WebServlet("/itemboard/cartList")
public class CartListController extends HttpServlet{
	
	PhotoService service;
	
	@Override
	public void init() throws ServletException {
		service = PhotoServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<CartVo> list = CookieUtil.getCartData(req);
		
		if(list!=null) {
			for(CartVo vo : list) {
				vo.setPhotoList(service.getList(vo.getInum()));
			}
			
		}
		
		Gson gson = new Gson(); 
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		pw.write(gson.toJson(list));
		
	}
	
}

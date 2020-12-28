package com.semi.controller.pay;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.semi.dao.AddressDao;
import com.semi.domain.AddressVo;

@WebServlet("/pay/getAddr")
public class GetAddressController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String) req.getSession().getAttribute("id");
		
		AddressDao dao = AddressDao.getDao();
		List<AddressVo> list =  dao.list(id);
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/plain;charset=utf-8");
		Gson gson = new Gson();	
		
		PrintWriter pw = resp.getWriter();
		pw.print(gson.toJson(list));
	}
}

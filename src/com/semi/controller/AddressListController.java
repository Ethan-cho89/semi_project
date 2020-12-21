package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.JsonObject;
import com.semi.dao.AddressDao;
import com.semi.domain.AddressVo;

@WebServlet("/address/list")
public class AddressListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/address/list.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = (String)req.getSession().getAttribute("id");
		AddressDao dao = AddressDao.getDao();
		ArrayList<AddressVo> list =  dao.list(id);
		
		
		JSONArray arr = new JSONArray();
		if(list.isEmpty()) {
			JSONObject json = new JSONObject();
			json.put("check", false);
			arr.put(json);
		}else {
			for(AddressVo vo : list) {
				JSONObject json = new JSONObject();
				json.put("num",vo.getNum());
				json.put("isDefault",vo.getIsDefault());
				json.put("name",vo.getName());
				json.put("address",vo.getAddress());
				arr.put(json);
			}
		}
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.print(arr.toString());
	}
}

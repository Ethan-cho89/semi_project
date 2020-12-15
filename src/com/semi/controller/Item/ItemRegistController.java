package com.semi.controller.Item;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.domain.ItemVo;
import com.semi.domain.PhotoVo;
import com.semi.service.ItemBoardService;
import com.semi.service.ItemBoardServiceImpl;

@WebServlet("/itemboard/regist")
public class ItemRegistController extends HttpServlet {
	
	private ItemBoardService service;
	
	@Override
	public void init() throws ServletException {
		service =ItemBoardServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(req.getParameter("editordata"));
		
	}
	
}

package com.semi.controller.Item;

import java.io.IOException;
import java.io.PrintWriter;
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String type = req.getParameter("type");
		int price = Integer.parseInt(req.getParameter("price"));
		int gender = Integer.parseInt(req.getParameter("gender"));
		int szieS = Integer.parseInt(req.getParameter("sizeS"));
		int sizeM = Integer.parseInt(req.getParameter("sizeM"));
		int sizeL = Integer.parseInt(req.getParameter("sizeL"));
		int sizeXL = Integer.parseInt(req.getParameter("sizeXL"));
		String editordata = req.getParameter("editordata");
		String[] urls = req.getParameterValues("img");
		
		ItemVo vo = new ItemVo(0,name,type,price,editordata,0,0,gender);
		
		int key = service.addAndGetKey(vo);
		
		
		
		resp.sendRedirect("/itemboard/list?gender="+gender);
	
	}
	
}

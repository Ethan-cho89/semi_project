package com.semi.controller.Item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.domain.ItemVo;
import com.semi.domain.PhotoVo;
import com.semi.service.ItemBoardService;
import com.semi.service.ItemBoardServiceImpl;

@WebServlet("/itemboard/get")
public class ItemGetController extends HttpServlet {
	
	private ItemBoardService service;
	
	@Override
	public void init() throws ServletException {
		service =ItemBoardServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num= Integer.parseInt(req.getParameter("num"));
		ItemVo vo = service.get(num);
		
		req.setAttribute("vo",vo);
		req.setAttribute("cnt", vo.getPhotoList().size());
		
		
		req.getRequestDispatcher("/itemboard/get.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}

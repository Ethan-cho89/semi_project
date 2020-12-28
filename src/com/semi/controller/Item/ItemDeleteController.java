package com.semi.controller.Item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.service.ItemBoardService;
import com.semi.service.ItemBoardServiceImpl;
import com.semi.service.PhotoService;
import com.semi.service.PhotoServiceImpl;
import com.semi.service.StockService;
import com.semi.service.StockServiceImpl;

@WebServlet("/itemboard/delete")
public class ItemDeleteController extends HttpServlet {
	
	private ItemBoardService itemService;
	private StockService stockService;
	private PhotoService photoService;
	
	@Override
	public void init() throws ServletException {
		itemService =ItemBoardServiceImpl.getInstance();
		stockService = StockServiceImpl.getInstance();
		photoService =PhotoServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num= Integer.parseInt(req.getParameter("num"));
		
		photoService.delete(req.getServletContext(),num);

		itemService.delete(num);
		
		resp.sendRedirect("/itemboard/list?gender=0");
	}
	
}

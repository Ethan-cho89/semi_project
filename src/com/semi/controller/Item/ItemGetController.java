package com.semi.controller.Item;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.domain.ItemVo;
import com.semi.domain.StockVo;
import com.semi.service.ItemBoardService;
import com.semi.service.ItemBoardServiceImpl;
import com.semi.service.PhotoService;
import com.semi.service.PhotoServiceImpl;
import com.semi.service.StockService;
import com.semi.service.StockServiceImpl;

@WebServlet("/itemboard/get")
public class ItemGetController extends HttpServlet {
	
	private ItemBoardService itemService;
	private StockService stockService;
	
	@Override
	public void init() throws ServletException {
		itemService =ItemBoardServiceImpl.getInstance();
		stockService = StockServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num= Integer.parseInt(req.getParameter("num"));
		ItemVo vo = itemService.get(num);
		req.setAttribute("vo",vo);
		
		Map<String, StockVo> map = stockService.getItemStock(num);
		for(String str : map.keySet()) {
			StockVo stockVo = map.get(str);
			if(stockVo.getCount()>0)
				req.setAttribute(str, stockVo);
		}
		
		req.getRequestDispatcher("/itemboard/get.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}

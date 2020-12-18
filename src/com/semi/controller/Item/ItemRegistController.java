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
import com.semi.service.PhotoService;
import com.semi.service.PhotoServiceImpl;
import com.semi.service.StockService;
import com.semi.service.StockServiceImpl;

@WebServlet("/itemboard/regist")
public class ItemRegistController extends HttpServlet {
	
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String type = req.getParameter("type");
		int price = Integer.parseInt(req.getParameter("price"));
		int gender = Integer.parseInt(req.getParameter("gender"));
		String editordata = req.getParameter("editordata");
		
		ItemVo vo = new ItemVo(0,name,type,price,editordata,0,0,gender);
		
		int key = itemService.addAndGetKey(vo);
		
		int sizeS = Integer.parseInt(req.getParameter("sizeS"));
		int sizeM = Integer.parseInt(req.getParameter("sizeM"));
		int sizeL = Integer.parseInt(req.getParameter("sizeL"));
		int sizeXL = Integer.parseInt(req.getParameter("sizeXL"));
		
		stockService.add(key,sizeS,sizeM,sizeL,sizeXL);

		String[] urls = req.getParameterValues("img");
		
		photoService.add(req.getServletContext(),key, urls);
		
		resp.sendRedirect("/itemboard/list?gender="+gender);
	
	}
	
}

package com.semi.controller.Item;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.ItemDao;
import com.semi.domain.ItemVo;
import com.semi.service.ItemBoardService;
import com.semi.service.ItemBoardServiceImpl;
import com.semi.service.PhotoService;
import com.semi.service.PhotoServiceImpl;
import com.semi.service.StockService;
import com.semi.service.StockServiceImpl;

@WebServlet("/itemboard/list")
public class ItemListController extends HttpServlet{
	private ItemBoardService itemService;
	private PhotoService photoService;
	
	@Override
	public void init() throws ServletException {
		itemService =ItemBoardServiceImpl.getInstance();
		photoService =PhotoServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int gender = Integer.parseInt(req.getParameter("gender"));
		
		List<ItemVo> list = itemService.getList(gender);
		
		for(ItemVo vo : list) {
			vo.setPhotoList(photoService.getList(vo.getNum()));
		}
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/itemboard/list.jsp").forward(req, resp);
	}
}

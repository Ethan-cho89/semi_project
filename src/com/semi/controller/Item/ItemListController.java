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

@WebServlet("/itemboard/list")
public class ItemListController extends HttpServlet{
	private ItemBoardService service;
	
	@Override
	public void init() throws ServletException {
		service = ItemBoardServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ItemVo> list = service.getList();
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/itemboard/list.jsp").forward(req, resp);
	}
}

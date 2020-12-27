package com.semi.controller.Item;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.ItemDao;
import com.semi.domain.Criteria;
import com.semi.domain.ItemVo;
import com.semi.domain.PageMaker;
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
		
		Criteria  cri = getCriteria(req);
		
		List<ItemVo> list = itemService.getListWithKeyWord(cri);
		
		for(ItemVo vo : list) {
			vo.setPhotoList(photoService.getList(vo.getNum()));
		}
		
		req.setAttribute("list", list);
		
		req.setAttribute("pageMaker",new PageMaker(cri, itemService.getTotal(cri)));
		
		req.getRequestDispatcher("/itemboard/list.jsp").forward(req, resp);
	}
	
	private Criteria getCriteria(HttpServletRequest req){
		Criteria cri = new Criteria();
		
		cri.setAmount(req.getParameter("amount"));
		cri.setPageNum(req.getParameter("pageNum"));
		cri.setType(req.getParameter("type"));
		cri.setGender(req.getParameter("gender"));
		cri.setKeyword(req.getParameter("keyword"));
		cri.setSize(req.getParameterValues("size"));
		
		return cri;
	}
}

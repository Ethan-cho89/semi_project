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

@WebServlet("/itemboard/update")
public class ItemUpdateController extends HttpServlet {
	
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
		ItemVo vo = itemService.get(num);
		
		vo.setPhotoList(photoService.getList(num));
		
		req.setAttribute("vo",vo);
		
		Map<String, StockVo> map = stockService.getItemStock(num);
		
		for(String str : map.keySet()) {
			req.setAttribute(str, map.get(str).getCount());
		}
		
		req.getRequestDispatcher("/itemboard/update.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num= Integer.parseInt(req.getParameter("num"));
		String name = req.getParameter("name");
		String type = req.getParameter("type");
		int price = Integer.parseInt(req.getParameter("price"));
		int gender = Integer.parseInt(req.getParameter("gender"));
		String editordata = req.getParameter("editordata");
		
		ItemVo vo = new ItemVo(num,name,type,price,editordata,0,0,gender);
		
		itemService.modify(vo);
		
		int sizeS = Integer.parseInt(req.getParameter("sizeS"));
		int sizeM = Integer.parseInt(req.getParameter("sizeM"));
		int sizeL = Integer.parseInt(req.getParameter("sizeL"));
		int sizeXL = Integer.parseInt(req.getParameter("sizeXL"));
		
		stockService.modify(num, sizeS,sizeM,sizeL,sizeXL);
		
		photoService.deleteWithOutFile(num);
		
		String[] urls = req.getParameterValues("img");
		
		photoService.add(req.getServletContext(),num, urls);
		
		resp.sendRedirect("/itemboard/get?num="+num);
	}
}

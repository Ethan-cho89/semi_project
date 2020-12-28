package com.semi.controller.pay;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.PayDao;
import com.semi.domain.CartVo;

@WebServlet("/pay/insert")
public class PayInsertController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String) req.getSession().getAttribute("id");
		if(id==null) {
			id="vc";
		}
		PayDao dao = PayDao.getInstance();
		
		int size = Integer.parseInt(req.getParameter("size"));
		int dcrate = Integer.parseInt(req.getParameter("dcrate"));
		int adadNum = Integer.parseInt(req.getParameter("adNum"));
		
		List<CartVo> list =getItems(req, size);
		
		int cnum =Integer.parseInt(req.getParameter("cnum"));
		
		int adNum =Integer.parseInt(req.getParameter("adNum"));
		String reN = req.getParameter("rN");
		String reP = req.getParameter("rP");
		String oderM = req.getParameter("oderM");
		String oderP = req.getParameter("oderP");
		int cnt = 0;
		for(CartVo vo : list) {
			cnt += dao.addOrder(vo, id, adNum, cnum, dcrate);
		}
		
		
		resp.sendRedirect("/home.jsp");
	}
	
	private List<CartVo> getItems(HttpServletRequest req,int size) {
		List<CartVo> list = new ArrayList<CartVo>();
		
		for(int i = 0 ; i < size ; i++) {
			CartVo vo = new CartVo();
			vo.setSnum(Integer.parseInt(req.getParameterValues("snum")[i]));
			vo.setCount(Integer.parseInt(req.getParameterValues("cnt")[i]));
			vo.setPrice(Integer.parseInt(req.getParameterValues("price")[i]));
			list.add(vo);
		}
		return list;
	}
	
}

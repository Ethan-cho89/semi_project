package com.semi.util;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.semi.domain.CartVo;

public class CookieUtil {
	
	private static List<CartVo> getCartList(String json){
		try {
			json = URLDecoder.decode(json, "UTF-8");
			Gson gson = new Gson();
			
			return new ArrayList<CartVo>(Arrays.asList(gson.fromJson(json, CartVo[].class)));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	public  static List<CartVo> getCartData(HttpServletRequest req) {
		for(Cookie co : req.getCookies()) {
			if(co.getName().equals("cart")) {
				return getCartList(co.getValue());
			}
		}
		
		return null;
	}

	public static Cookie toCookie(String json) {
		try {
			return new Cookie("cart",URLEncoder.encode(json, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}

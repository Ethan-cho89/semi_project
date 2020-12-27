package com.semi.util;

import java.io.UnsupportedEncodingException;

import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;

import com.google.gson.Gson;
import com.semi.domain.CartVo;

public class GetCartFromCookie {
	public static List<CartVo> getCartList(String json){
		try {
			json = URLDecoder.decode(json, "UTF-8");
			Gson gson = new Gson();
			
			return Arrays.asList(gson.fromJson(json, CartVo[].class));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}

package com.semi.controller.Item;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/itemboard/upload")
public class ImageUploadController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uploadPath = "/upload/";
		
		Calendar cal = Calendar.getInstance();
		
		String saveDir=req.getServletContext().getRealPath(uploadPath);
		
		MultipartRequest mr=new MultipartRequest(
				req,// request객체
				saveDir, //업로드할 디렉토리 경로
				1024*1024*5,//최대업로드할 바이트수크기
				"utf-8", //인코딩방식
				new DefaultFileRenamePolicy() //동일한 파일명 존재시 중복되지 않는
				//파일명을 생성하기 위한 객체-동일한 파일명이 업로드되면 파일명뒤에 1,2,..등에
				//해당하는 숫자를 붙여서 파일을 생성한다.
			);
		
		System.out.println(saveDir+mr.getFilesystemName("file"));
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/plain;charset=utf-8");
		
		JsonObject json = new  JsonObject();
		json.addProperty("url","/upload/"+mr.getFilesystemName("file"));
		
		PrintWriter pw = resp.getWriter();
		pw.print(json.toString());
	}
}

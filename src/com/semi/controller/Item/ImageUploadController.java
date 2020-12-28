package com.semi.controller.Item;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

@WebServlet("/itemboard/upload")
public class ImageUploadController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uploadPath = "/upload/temp";
		
		//uploadPath += getFolder();
		
		File uploadFolderPath = new File(req.getServletContext().getRealPath(uploadPath));
		
		if(!uploadFolderPath.exists()) {
			uploadFolderPath.mkdirs();
		}
		
		String saveDir=req.getServletContext().getRealPath(uploadPath);
		
		MultipartRequest mr=new MultipartRequest(
				req,// request객체
				saveDir, //업로드할 디렉토리 경로
				1024*1024*5,//최대업로드할 바이트수크기
				"utf-8", //인코딩방식
				new FileRenamePolicy() {
					@Override
					public File rename(File f) {
						String name= f.getName();
						String path = f.getParent();
						UUID uuid = UUID.randomUUID();
						name = uuid.toString()+"_"+name;
						f = new File(path,name);
						return f;
					}
				}
			);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/plain;charset=utf-8");
		
		JsonObject json = new  JsonObject();
		json.addProperty("url",uploadPath+"/"+mr.getFilesystemName("file"));
		
		PrintWriter pw = resp.getWriter();
		pw.print(json.toString());
	}
	
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str;
	}
}

package com.semi.task;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.semi.domain.PhotoVo;
import com.semi.service.PhotoServiceImpl;

public class ImageFileWatchJob implements Job {

	@Override
	public void execute(JobExecutionContext jc) throws JobExecutionException {
		deleteFile(jc.getMergedJobDataMap().getString("root"));
	}

	public void deleteFile(String root) {
		String rootPath = "/upload/";
		String tempPath = "/upload/temp";

		List<PhotoVo> list = PhotoServiceImpl.getInstance().getAllList();
		System.out.println(root);
		File f = new File(root+rootPath);

		for (File folder : f.listFiles()) {
			if (!folder.getName().equals("temp") && folder.isDirectory()) {
				for (File tempFile : folder.listFiles()) {
					boolean flag = false;
					for (PhotoVo vo : list) {
						if (vo.getName().equals(tempFile.getName())) {
							flag = true;
						}
					}
					if (!flag) {
						System.out.println(tempFile.getAbsolutePath());
						tempFile.delete();
					}
				}
				
				if(folder.listFiles().length<1) {
					folder.delete();
				}
			}
		}

		f = new File(root+tempPath);
		
		for (File ff : f.listFiles()) {
			System.out.println(ff.getAbsolutePath());
			ff.delete();
		}
		
	}
}

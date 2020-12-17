package com.semi.task;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class ImageFileWatchJob implements Job{

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		String root = "/upload/";
		System.out.println("ImageFileWatchJob");
	}
	
}

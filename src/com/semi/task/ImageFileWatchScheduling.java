package com.semi.task;

import java.text.ParseException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.impl.JobDetailImpl;
import org.quartz.impl.StdScheduler;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.impl.triggers.CronTriggerImpl;
import org.quartz.impl.triggers.SimpleTriggerImpl;

public class ImageFileWatchScheduling extends HttpServlet{
	Scheduler scheduler ;
	@Override
	public void init() throws ServletException {
		
		try {
			scheduler = new StdSchedulerFactory().getScheduler();
			scheduler.start();
			
			JobDataMap map = new JobDataMap();
			map.put("root",getServletContext().getRealPath(""));
			
			JobDetail detail = JobBuilder.newJob(ImageFileWatchJob.class).setJobData(map).withIdentity("job", Scheduler.DEFAULT_GROUP).build();
//			Trigger trigger = new CronTriggerImpl("trigger",Scheduler.DEFAULT_GROUP,"0 0 12 * * ?");
			Trigger trigger = new CronTriggerImpl("trigger",Scheduler.DEFAULT_GROUP,"0 0 0 * * ?");
			
			scheduler.scheduleJob(detail,trigger);
			
			System.out.println("start");
			
		}catch (SchedulerException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void destroy() {
		try {
			scheduler.shutdown(true);
			System.out.println("종료");
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

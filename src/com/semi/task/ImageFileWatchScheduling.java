package com.semi.task;

import java.text.ParseException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.quartz.JobDetail;
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

	@Override
	public void init() throws ServletException {
		try {
			Scheduler scheduler = new StdSchedulerFactory().getScheduler();
			scheduler.start();
			
			JobDetail detail = new JobDetailImpl("ImageFileWatch",Scheduler.DEFAULT_GROUP,ImageFileWatchJob.class);
			
//			Trigger trigger = new CronTriggerImpl("trigger",Scheduler.DEFAULT_GROUP,"0 0 12 * * ?");
			Trigger trigger = new CronTriggerImpl("trigger",Scheduler.DEFAULT_GROUP,"1 20 * * * ?");
			
			scheduler.scheduleJob(detail,trigger);
			
			System.out.println("start");
			
		}catch (SchedulerException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

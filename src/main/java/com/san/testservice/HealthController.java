package com.san.testservice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {

	
	
	Logger logger = LoggerFactory.getLogger(HealthController.class);

	@RequestMapping(value = "/health1")
	public String health() {
		logger.info("Health Check Request is recieved  bu santosh health1 ");
		System.out.println("Health Check Request is recieved");
		
		return "ok " ;
	}


@RequestMapping(value = "/health2")
	public String health2() {
		logger.info("Health Check Request is recieved  by santosh health 2");
		System.out.println("Health Check Request is recieved");
		
		return "ok " ;
	}

@RequestMapping(value = "/health2")
	public String health3() {
		logger.info("Health Check Request is recieved by santosh heakth3");
		System.out.println("Health Check Request is recieved");
		
		return "ok " ;
	}




}

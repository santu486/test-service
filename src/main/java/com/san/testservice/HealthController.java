package com.example.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {

	@Value("${name}")
	private String name;
	
	Logger logger = LoggerFactory.getLogger(HealthController.class);

	@RequestMapping(value = "/health")
	public String health() {
		logger.info("Health Check Request is recieved");
		System.out.println("Health Check Request is recieved");
		
		return "ok " + name;
	}

}

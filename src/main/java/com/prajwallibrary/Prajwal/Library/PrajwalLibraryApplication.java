package com.prajwallibrary.Prajwal.Library;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class PrajwalLibraryApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder app) { 
	  return app.sources(PrajwalLibraryApplication.class); 
	}	
	
	public static void main(String[] args) {
		SpringApplication.run(PrajwalLibraryApplication.class, args);
	}

}

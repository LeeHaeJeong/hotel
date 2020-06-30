package com.hotel.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hotel.mapper.HotelMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MapperTest {
	
	@Setter(onMethod_= {@Autowired})
	HotelMapper mapper;
	
	@Test
	public void joTest() {
		mapper.getCheck("single");
	}
	
	

}

package com.hotel.service;

import java.util.List;

import com.hotel.VO.HotelVO;

public interface HotelService {
	

	public List<HotelVO> getCheckService(String room) ;
	
	public void insertCheckService(HotelVO hotel);

}

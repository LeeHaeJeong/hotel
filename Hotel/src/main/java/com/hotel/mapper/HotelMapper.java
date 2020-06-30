package com.hotel.mapper;

import java.util.List;


import com.hotel.VO.HotelVO;


public interface HotelMapper {
	
	public List<HotelVO> getCheck(String room) ;
	public void insertCheck(HotelVO hotel);
}

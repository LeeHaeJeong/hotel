package com.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.VO.HotelVO;
import com.hotel.mapper.HotelMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;


@Service
@AllArgsConstructor
public class HotelServiceImpl  implements HotelService {

	@Setter(onMethod_= {@Autowired})
	private HotelMapper hmapper;
	

	@Override
	public List<HotelVO> getCheckService(String room) {
		
		return hmapper.getCheck(room);
	}


	@Override
	public void insertCheckService(HotelVO hotel) {
		hmapper.insertCheck(hotel);
		
	}

}

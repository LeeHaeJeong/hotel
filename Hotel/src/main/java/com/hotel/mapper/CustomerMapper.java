package com.hotel.mapper;

import java.util.List;
import java.util.Map;

import com.hotel.VO.CriteriaVO;
import com.hotel.VO.CustomerVO;

public interface CustomerMapper {
	public List<CustomerVO> getList();
		
	List<Map<String, Object>> selectBoardList(CriteriaVO cri);
	
	public CustomerVO getId(Long id);

	public int update(CustomerVO customer);

	public int delete(Long id);

	public void insert(CustomerVO customer);


	
}
package com.hotel.service;

import java.util.List;
import java.util.Map;

import com.hotel.VO.CriteriaVO;
import com.hotel.VO.CustomerVO;

public interface CustomerService {
	
	public List<CustomerVO> getList();
	
	List<Map<String, Object>> selectBoardList(CriteriaVO cri);

	public CustomerVO getId(Long id);

	public boolean update(CustomerVO cutomer);

	public boolean delete(Long id);
	
	public void insert(CustomerVO cutomer);
}
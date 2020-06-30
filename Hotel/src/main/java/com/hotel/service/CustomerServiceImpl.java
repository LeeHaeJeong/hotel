package com.hotel.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.VO.CriteriaVO;
import com.hotel.VO.CustomerVO;
import com.hotel.mapper.CustomerMapper;

import lombok.Setter;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Setter(onMethod_= {@Autowired} )
	private CustomerMapper customer;

	@Override
	public List<CustomerVO> getList() {
		return customer.getList();
	}

	@Override
	public List<Map<String, Object>> selectBoardList(CriteriaVO cri) {
		
		return customer.selectBoardList(cri);
	}

	@Override
	public CustomerVO getId(Long id) {
		return customer.getId(id);
	}

	@Override
	public boolean update(CustomerVO cus) {
		return customer.update(cus) == 1;
		
	}

	@Override
	public boolean delete(Long id) {
		// TODO Auto-generated method stub
		return customer.delete(id) ==1;
	}

	@Override
	public void insert(CustomerVO cus) {
		customer.insert(cus);
		
	}


	

}
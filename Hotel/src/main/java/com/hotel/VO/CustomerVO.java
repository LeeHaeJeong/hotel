package com.hotel.VO;

import java.time.LocalDateTime;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CustomerVO {
	
	private Long id;
	
	private String name;
	
	private String phone_number;
	
	private String address;
	
	private String content;
	
	private String title;
	
	private LocalDateTime modified;
	
	private LocalDateTime last_modified;
	
}
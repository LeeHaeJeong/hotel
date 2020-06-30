package com.hotel.VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	
	
	private String user_name ;
	private int number_of_people; 
	private int check_in_use ;
	private int check_in_out ;
	
}

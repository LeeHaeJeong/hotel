package com.hotel.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.protobuf.TextFormat.ParseException;
import com.hotel.VO.CriteriaVO;
import com.hotel.VO.CustomerVO;
import com.hotel.VO.HotelVO;
import com.hotel.VO.PageMakerVO;
import com.hotel.service.CustomerService;
import com.hotel.service.HotelService;

import lombok.Setter;

@Controller
@RequestMapping("/hotel/*")
public class HotelController {
	
	@Autowired
	private CustomerService customerService;
	
	@Setter(onMethod_= {@Autowired})
	private HotelService hservice;
	
	@RequestMapping("/index")
	public String index(Model model) {
		
		String m ="index";
		model.addAttribute("m",m);
		return "hotel/index";
	}
	
	@GetMapping("/reservation")
	public void getReservation(Model model, String room,@RequestParam("text") String text) {
		if (room.equals("single") || room.equals("double") || room.equals("twin") || room.equals("triple")
				|| room.equals("suite") || room.equals("connecting")) {
		
		String m ="reservation";

		model.addAttribute("name",room);	// 이미지 Key값
		model.addAttribute("m",m);			// 네브바 Key값
		model.addAttribute("text",text);	// 설명 Key값
		model.addAttribute("roomName",room);	//방 이름 Key값
		
		}else { //방 이름이 잘못되었을 경우 접근 거부용 <- jsp파일에서 c:if로 사용
			boolean noName = true;
			model.addAttribute("noName", noName); 
		} //else
		 
	}//get 종료
	
	@PostMapping("/reservation")
	public void postReservation(Model model, @RequestParam("start") String chin, @RequestParam("end") 
		String chout,String room, @RequestParam String text) throws java.text.ParseException {
				
		String m ="reservation";	//nav-bar 조건용 값
		
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");	//날짜 포멧 설정
		Date in = form.parse(chin);		//체크인  자료형 Date로 변경
		Date out = form.parse(chout);	//체크아웃  자료형 Date로 변경

		HotelVO hotel = new HotelVO();	//HoteVO 객체 생성
		hotel.setRoom(room);			
		hotel.setCheckIn(in);
		hotel.setCheckOut(out);
		hservice.insertCheckService(hotel); // DB에 체크인, 체크아웃 저장

		List<HotelVO> checking = new ArrayList<HotelVO>();	//HotelVO List 생성 
		checking = hservice.getCheckService(room);	// DB에서 방 이름을 조건으로 체크인과 체크아웃 값 가져오기
		model.addAttribute("text",text);		//설명 Key값
		model.addAttribute("chk", checking);	//체크인, 체크아웃 Key값 ( 예약된 날짜 비활성화용 )
		model.addAttribute("roomName", room);	//방 이름 Key값
		model.addAttribute("name",room);		//이미지 Key값
		model.addAttribute("m",m);				//nav-bar Key값
		
	}//post 종료
	
	
	
	@GetMapping("/list")
	public ModelAndView openBoardList(CriteriaVO cri) throws Exception {
		String m ="list";    
	    ModelAndView mav = new ModelAndView("/hotel/list");	        
	        
	    List<Map<String,Object>> list = customerService.selectBoardList(cri);
	    mav.addObject("list", list);
	    mav.addObject("m",m);
	        
	    PageMakerVO pageMaker = new PageMakerVO();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(100);
	    mav.addObject("pageMaker", pageMaker);
	    return mav;	        
	}
	
	@GetMapping("/insert")
	public void insert() {
		
	}
	
	@PostMapping("/insert")
	public String hotelinsert(CustomerVO customer) {
		customerService.insert(customer);
		return "redirect:/hotel/list";
	}	
	    
    @RequestMapping(value="/update")
    public void boardUpdatePOST(@RequestParam("id") String id,Model model) throws Exception {
      
        Long a=Long.parseLong(id);
        model.addAttribute("detail",customerService.getId(a));
    }
    
    @PostMapping("/update")
    public String update(CustomerVO customer) {
    	
    	customerService.update(customer);
    	System.out.println(customerService.update(customer));
    	return "redirect:/hotel/list";
    }
    @PostMapping("/remove")
    public String delete(@RequestParam("id") Long id) {
    	customerService.delete(id);
    	return"redirect:/hotel/list";
    }
	    
}


package com.hotel.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
	private CustomerService customer;
	
	@Setter(onMethod_= {@Autowired})
	private HotelService hservice;
	
	@RequestMapping("/index")
	public String index(Model model) {
		
		String m ="index";
		model.addAttribute("m",m);
		return "hotel/index";
	}
	
	@GetMapping("/reservation")
	public String getReservation(Model model, String room,@RequestParam("text") String text) {
		String m ="reservation";
		String namearr[] = {"single","double","twin","triple","connecting","suite"};
		System.out.println("여기에 도대체 무엇이 들어오나"+room);
		if(room.equals("single")) {
			model.addAttribute("name",namearr[0]);
		}
		if(room.equals("double")) {
			model.addAttribute("name",namearr[1]);
		}
		if(room.equals("twin")) {
			model.addAttribute("name",namearr[2]);
		}
		if(room.equals("triple")) {
			model.addAttribute("name",namearr[3]);
		}
		if(room.equals("connecting")) {
			model.addAttribute("name",namearr[4]);
		}
		if(room.equals("suite")) {
			model.addAttribute("name",namearr[5]);
		}
		
		model.addAttribute("m",m);
		model.addAttribute("text",text);
		List<HotelVO> checking = new ArrayList<HotelVO>();
		
		String inEmpty ;
		String outEmpty ;
		if(hservice.getCheckService(room).equals(null)){
			inEmpty = "비어있습니다";
			outEmpty = "비어있습니다";
			model.addAttribute("chIn", inEmpty);
			model.addAttribute("chOut", outEmpty);
		}else {
			checking =hservice.getCheckService(room);
			model.addAttribute("chk", checking);
			
		}
		model.addAttribute("roomName",room);
		return "hotel/reservation";
	}
	
	@PostMapping("/reservation")
	public String postReservation(Model model,@RequestParam("checkIn") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date checkIn, 
            @RequestParam("checkOut") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date checkOut,@RequestParam String room, @RequestParam String text) throws ParseException {

		model.addAttribute("text",text);
		HotelVO hotel = new HotelVO();
		System.out.println("체크인 시간 원본 : "+checkOut);
		System.out.println("체크인 시간 Date 버전 : " +checkIn);
		//HttpServletRequest 로 받아온 값을 HotelVO로 저장하여 DB에 추가
		hotel.setRoom("single");
		hotel.setCheckIn(checkIn);
		hotel.setCheckOut(checkOut);
		hservice.insertCheckService(hotel);
		
		List<HotelVO> checking = new ArrayList<HotelVO>();
		checking =hservice.getCheckService(room);
		checking.forEach(i->System.out.println("여기 방 예약의 목록:" + i.getRoom()));
		System.out.println("test !!!");
		model.addAttribute("chk", checking);
		model.addAttribute("roomName",room);
		return "hotel/reservation";//조회 화면으로 이동해야 함
		
	}
	
	@GetMapping("/list")
	public ModelAndView openBoardList(CriteriaVO cri) throws Exception {
	        
	    ModelAndView mav = new ModelAndView("/hotel/list");	        
	    PageMakerVO pageMaker = new PageMakerVO();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(100);
	        
	    List<Map<String,Object>> list = customer.selectBoardList(cri);
	    mav.addObject("list", list);
	    mav.addObject("pageMaker", pageMaker);
	        
	    return mav;
	        
	}
	@GetMapping("/insert")
	public void insert() {
		
	}
	@PostMapping("/insert")
	public String hotelinsert(CustomerVO cutomer) {
		customer.insert(cutomer);
		return "redirect:/hotel/list";
	}	
	    
    @RequestMapping(value="/update")
    public void boardUpdatePOST(@RequestParam("id") String id,Model model) throws Exception {
      
        Long a=Long.parseLong(id);
        model.addAttribute("detail",customer.getId(a));
    }
    
    @PostMapping("/update")
    public String update(CustomerVO cutomer) {
    	
    	customer.update(cutomer);
    	System.out.println(customer.update(cutomer));
    	return "redirect:/hotel/list";
    }
    @PostMapping("/remove")
    public String delete(@RequestParam("id") Long id) {
    	customer.delete(id);
    	return"redirect:/hotel/list";
    }
	    
}

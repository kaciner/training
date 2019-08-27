package training.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import training.po.Repair;
import training.po.Room;
import training.po.Student;
import training.service.RoomService;
import training.utils.Page;

//寝室管理控制类
@Controller
public class RoomController {
	//依赖注入
	@Autowired
	private RoomService roomService;
	//寝室列表
	@RequestMapping(value = "/room/list")
	public String list(@RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="10")Integer rows,String build,String number,String sex,String status,Model model,HttpSession session){
		Page<Room> rooms = roomService.findRoomList(page, rows, build, number, sex, status);
		model.addAttribute("page",rooms);
		model.addAttribute("build",build);
		model.addAttribute("number",number);
		model.addAttribute("sex",sex);
		model.addAttribute("status",status);
		return "home";
	}
	@RequestMapping(value = "/room/list2")
	public String list2(HttpServletRequest request, @RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="10")Integer rows,String build,String number,String sex,String status,Model model,HttpSession session){
		Page<Room> rooms = roomService.findRoomList(page, rows, build, number, sex, status);
		model.addAttribute("page",rooms);
		model.addAttribute("build",build);
		model.addAttribute("number",number);
		model.addAttribute("sex",sex);
		model.addAttribute("status",status);
		return "admin";
	}
	
	@RequestMapping(value = "/room/add")
	@ResponseBody
	public String addRoom(Room room,HttpSession session){
		int rows = roomService.addRoom(room);
		if(rows > 0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
	
	@RequestMapping(value = "/room/findRoomById")
	@ResponseBody
	public Room findRoomById(Integer id){
		Room room = roomService.findRoomById(id);
		return room;
	}
	
	@RequestMapping(value = "/room/updateRoom")
	@ResponseBody
	public String updateRoom(Room room){
		int rows = roomService.updateRoom(room);
		if(rows > 0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
	
	@RequestMapping(value = "/room/deleteRoom")
	@ResponseBody
	public String deleteRoom(Integer id){
		int rows = roomService.deleteRoom(id);
		if(rows > 0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
	
	@RequestMapping(value = "/room/selectStudent")
	@ResponseBody
	public Student selectStudent(Integer id){
		Student student = roomService.selectStudent(id);
		return student;
	}
	
	@RequestMapping(value = "/room/selectRepair")
	@ResponseBody
	public Repair selectRepair(Integer id){
		Repair repair = roomService.selectRepair(id);
		return repair;
	}
}

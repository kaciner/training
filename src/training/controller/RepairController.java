package training.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import training.po.Repair;
import training.service.RepairService;
import training.utils.Page;

//管理控制类
@Controller
public class RepairController {
	//依赖注入
	@Autowired
	private RepairService repairService;
	//列表
	@RequestMapping(value = "/repair")
	public String repair(@RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="10")Integer rows,String description,String date,Integer roomid,Model model,HttpSession session){
		Page<Repair> repairs = repairService.selectRepairList(description, date, roomid,page, rows);
		model.addAttribute("page",repairs);
		model.addAttribute("description",description);
		model.addAttribute("date",date);
		model.addAttribute("roomid",roomid);
		return "repair";
	}
	
	
	@RequestMapping(value = "/repair2")
	public String repair2(@RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="10")Integer rows,String description,String date,Integer roomid,Model model,HttpSession session){
		Page<Repair> repairs = repairService.selectRepairList(description, date, roomid,page, rows);
		model.addAttribute("page",repairs);
		model.addAttribute("description",description);
		model.addAttribute("date",date);
		model.addAttribute("roomid",roomid);
		return "repair2";
	}
	
	@RequestMapping(value = "/repair/findRepairByRoomid")
	@ResponseBody
	public Repair findRepairByRoomid(Integer roomid){
		Repair repair = repairService.findRepairByRoomid(roomid);
		return repair;
	}
	
	@RequestMapping(value = "/repair/add")
	@ResponseBody
	public String addRepair(Repair repair,HttpSession session){
		int rows = repairService.addRepair(repair);
		if(rows > 0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
	
	
	@RequestMapping(value = "/repair/updateRepair")
	@ResponseBody
	public String updateRepair(Repair repair){
		int rows = repairService.updateRepair(repair);
		if(rows > 0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
	
	@RequestMapping(value = "/repair/deleteRepair")
	@ResponseBody
	public String deleteRepair(Integer roomid){
		int rows = repairService.deleteRepair(roomid);
		if(rows > 0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
}

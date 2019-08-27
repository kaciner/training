package training.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import training.po.Admin;
import training.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@RequestMapping(value = "/admin", method=RequestMethod.POST)
	public String login(String adminname,String adminpassword,Model model,HttpSession session){
		//查询管理员
		Admin admin = adminService.findAdmin(adminname, adminpassword);
		if (admin!=null){
			session.setAttribute("AdminSession", admin);
			return "redirect:room/list2";
		}
		model.addAttribute("msg","账号或密码错误，请重新输入！");
		return "login";
		}
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/adminlogout")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:/admin";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}
	
}

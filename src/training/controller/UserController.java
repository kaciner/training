package training.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import training.po.User;
import training.service.UserService;
import training.utils.Page;

@Controller
public class UserController{
	
	@Autowired
	private UserService userService;
	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/user", method=RequestMethod.POST)
	public String login(String name,String password,Model model,HttpSession session){
		//查询用户
		User user = userService.findUser(name, password);
		if(user != null){
		//将用户对象添加到Session
		session.setAttribute("UserSession",user);
		return "redirect:room/list";
		}	
		model.addAttribute("msg","账号或密码错误，请重新输入！");
		return "login";
	}		

		/**
		 * 退出登录
		 */
		@RequestMapping(value = "/logout")
		public String logout(HttpSession session) {
		    // 清除Session
		    session.invalidate();
		    // 重定向到登录页面的跳转方法
		    return "redirect:/user";
		}
		/**
		 * 向用户登陆页面跳转
		 */
		@RequestMapping(value = "/user", method = RequestMethod.GET)
		public String toLogin() {
		    return "login";
		}
		
		//用户注册
		@RequestMapping("/register")
		public String userRegist(HttpServletRequest request,HttpServletResponse response ,HttpSession session,String name,String password,Model model) throws Exception{
			
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8 ");
				
				String res = userService.addUser(name, password);
				
				if(res.equals("Regist_success")){
					session = request.getSession();
					return "login";// 重新定向网页到home
					
				}else if(res.equals("Regist_Failed")){
					request.setAttribute("msg", "注册失败");
					return "register";
				}else {
					request.setAttribute("msg", "注册失败");
					return "register";
				}
		}	
		//用户注册
				@RequestMapping("/showregister")
				public String showregister() {
					return "register";
				}
		//用户管理
				@RequestMapping(value = "/userManage")
				public String userManage(@RequestParam(defaultValue="1") Integer page,
					@RequestParam(defaultValue="10")Integer rows,String name,String password,Model model,HttpSession session){
						Page<User> users = userService.findUserList(page, rows,name,password);
						model.addAttribute("page",users);
						model.addAttribute("name",name);
						model.addAttribute("password",password);
				    return "user";
				}
				
				@RequestMapping(value = "/userManage/findUserByName")
				@ResponseBody
				public User findUserByName(String name){
					User user = userService.findUserByName(name);
					return user;
				}
				
				@RequestMapping(value = "/userManage/updateUser")
				public String updateUser(User user){
					int rows = userService.updateUser(user);
					if(rows > 0){
						return "OK";
					}else{
						return "FAIL";
					}
				}
				@RequestMapping(value = "/userManage/deleteUser")
				@ResponseBody
				public String deleteUser(String  name){
					int rows = userService.deleteUser(name);
					if(rows > 0){
						return "OK";
					}else{
						return "FAIL";
					}
				}
}


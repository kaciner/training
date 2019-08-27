package training.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import training.po.Student;
import training.service.StudentService;
import training.utils.Page;

@Controller
public class StudentController {
	@Autowired 
	private StudentService studentService;
	@RequestMapping(value = "/student")
	public String student(@RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="10")Integer rows,String id, String name, String major, String grade,Integer roomid,Model model,HttpSession session){
		Page<Student> students = studentService.selectStudentList(id, name, major, grade, roomid,page, rows);
		model.addAttribute("page",students);
		model.addAttribute("id",id);
		model.addAttribute("name",name);
		model.addAttribute("major",major);
		model.addAttribute("grade",grade);
		model.addAttribute("roomid",roomid);
		return "Student";
	}
	@RequestMapping(value = "/student2")
	public String student2(@RequestParam(defaultValue="1") Integer page,
			@RequestParam(defaultValue="10")Integer rows,String id, String name, String major, String grade,Integer roomid,Model model,HttpSession session){
		Page<Student> students = studentService.selectStudentList(id, name, major, grade,roomid, page, rows);
		model.addAttribute("page",students);
		model.addAttribute("id",id);
		model.addAttribute("name",name);
		model.addAttribute("major",major);
		model.addAttribute("grade",grade);
		model.addAttribute("roomid",roomid);
		return "Student2";
	}
	
	@RequestMapping(value = "/student/findStudentById")
	@ResponseBody
	public Student selectStudentById(String id){
		Student student = studentService.selectStudentById(id);
		return student;
	}
	
	@RequestMapping(value = "/student2/findStudentById")
	@ResponseBody
	public Student selectStudentById2(String id){
		Student student = studentService.selectStudentById(id);
		return student;
	}
	
	@RequestMapping(value = "/student2/add")
	@ResponseBody
	public String addStudent(Student student,HttpSession session){
		int rows = studentService.addStudent(student);
		if(rows > 0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
	
	
	@RequestMapping(value = "/student2/updatestudent")
	@ResponseBody
	public String updateStudent(Student student){
		int rows = studentService.updateStudent(student);
		if(rows > 0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
	
	@RequestMapping(value = "/student2/deletestudent")
	@ResponseBody
	public String deleteStudent(String id){
		int rows = studentService.deleteStudent(id);
		if(rows > 0){
			return "OK";
		}else{
			return "FAIL";
		}
	}
}

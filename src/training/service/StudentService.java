package training.service;

import training.po.Student;
import training.utils.Page;

public interface StudentService {
	
	public Page<Student> selectStudentList(String id,String name,String major,String grade,Integer roomid,Integer page, Integer rows);
	
	public Student selectStudentById(String id);
			
	public int addStudent(Student student);
	
	public int updateStudent(Student student);
	
	public int deleteStudent(String id);
}

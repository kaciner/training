package training.dao;

import java.util.List;

import training.po.Student;

public interface StudentDao {

		public List<Student> selectStudentList(Student student);

		public Student selectStudentById(String id);
		
		public Integer selectStudentListCount(Student student);
				
		public int addStudent(Student student);
		
		public int updateStudent(Student student);
		
		public int deleteStudent(String id);
		
		
}

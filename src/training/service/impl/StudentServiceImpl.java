package training.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import training.dao.StudentDao;
import training.po.Student;
import training.service.StudentService;
import training.utils.Page;

//房间管理
@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	private StudentDao studentDao;
	@Override
	public Page<Student> selectStudentList(String id, String name, String major, String grade,Integer roomid,Integer page, Integer rows) {
		Student student = new Student();
		//判断
				if(StringUtils.isNotBlank(id)){
					student.setId(id);
				}
				if(StringUtils.isNotBlank(name)){
					student.setName(name);
				}
				if(StringUtils.isNotBlank(major)){
					student.setMajor(major);
				}
				if(StringUtils.isNotBlank(grade)){
					student.setGrade(grade);
				}
				//当前页
				student.setStart((page-1) * rows);
				//每页数
				student.setRows(rows);
				//查询学生列表
				List<Student> students = studentDao.selectStudentList(student);
				//创建Page返回对象
				Page<Student> result = new Page<>();
				result.setPage(page);
				result.setRows(students);
				result.setSize(rows);
				result.setTotal(0);
				return result;
				
		}

	@Override
	public Student selectStudentById(String id) {
		Student student = studentDao.selectStudentById(id);
		return student;
	}

	@Override
	public int addStudent(Student student) {
		return studentDao.addStudent(student);
	}

	@Override
	public int updateStudent(Student student) {
		return studentDao.updateStudent(student);
	}

	@Override
	public int deleteStudent(String id) {
		return studentDao.deleteStudent(id);
	}

}

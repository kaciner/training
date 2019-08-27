package training.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import training.dao.UserDao;
import training.po.User;
import training.service.UserService;
import training.utils.Page;


@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	@Override
	public User findUser(String name, String password) {
		User user = this.userDao.findUser(name, password);
		return user;
	}
	@Override
	public Page<User> findUserList(Integer page,Integer rows,String name,String password) {
		User user = new User();
		//判断
		if(StringUtils.isNotBlank(name)){
			user.setName(name);
		}
		if(StringUtils.isNotBlank(password)){
			user.setPassword(password);
		}
		//当前页
		user.setStart((page-1) * rows);
		//每页数
		user.setRows(rows);
		//查询寝室列表
		List<User> users = userDao.selectUserList(user);
		//查询寝室列表总记录数
		Integer count = userDao.selectUserListCount(user);
		//创建Page返回对象
		Page<User> result = new Page<>();
		result.setPage(page);
		result.setRows(users);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	@Override
	public String addUser(String name, String password){

			int res =userDao.addUser(name,password);

			if(res==1){

				return "Regist_success";

			}else{
				return "Regist_Failed";

			}
	}
	@Override
	public int updateUser(User user){
		return userDao.updateUser(user);
	}
	@Override
	public int deleteUser(String name){
		return userDao.deleteUser(name);
	}
	@Override
	public User findUserByName(String name){
			User user = userDao.findUserByName(name);
			return user;
	}
}
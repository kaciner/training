package training.service;

import training.po.User;
import training.utils.Page;

public interface UserService {
		public User findUser(String name,String password);
		public String addUser(String name, String password);
		
		public Page<User> findUserList(Integer page,Integer rows,String name,String password);
		
		public int updateUser(User user);
		
		public int deleteUser(String name);
		
		public User findUserByName(String name);
}

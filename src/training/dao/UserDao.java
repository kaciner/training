package training.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import training.po.User;

@Repository("userDao")
public interface UserDao {
	public User findUser(@Param("name")String name,
						@Param("password") String password);
          
	  public int addUser(@Param("name")String name, @Param("password")String password);
	  
	  public List<User> selectUserList(User user);
		//寝室数
		public Integer selectUserListCount(User user);
	  
	  public User findUserByName(String name);

	  public int updateUser(User user);

	  public int deleteUser(String name);
}








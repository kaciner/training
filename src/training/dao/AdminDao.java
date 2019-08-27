package training.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import training.po.Admin;

@Repository("AdminDao")
public interface AdminDao {
	

		public Admin findAdmin(@Param("adminname")String adminname,
							@Param("adminpassword") String adminpassword);

}

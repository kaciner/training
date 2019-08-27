package training.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import training.dao.AdminDao;
import training.po.Admin;
import training.service.AdminService;


@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;
	@Override
	public Admin findAdmin(String adminname, String adminpassword) {
		Admin admin = this.adminDao.findAdmin(adminname, adminpassword);
		return admin;
	}

}

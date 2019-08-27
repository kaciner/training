package training.service;

import training.po.Admin;


public interface AdminService {
	public Admin findAdmin(String adminname,String adminpassword);
}

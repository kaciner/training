package training.service;

import training.po.Repair;
import training.utils.Page;


public interface RepairService {
	public Page<Repair> selectRepairList(String description,String date,Integer roomid,Integer page, Integer rows);
	//新建客户列表
	public int addRepair(Repair repair);
	
	public int updateRepair(Repair repair);
	
	public int deleteRepair(Integer roomid);
	
	public Repair findRepairByRoomid(Integer roomid);
}

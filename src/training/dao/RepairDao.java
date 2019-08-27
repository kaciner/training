package training.dao;

import java.util.List;

import training.po.Repair;

public interface RepairDao {

	public List<Repair> selectRepairList(Repair repair);
	
	public Integer selectRepairListCount(Repair repair);
	
	public Repair findRepairByRoomid(Integer roomid);
	
	public int addRepair(Repair repair);
	
	public int updateRepair(Repair repair);
	
	public int deleteRepair(Integer roomid);
	
}

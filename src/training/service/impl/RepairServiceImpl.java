package training.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import training.dao.RepairDao;
import training.po.Repair;
import training.service.RepairService;
import training.utils.Page;

//报修管理
@Service("repairService")
@Transactional
public class RepairServiceImpl implements RepairService{
	//声明Dao属性并注入
	@Autowired
	private RepairDao repairDao;
	@Override
	public Page<Repair> selectRepairList(String description,String date,Integer roomid,Integer page, Integer rows) {
		Repair repair = new Repair();
		//判断
		if(StringUtils.isNotBlank(description)){
			repair.setDescription(description);
		}
		if(StringUtils.isNotBlank(date)){
			repair.setDate(date);
		}
		//当前页
		repair.setStart((page-1) * rows);
		//每页数
		repair.setRows(rows);
		//查询报修列表
		List<Repair> repairs = repairDao.selectRepairList(repair);
		//查询报修列表总记录数
		Integer count = repairDao. selectRepairListCount(repair);
		//创建Page返回对象
		Page<Repair> result = new Page<>();
		result.setPage(page);
		result.setRows(repairs);
		result.setSize(rows);
	    result.setTotal(count);
		return result;
	}
	//创建
	@Override
	public int addRepair(Repair repair){
		return repairDao.addRepair(repair);
	}
	//更新
	@Override
	public int updateRepair(Repair repair){
		return repairDao.updateRepair(repair);
	}
	//删除
	@Override
	public int deleteRepair(Integer roomid){
		return repairDao.deleteRepair(roomid);
	}
	
	@Override
	public Repair findRepairByRoomid(Integer roomid){
		Repair repair = repairDao.findRepairByRoomid(roomid);
		return repair;
	}
}

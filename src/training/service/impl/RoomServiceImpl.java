package training.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import training.dao.RoomDao;
import training.po.Repair;
import training.po.Room;
import training.po.Student;
import training.service.RoomService;
import training.utils.Page;

//寝室管理
@Service("roomService")
@Transactional
public class RoomServiceImpl implements RoomService{
	//声明Dao属性并注入
	@Autowired
	private RoomDao roomDao;
	@Override
	public Page<Room> findRoomList(Integer page, Integer rows, String build, String number, String sex, String status) {
		Room room = new Room();
		//判断
		if(StringUtils.isNotBlank(build)){
			room.setBuild(build);
		}
		if(StringUtils.isNotBlank(number)){
			room.setNumber(number);
		}
		if(StringUtils.isNotBlank(sex)){
			room.setSex(sex);
		}
		if(StringUtils.isNotBlank(status)){
			room.setStatus(status);
		}
		//当前页
		room.setStart((page-1) * rows);
		//每页数
		room.setRows(rows);
		//查询寝室列表
		List<Room> rooms = roomDao.selectRoomList(room);
		//查询寝室列表总记录数
		Integer count = roomDao.selectRoomListCount(room);
		//创建Page返回对象
		Page<Room> result = new Page<>();
		result.setPage(page);
		result.setRows(rooms);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	//创建寝室
	@Override
	public int addRoom(Room room){
		return roomDao.addRoom(room);
	}
	//更新寝室
	@Override
	public int updateRoom(Room room){
		return roomDao.updateRoom(room);
	}
	//删除寝室
	@Override
	public int deleteRoom(Integer id){
		return roomDao.deleteRoom(id);
	}
	
	@Override
	public Room findRoomById(Integer id){
		Room room = roomDao.findRoomById(id);
		return room;
	}
	
	public Student selectStudent(int id) {
		Student student = roomDao.selectStudent(id);
		return student;
	}
	
	public Repair selectRepair(int id){
		Repair repair = roomDao.selectRepair(id);
		return repair;
	}
}

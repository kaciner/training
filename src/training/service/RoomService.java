package training.service;

import training.po.Repair;
import training.po.Room;
import training.po.Student;
import training.utils.Page;

public interface RoomService {
	//查询客户列表
	public Page<Room> findRoomList(Integer page,Integer rows,String build,String number,String sex,String status);
	//新建客户列表
	public int addRoom(Room room);
	
	public int updateRoom(Room room);
	
	public int deleteRoom(Integer id);
	
	public Room findRoomById(Integer id);
	
	public Student selectStudent(int id);
	
	public Repair selectRepair(int id);
}

package training.dao;

import java.util.List;

import training.po.Repair;
import training.po.Room;
import training.po.Student;


public interface RoomDao {
	//寝室列表
	public List<Room> selectRoomList(Room room);
	//寝室数
	public Integer selectRoomListCount(Room room);
	
	public Room findRoomById(int id);
	
	public int addRoom(Room room);
	
	public int updateRoom(Room room);
	
	public int deleteRoom(Integer id);
	
	public Student selectStudent(int id);
	
	public Repair selectRepair(int id);
}

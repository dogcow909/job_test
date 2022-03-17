package work_test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import work_test.dto.EmpDTO;
import work_test.dto.StartEnd;

@Repository
public class EmpDAO {
	
	@Autowired
	private SqlSession ss;
	
	public List<EmpDTO> selectAll(int startNo, int endNo, String searchBy, String keyword) {
		StartEnd se = new StartEnd(startNo, endNo, searchBy, keyword);
		return ss.selectList("empMapper.selectAll", se);
	}
	
	public int isExistid(String id_no) {
		return ss.selectOne("empMapper.isExistid", id_no);
	}
	
	public int getTotal(StartEnd se) {
		return ss.selectOne("empMapper.getTotal", se);
	}
	
	public EmpDTO selectOne(int no) {
		return ss.selectOne("empMapper.selectOne", no);
	}
	public void insertEmp(EmpDTO dto) {
		ss.insert("empMapper.insertEmp", dto);
	}
	
	public void modifyEmp(EmpDTO dto) {
		ss.update("empMapper.updateEmp", dto);
	}
	
	public void deleteEmp(int no) {
		ss.delete("empMapper.deleteEmp", no);
	}
	
	

}

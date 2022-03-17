package work_test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import work_test.dao.EmpDAO;
import work_test.dto.EmpDTO;
import work_test.dto.StartEnd;

@Service
public class EmpService {
	
	@Autowired
	EmpDAO dao;
	
	public List<EmpDTO> selectAll(int startNo, int endNo, String searchBy, String keyword){
		return dao.selectAll(startNo, endNo, searchBy, keyword);
	}
	
	public int isIdExist(String id_no) {
		return dao.isExistid(id_no);
	}
	public int getTotal(StartEnd se) {
		return dao.getTotal(se);
	}
	
	public void insertEmp(EmpDTO dto) {
		dao.insertEmp(dto);
	}
	
	public EmpDTO selectOne(int no) {
		return dao.selectOne(no);
	}
	
	public void modifyEmp(EmpDTO dto) {
		dao.modifyEmp(dto);
	}
	
	public void deleteEmp(int no) {
		dao.deleteEmp(no);
	}

}

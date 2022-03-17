package work_test.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import work_test.dao.EmpDAO;
import work_test.dto.EmpDTO;
import work_test.dto.PageUtil;
import work_test.dto.StartEnd;
import work_test.service.EmpService;

@Controller
@Slf4j
public class EmpController {

	public static final String IMG_PATH = "C:\\uploadImg\\";

	@Autowired
	EmpService service;

	@RequestMapping("/empList")
	public String getList(Model model, @RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(name = "searchBy", defaultValue = "") String searchBy,
			@RequestParam(name = "keyword", defaultValue = "") String keyword, StartEnd se) {
		
		// 총 게시물 수
		int totalNumber = service.getTotal(se);

		// 한 페이지당 게시물 수 : 5
		int countPage = 5;

		// 페이지 계산 객체
		Map<String, Object> map = PageUtil.getPageData(totalNumber, countPage, currentPage);
		model.addAttribute("map", map);

		int startNo = (int) map.get("startNo");
		int endNo = (int) map.get("endNo");

		log.info("startNo=====>" + startNo);
		log.info("endNo=====>" + endNo);
		log.info("endNo=====>" + searchBy);
		log.info("endNo=====>" + keyword);

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchBy", searchBy);
		model.addAttribute("keyword", keyword);
		model.addAttribute("empDTO", service.selectAll(startNo, endNo, searchBy, keyword));

		return "empList";
	}

	@RequestMapping("/addEmp")
	public String addEmp() {
		return "addEmp";
	}

	@RequestMapping("/insertEmp")
	public String insertEmp(@RequestParam String ename_kr, @RequestParam String ename_en, @RequestParam String ename_ch,
			@RequestParam String id_no1, @RequestParam String id_no2, @RequestParam String birth1,
			@RequestParam String birth2, @RequestParam String birth3, @RequestParam String birth_cat,
			@RequestParam String gender, @RequestParam String married, @RequestParam String work_year,
			@RequestParam String sal_cat, @RequestParam String job_cat, @RequestParam String employ_cat,
			@RequestParam String emp_addrs, @RequestParam String emp_mp1, @RequestParam String emp_mp2,
			@RequestParam String emp_mp3, @RequestParam String emp_email, @RequestParam String skill_grade,
			@RequestParam String alcohol,
			@RequestPart(value = "uploadFile", required = false) MultipartFile multiPart) {

		EmpDTO dto = new EmpDTO();
		log.info("multipartFile===>" + multiPart);

		// 파일 확장자 가져오기
		String prefix = multiPart.getOriginalFilename().substring(multiPart.getOriginalFilename().lastIndexOf(".") + 1,
				multiPart.getOriginalFilename().length());
		// 저장될 랜덤 파일명
		String fileName = UUID.randomUUID().toString() + "." + prefix;
		// 저장경로
		String pathName = IMG_PATH + fileName;

		if (multiPart == null || multiPart.isEmpty()) {
			dto.setImg_name("none");
			dto.setSys_img_name("none");
		} else {
			File file = new File(pathName);
			try {
				multiPart.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		dto.setEname_kr(ename_kr);
		dto.setEname_en(ename_en);
		dto.setEname_ch(ename_ch);
		dto.setId_no(id_no1 + "-" + id_no2);
		dto.setBirth(birth1 + birth2 + birth3);
		dto.setGender(gender);
		dto.setMarried(married);
		dto.setSal_cat(sal_cat);
		dto.setJob_cat(job_cat);
		dto.setEmploy_cat(employ_cat);
		dto.setEmp_addrs(emp_addrs);
		dto.setEmp_mp(emp_mp1 + "-" + emp_mp2 + "-" + emp_mp3);
		dto.setEmp_email(emp_email);
		dto.setSkill_grade(skill_grade);
		dto.setAlcohol(alcohol);
		dto.setWork_year(Integer.parseInt(work_year));
		dto.setBirth_cat(birth_cat);
		dto.setImg_name(multiPart.getOriginalFilename());
		dto.setSys_img_name(fileName);

		service.insertEmp(dto);

		return "redirect:/empList";
	}

	@GetMapping("/modifyEmp")
	public String modifyEmp(@RequestParam int emp_no, Model model) {
		EmpDTO dto = service.selectOne(emp_no);
		log.info("addrs===>"+dto.getEmp_addrs());
		model.addAttribute("empDto", service.selectOne(emp_no));
		return "modifyEmp";
	}

	@PostMapping("/modifyEmp")
	public String modifyDone(@RequestParam int emp_no, @RequestParam String ename_kr, @RequestParam String ename_en,
			@RequestParam String ename_ch, @RequestParam String id_no1, @RequestParam String id_no2,
			@RequestParam String birth1, @RequestParam String birth2, @RequestParam String birth3,
			@RequestParam String birth_cat, @RequestParam String gender, @RequestParam String married,
			@RequestParam String work_year, @RequestParam String sal_cat, @RequestParam String job_cat,
			@RequestParam String employ_cat, @RequestParam String emp_addrs, @RequestParam String emp_mp1,
			@RequestParam String emp_mp2, @RequestParam String emp_mp3, @RequestParam String emp_email,
			@RequestParam String skill_grade, @RequestParam String alcohol, @RequestParam String sys_img_name, 
			@RequestPart(value = "uploadFile", required = false) MultipartFile multiPart) {

		EmpDTO dto = service.selectOne(emp_no);

		dto.setEname_kr(ename_kr);
		dto.setEname_en(ename_en);
		dto.setEname_ch(ename_ch);
		dto.setId_no(id_no1 + "-" + id_no2);
		dto.setBirth(birth1 + birth2 + birth3);
		dto.setGender(gender);
		dto.setMarried(married);
		dto.setSal_cat(sal_cat);
		dto.setJob_cat(job_cat);
		dto.setEmploy_cat(employ_cat);
		dto.setEmp_addrs(emp_addrs);
		dto.setEmp_mp(emp_mp1 + "-" + emp_mp2 + "-" + emp_mp3);
		dto.setEmp_email(emp_email);
		dto.setSkill_grade(skill_grade);
		dto.setAlcohol(alcohol);
		dto.setWork_year(Integer.parseInt(work_year));
		dto.setBirth_cat(birth_cat);
		
		log.info("multipart===>"+multiPart);
		
		// 변경 안할 경우
		if (multiPart == null || multiPart.isEmpty()) {
			dto.setImg_name(dto.getImg_name());
			dto.setSys_img_name(dto.getSys_img_name());
			
			// 파일 재첨부 했는지 확인
		} else if (multiPart.getOriginalFilename() != null || multiPart.getOriginalFilename() != "" ) {
			log.info("multipart===>"+multiPart);
			
			// 기존 파일 삭제
			new File(IMG_PATH+sys_img_name).delete();
			
			// 새 첨부파일 등록
			// 파일 확장자 가져오기
			String prefix = multiPart.getOriginalFilename().substring(multiPart.getOriginalFilename().lastIndexOf(".") + 1,
					multiPart.getOriginalFilename().length());
			// 저장될 랜덤 파일명
			String fileName = UUID.randomUUID().toString() + "." + prefix;
			// 저장경로
			String pathName = IMG_PATH + fileName;
			
			File file = new File(pathName);
			
			try {
				multiPart.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dto.setImg_name(multiPart.getOriginalFilename());
			dto.setSys_img_name(fileName);
			
		} 

		service.modifyEmp(dto);
		return "redirect:/empList";
	}

	
	@GetMapping("/deleteEmp")
	@ResponseBody
	public String deleteEmp(@RequestParam List<String> emp_no) {
		
		for (String list:emp_no) {
			
			EmpDTO dto =  service.selectOne(Integer.parseInt(list));
			
			// 이미지 파일 존재하면 삭제
			if(dto.getSys_img_name() != null || dto.getSys_img_name() != "") {
				new File(IMG_PATH+dto.getSys_img_name()).delete();
			}
			
			service.deleteEmp(Integer.parseInt(list));
		}
			
			return "success";
			}
	
	@GetMapping("/isExistId")
	@ResponseBody
	public boolean checkId(@RequestParam String input_id) {
		boolean result = false;
		
		if(service.isIdExist(input_id)>0) {
			result = true;
		}else {
			result = false;
		}
		
		log.info("input_id===>"+service.isIdExist(input_id));
		return result;
	}
	
	
}
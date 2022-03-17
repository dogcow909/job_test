package work_test.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EmpDTO {
	private int emp_no;
	private String ename_kr;
	private String ename_en;
	private String ename_ch;
	private String id_no;
	private String birth;
	private String gender;
	private String married;
	private String sal_cat;
	private String job_cat;
	private String employ_cat;
	private String emp_addrs;
	private String emp_mp;
	private String emp_email;
	private String skill_grade;
	private String alcohol;
	private int work_year;
	private String birth_cat;
	private String img_name;
	private String sys_img_name;

}

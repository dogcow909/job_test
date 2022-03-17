package work_test.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StartEnd {

	private int startNo;
	private int endNo;
	private String searchBy;
	private String keyword;
}

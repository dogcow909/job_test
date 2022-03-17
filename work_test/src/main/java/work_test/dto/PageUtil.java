package work_test.dto;

import java.util.HashMap;
import java.util.Map;

public class PageUtil {
	public static Map<String, Object> getPageData(int totalNumber, int countPage, int currentPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 총 페이지 수 
		int totalPage = (totalNumber%countPage==0)? totalNumber/countPage:totalNumber/countPage+1;
		
		
		// 현재 페이지의 게시물 시작번호
		int startNo = (currentPage-1)*countPage+1;
		
		// 현재 페이지의 게시물 끝번호
		int endNo = (currentPage)*countPage;
		
		// 시작 페이지 번호        
		int startPageNo = ((currentPage-1)/5)*5+1;
				
		// 끝 페이지 번호
		int endPageNo = startPageNo+5-1 <= totalPage? startPageNo+5-1 : totalPage;
		
		// 이전
		boolean prev = currentPage >=5? true:false;
		
		// 다음
		boolean next = currentPage+5 >= totalPage ? false:true;
		
		// 맵객체에 담기  
		map.put("totalPage" , totalPage);
		map.put("startNo" , startNo);
		map.put("endNo" , endNo);
		map.put("startPageNo" , startPageNo);
		map.put("endPageNo" , endPageNo);
		map.put("prev" , prev);
		map.put("next" , next);
		return map;
	}
}

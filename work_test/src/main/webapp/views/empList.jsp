<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="./resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/css/style.css?after">
<style type="text/css">
#submitB {
	background-color: white;
    border: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">

$(function(){
	checkAll();
	modifyData();
	deleteData();
});

/* 전체 데이터 선택 */
function checkAll() {
	$("#checkAll").on("click", function(){
		$('.checkOne').each(function(i) {
			$(this)[0].checked = $("#checkAll")[0].checked;
		})
	})
}

/* 사원정보 수정 */
function modifyData() {
	$('#modifyData').on('click', function(){
		
		console.log("aa");
		console.log($('.checkOne:checked')[0].value);
		if($('.checkOne:checked').length==0) {
			alert("선택된 데이터가 없습니다.");
		}else if($('.checkOne:checked').length>1) {
			alert("수정은 1데이터씩 가능합니다.")
		}else if($('.checkOne:checked').length==1) {
			document.getElementById('modifyForm').submit();
		}
	})
}

/* 사원정보 삭제 */
function deleteData() {
	var deleteList = [] ;
	
	$('#deleteOne').on('click', function(){
		if($('.checkOne:checked').length==0) {
			alert("선택된 데이터가 없습니다.");
		} else {
			$('.checkOne:checked').each(function(i){
				deleteList.push($(this).val());
				console.log($(this).val());
				console.log(deleteList);
			});
			
				if(confirm("정말 삭제하시겠습니까?") == true) {
					
					 $.ajax({
				          url: "./deleteEmp",
				          type: "GET",
				          traditional: true,
				          data: { emp_no : deleteList },
				          dataType: "text",
				          success: function (result) {
				            if (result == "success") {
				              alert("삭제 완료");
				              location.reload();
				              console.log(result);
				            }
				          },
				          error: function (xhr) {
				            console.log(xhr.status);
				          }
				        });
				}else{
					return;
				}
			}
	});
}
</script>
</head>
<body>

<div class="wholeContainer">
	<div class="leftSide">
	 	<jsp:include page="left.jsp"/>
	</div>
	<div class="main">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="${path }/image/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원조회</strong></td>
  </tr>
  <tr> 
    <td><table width="640" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="30" align="right">
    		<form action="./empList" method="get">
	            <select name="searchBy" class="INPUT">
	             	<option selected value="all" >::::: 전체 :::::</option>
	             	<option value="ename_kr" <c:if test="searchBy=='ename_kr'" >${selected }</c:if>>이름</option>
	             	<option value="gender" <c:if test="searchBy=='gender'" >${selected }</c:if>>성별</option>
	             	<option value="skill_grade" <c:if test="searchBy=='skill_grade'" >${selected }</c:if>>기술등급</option>
	             	
	            </select> 
	            <input name="keyword" type="text" class="INPUT"> 
	            <button type="submit" id="submitB"><img src="${path }/image/search.gif" width="65px" height="" border="0" align="absmiddle" /></button>
       		 </form>
            </td>
        </tr>
        <tr> 
          <td><table width="640" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="3" background="${path }/image/bar_bg1.gif"></td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="${path }/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#" id="modifyData">수정</a> <img src="${path }/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">인사기록카드</a> <img src="${path }/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">경력정보</a> <img src="${path }/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">근무정보</a> </td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="1" align="right" bgcolor="B1B1B1"></td>
              </tr>
              <tr> 
                <td>
				<!-------------------------  ����Ʈ ------------------------------>
                <form action="modifyEmp" method="get" id="modifyForm">
				<table width="640" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th><input type="checkbox"  id="checkAll" /></th>
						<th>이름</th>
						<th>주민번호</th>
						<th>성별</th>
						<th>기술등급</th>
						<th>상태</th>
						<th>근무</th>
					</tr>
                    <tr> 
                      <td colspan="7" background="${path }/image/line_bg.gif"></td>
                    </tr>
					<c:forEach var="empDto" items="${empDTO }">
                    <tr> 
                      <td width="35" height="20" align="center">
                      	<input type="checkbox" class="checkOne" name="emp_no" value="${empDto.emp_no }" />
                      </td>
                      <td width="85" align="center">${empDto.ename_kr }</td>
                      <td width="153" align="center">${empDto.id_no}</td>
                      <td width="91" align="center">${empDto.gender }</td>
                      <td width="91" align="center">${empDto.skill_grade }</td>
                      <td width="91" align="center">${empDto.employ_cat }</td>
                      <td width="94" align="center">${empDto.job_cat }</td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="${path }/image/line_bg.gif"></td>
                    </tr>
               	 	</c:forEach>    
                    <tr> 
                      <td height="35" colspan="7" align="center" style="padding-bottom:3">
	                     <a href="./empList?searchBy=${searchBy }&keyword=${keyword }&currentPage=1"><img src="${path }/image/prev.gif" width="22" height="15" border="0" align="absmiddle"></a>&nbsp;
		                 <ul class="pagenation">
		                      <li><a href="./empList?searchBy=${searchBy }&keyword=${keyword }&currentPage=<c:if test="${map.prev }">${currentPage-5 }</c:if> "><img src="${path }/image/pre.gif" width="42" height="15" border="0" align="absmiddle"></a></li>&nbsp; 
	                      	 <c:forEach var="no" begin="${map.startPageNo }" end="${map.endPageNo }">
	                      	 	<li class="page-no"><a href="./empList?searchBy=${searchBy }&keyword=${keyword }&currentPage=${no }">${no }</a></li>
	                      	 </c:forEach>
		                      <li><a href="./empList?searchBy=${searchBy }&keyword=${keyword }&currentPage=<c:if test="${map.next }">${currentPage+5 } </c:if>"><img src="${path }/image/next.gif" width="42" height="15" border="0" align="absmiddle"></a></li>&nbsp;
	                     </ul>   
	                     <a href="./empList?searchBy=${searchBy }&keyword=${keyword }&currentPage=${map.totalPage+1-(map.totalPage%5)}"><img src="${path }/image/next_.gif" width="22" height="15" border="0" align="absmiddle"></a>
                      </td>
                    </tr>
                  </table>
                  </form>
 				<!-------------------------  ����Ʈ ------------------------------>
				  </td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="1" align="right" bgcolor="B1B1B1"></td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="${path }/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#" id="deleteOne">삭제</a> <img src="${path }/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">인사기록카드</a> <img src="${path }/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">경력정보</a> <img src="${path }/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">근무정보</a> </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="3" background="${path }/image/bar_bg1.gif"></td>
        </tr>
      </table></td>
  </tr>
</table>
	</div>
</div>
</body>
</html>
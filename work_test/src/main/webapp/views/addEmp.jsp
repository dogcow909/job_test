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
#img_preview {
	height: 120px;
	width: 120px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	readImgFile();
	checkIdNo();
	addCheck();
	onlyCharName();
	getBirth();
	
	var get_result;
});

/* 이미지 미리보기 & 파일 확장자 검사 */
function readImgFile() {
	document.getElementById("uploadFile").onchange = function () {
		/* 확장자 검사 */
		var uploadFile = document.getElementById("uploadFile").value.slice(-3).toLowerCase();
		
		if(uploadFile != "jpg"){
			alert("JPG파일만 등록 가능합니다")
			document.getElementById("uploadFile").value = "";
		}
		
		/* 미리보기 */
	    var reader = new FileReader();
		
	    reader.onload = function (e) {
	        document.getElementById("img_preview").src = e.target.result;
	    };

	    reader.readAsDataURL(this.files[0]);
	};
}

/* 사원 정보 등록 버튼 클릭 시 확인 사항 */
function addCheck() {
	document.getElementById("addForm").onclick = function(){
		
			/* 문자만 허용 데이터 */
			var ename_kr = $.trim($('#ename_kr').val());
			var ename_en = $.trim($('#ename_en').val());
			var ename_ch = $.trim($('#ename_ch').val());
			var skill_grade = $.trim($('#skill_grade').val());
			
			/* 숫자만 허용 데이터 */
			var id_no = $.trim($('#id_no1').val()) + $.trim($('#id_no2').val());
			var birth = $.trim($('#birth1').val()) + $.trim($('#birth2').val()) + $.trim($('#birth3').val());
			var work_year = $.trim($('#work_year').val());
			var emp_mp = $.trim($('#emp_mp1').val()) + $.trim($('#emp_mp2').val()) + $.trim($('#emp_mp3').val());
			
			var char_chk = /[^a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣一[\u2e80-\u2eff\u31c0-\u31ef\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fbf\uf900-\ufaff]/;
			
			console.log("ddd");
			
			if (!isNaN(id_no) && !isNaN(birth) && !isNaN(work_year) && !isNaN(emp_mp) && 
				!char_chk.test(ename_kr) && !char_chk.test(ename_en) && !char_chk.test(ename_ch) && !char_chk.test(skill_grade) && !get_result) {
					
					if (confirm("등록 완료 하시겠습니까?")){
						document.getElementById('insertOk').submit();
						}else{
							return;
						}
				
				}if (char_chk.test(ename_kr) || char_chk.test(ename_en) || char_chk.test(ename_ch)) {
					alert("이름은 문자만 입력 가능합니다.");
				}if (isNaN(id_no)) {
					alert("주민번호는 숫자만 입력 가능합니다.");
				}if (isNaN(birth)) {
					alert("생일은 숫자만 입력 가능합니다.");
				}if (isNaN(work_year)) {
					alert("년차는 숫자만 입력 가능합니다.");
				}if (isNaN(emp_mp)) {
					alert("핸드폰 번호는 숫자만 입력 가능합니다.");
				}if (char_chk.test(skill_grade)) {
					alert("기술등급은 문자만 입력 가능합니다.");
				}if(get_result){
					alert("주민등록번호를 다시 확인해주세요");
				}
	}
}

/* 생일 자동입력 */
function getBirth() {
	document.getElementById('id_no2').onkeyup = function(){
		
		var id_no1 = $.trim($('#id_no1').val());
		var id_no2 = $.trim($('#id_no2').val());
		var get_year = null;
		
		if(id_no2.substr(0,1)==3 || id_no2.substr(0,1)==4 ){
			get_year = 20;
		}else{
			get_year = 19;
		}
		
		$('#birth1').attr('value', get_year + id_no1.substr(0,2));
		$('#birth2').attr('value', id_no1.substr(2,2));
		$('#birth3').attr('value', id_no1.substr(4,2));
		
		checkIdNo();
	}
}

/* 숫자 입력시 경고 */
function onlyCharName() {
	document.getElementById('ename_kr').onkeyup = function(e){
		var char_chk =  /[^a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣一[一-鿕]|[㐀-䶵]|[豈-龎]]/;
		
	 	if(char_chk.test($('#ename_kr').val())) {
	 		$('#name_blank')[0].style.display = "block";
	 	}else{
	 		$('#name_blank')[0].style.display = "none";
	 	}
	}
}


/* 주민번호 유효성 검사 */
function checkIdNo(){
	console.log("aseg");
	var id_no = $.trim($('#id_no1').val()) + "-" + $.trim($('#id_no2').val());
	
	
	$.ajax({
		url: "./isExistId",
		type: "GET",
		traditional: true,
		data: {input_id : id_no},
		dataTaype: "text",
		success: function(result){
			if(result)
			alert("동일한 주민등록번호가 등록되어있습니다");
			get_result = result;
		
		},
		error: function(xhr){
			console.log(xhr.status);
		}
	});
	return; 	
	
}


</script>
</head>
<body>

<div class="wholeContainer">
	<div class="leftSide">
	 	<jsp:include page="left.jsp"/>
	</div>
	<div class="main">
	<form action="./insertEmp" method="post" enctype="multipart/form-data" id="insertOk">
		<table width="640" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
		    <td width="640">&nbsp;</td>
		  </tr>
		  <tr> 
		    <td height="25"><img src="${path}/image/icon.gif" width="9" height="9" align="absmiddle"> 
		      <strong>사원 기본 정보 수정</strong></td>
		  </tr>
		  <tr> 
		    <td><table width="640" border="0" cellspacing="0" cellpadding="0">
		        <tr> 
		          <td height="15" align="left"><table width="640" border="0" cellspacing="0" cellpadding="0">
		              <tr> 
		                <td><table width="640" border="0" cellspacing="1" cellpadding="0">
		                    <tr> 
		                      <td height="2" background="${path}/image/bar_bg1.gif"></td>
		                    </tr>
		                    <tr align="center" bgcolor="F8F8F8"> 
		                      <td height="26" align="center" bgcolor="#E4EBF1" style="padding-right:10"><table width="600" border="0" cellspacing="0" cellpadding="0">
		                          <tr> 
		                            <td align="center">
		                            <strong>교육정보 | 자격증.보유기술정보 | 프로젝트 정보 | 경력정보 | 근무정보</strong></td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr align="center" bgcolor="F8F8F8"> 
		                      <td height="3" align="right" background="${path}/image/bar_bg1.gif"></td>
		                    </tr>
		                  </table></td>
		              </tr>
		            </table></td>
		        </tr>
		        <tr> 
		          <td height="6" align="center" valign="top">&nbsp;</td>
		        </tr>
		        <tr>
		          <td height="7" align="center" valign="top"><table width="600" border="0" cellspacing="0" cellpadding="0">
		              <tr> 
		                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
		                    <tr> 
		                      <td height="135" align="center" bgcolor="#E4EBF1"><table width="600" border="0" cellpadding="0" cellspacing="0">
		                        <tr>
		                          <td width="144" height="119" align="center"><table width="100" border="0" cellspacing="0" cellpadding="0">
		                            <tr>
		                              <td height="112" bgcolor="#CCCCCC"><table width="100" border="0" cellspacing="1" cellpadding="0">
		                                  <tr>
		                                    <td height="110" bgcolor="#FFFFFF" id="img_box"><img id="img_preview"></img>&nbsp;</td>
		                                  </tr>
		                              </table></td>
		                            </tr>
		                          </table></td>
		                          <td width="456">
		                          <table width="423" border="0" cellspacing="2" cellpadding="0">
		                            <tr>
		                              <td height="2" colspan="2"></td>
		                              </tr>
		                            <tr>
		                              <td width="107" height="26" align="right"><strong>한글이름 :</strong>&nbsp;</td>
		                              <td width="150" height="26">
		                                <input type="text" name="ename_kr" id="ename_kr">
		                              </td>
		                              <td width="160" height="26" ><span style="display: none; padding-left: 15px;" id="name_blank">※문자만 입력 가능합니다</span></td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>영문이름 :&nbsp;</strong></td>
		                              <td height="26">
		                              	<input type="text" name="ename_en" id="ename_en">
		                              </td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>한문이름 :</strong>&nbsp;</td>
		                              <td height="26">
		                              	<input type="text" name="ename_ch" id="ename_ch">
		                              </td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>주민등록번호 :</strong>&nbsp;</td>
		                              <td height="26">
		                              <input name="id_no1" type="text" size="15" id="id_no1"> - <input name="id_no2" type="text" size="15" id="id_no2">
		                              </td>
		                            </tr>
		                          </table></td>
		                        </tr>
		                      </table></td>
		                    </tr>
		                  </table></td>
		              </tr>
		            </table></td>
		        </tr>
		        <tr> 
		          <td height="7" align="center" valign="top">&nbsp;</td>
		        </tr>
		        <tr> 
		          <td height="13" align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
		              <tr> 
		                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="526" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>사진파일명 :&nbsp;</strong></td>
		                            
		                            <td width="315">
		                            <font color="#FF0000">
		                            	<input type="file" name="uploadFile" id="uploadFile" accept=".jpg" />
		                            </font>
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>생년월일 :&nbsp;</strong></td>
		                            <td width="391">
		                            	  <input name="birth1" type="text" size="10" id="birth1">년
			                              <input name="birth2" type="text" size="7" id="birth2">월
			                              <input name="birth3" type="text" size="7" id="birth3">일
			                              (<input type="radio" name="birth_cat" value="lunar">양력
			                              <input type="radio" name="birth_cat" value="solar">음력)
		                              </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>성별 :&nbsp; </strong></td>
		                            <td width="391"> 
			                              <input type="radio" name="gender" value="남">남자
			                              <input type="radio" name="gender" value="여">여자
		              				</td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>결혼유무 :&nbsp;</strong></td>
		                            <td width="391"> 
		                           		<input type="radio" name="married" value="유">유
		                             	<input type="radio" name="married" value="무">무
		                             </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>년차 :&nbsp;</strong></td>
		                            <td width="392">
		                            	<input name="work_year" type="text" size="10" id="work_year"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>지급유형 :&nbsp;</strong></td>
		                            <td width="392"> 
		                            	<select name="sal_cat">
			                                <option value="월급">월급</option>
			                                <option value="주급">주급</option>
		                           		</select> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>희망직무 :&nbsp;</strong></td>
		                            <td width="392"> 
		                            	<select name="job_cat">
			                                <option value="SI">SI</option>
			                                <option value="SM">SM</option>
		                             	</select> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>입사유형 :&nbsp;</strong></td>
		                            <td width="392"> 
		                        	    <select name="employ_cat">
		                                	<option value="정규직">정규직</option>
		                                	<option value="계약직">계약직</option>
		                              	</select> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>주소 :&nbsp;</strong></td>
		                            <td width="392">
		                            	<input name="emp_addrs" type="text" size="40"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>연락처 :&nbsp;</strong></td>
		                            <td width="392">
			                              <input name="emp_mp1" type="text" size="10" id="emp_mp1">
			                              - 
			                              <input name="emp_mp2" type="text" size="10" id="emp_mp2">
			                              - 
			                              <input name="emp_mp3" type="text" size="10" id="emp_mp3"></td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>이메일:&nbsp;</strong></td>
		                            <td width="392">
		                            	<input name="emp_email" type="text" size="20"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>기술등급 :&nbsp;</strong></td>
		                            <td width="392">
		                            	<input name="skill_grade" id="skill_grade" type="text" size="20"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>주량 :&nbsp;</strong></td>
		                            <td width="392">
		                            	<input name="alcohol" type="text" size="20"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                  </table></td>
		              </tr>
		            </table></td>
		        </tr>
		        <tr> 
		          <td height="3" align="center">&nbsp;</td>
		        </tr>
		        <tr>
		          <td height="3" align="center"><table width="107" border="0" cellpadding="1" cellspacing="1">
		            <tr>
		              <td width="49"><img src="${path}/image/bt_remove.gif" width="49" height="18"  id="addForm"></td>
		              <td width="51"><a href="./empList"><img src="${path}/image/bt_cancel.gif" width="49" height="18"></a></td>
		            </tr>
		          </table>            </td>
		        </tr>
		        <tr> 
		          <td height="7" align="right">&nbsp;</td>
		        </tr>
		      </table></td>
		  </tr>
		</table>
		</form>
	</div>
</div>
</body>
</html>
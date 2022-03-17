<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	readImgFile();
	modifyCheck();
});

/* 이미지 미리보기 */
function readImgFile() {
	document.getElementById("uploadFile").onchange = function () {
		console.log("aaa");
	    var reader = new FileReader();

	    reader.onload = function (e) {
	        document.getElementById("img_preview").src = e.target.result;
	    };

	    reader.readAsDataURL(this.files[0]);
	};
}	

/* 수정확인 */
function modifyCheck() {
	document.getElementById("modifyDone").onclick = function(){
		if (confirm("정말 수정하시겠습니까?")==true){
			document.getElementById('modifyOk').submit();
		}else{
			return;
		}
	}
}
</script>
</head>
<body>

<div class="wholeContainer">
	<div class="leftSide">
	 	<jsp:include page="left.jsp"/>
	</div>
	<div class="main">
	<form action="./modifyEmp" method="post" enctype="multipart/form-data" id="modifyOk">
		<input type="hidden" name="emp_no" value="${empDto.emp_no }" />
		<table width="640" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
		    <td width="640">&nbsp;</td>
		  </tr>
		  <tr> 
		    <td height="25"><img src="${path}/image/icon.gif" width="9" height="9" align="absmiddle"> 
		      <strong>사원 기본 정보 수정</strong></td>
		  </tr>
		  <tr> 
		    <td>
		    <table width="640" border="0" cellspacing="0" cellpadding="0">
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
		                                    <td height="110" bgcolor="#FFFFFF">
			                                    <img src="/uploadImg/${empDto.sys_img_name }" alt="" id="img_preview" />&nbsp;
			                                  	<input type="hidden" name="sys_img_name" value="${empDto.sys_img_name }"/>
		                                    </td>
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
		                              <td width="310" height="26">
		                                <input type="text" name="ename_kr" value=${empDto.ename_kr }>
		                              </td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>영문이름 :&nbsp;</strong></td>
		                              <td height="26">
		                              	<input type="text" name="ename_en" value=${empDto.ename_en }>
		                              </td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>한문이름 :</strong>&nbsp;</td>
		                              <td height="26">
		                              	<input type="text" name="ename_ch" value=${empDto.ename_ch }>
		                              </td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>주민등록번호 :</strong>&nbsp;</td>
		                              <td height="26">
		                              <input name="id_no1" type="text" size="15" value=${fn:split(empDto.id_no,'-')[0]}> - <input name="id_no2" type="text" size="15"value=${fn:split(empDto.id_no,'-')[1]}>
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
		                            	<input type="file" name="uploadFile" id="uploadFile" accept="image/*" />
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
		                            	  <input name="birth1" type="text" size="10" value=${fn:split(empDto.birth,'-')[0]}>년
			                              <input name="birth2" type="text" size="7" value=${fn:split(empDto.birth,'-')[1]}>월
			                              <input name="birth3" type="text" size="7" value=${fn:split(empDto.birth,'-')[2]}>일
			                              (<input type="radio" name="birth_cat" value="lunar" <c:if test="${empDto.birth_cat =='lunar'}" >checked</c:if>>양력
			                              <input type="radio" name="birth_cat" value="solar" <c:if test="${empDto.birth_cat =='solar'}" >checked</c:if>>음력)
		                              </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>성별 :&nbsp; </strong></td>
		                            <td width="391"> 
			                              <input type="radio" name="gender" value="남" <c:if test="${empDto.gender =='남'}" >checked</c:if>>남자
			                              <input type="radio" name="gender" value="여" <c:if test="${empDto.gender =='여'}" >checked</c:if>>여자
		              				</td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>결혼유무 :&nbsp;</strong></td>
		                            <td width="391"> 
		                           		<input type="radio" name="married" value="유" <c:if test="${empDto.married =='유'}" >checked</c:if>>유
		                             	<input type="radio" name="married" value="무" <c:if test="${empDto.married =='무'}" >checked</c:if>>무
		                             </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>년차 :&nbsp;</strong></td>
		                            <td width="392">
		                            	<input name="work_year" type="text" size="10" value="${empDto.work_year}"> 
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
			                                <option value="월급" <c:if test="${empDto.sal_cat =='월급'}" >selected </c:if>>월급</option>
			                                <option value="${empDto.sal_cat}" <c:if test="${empDto.sal_cat =='주급'}" >selected </c:if>>주급</option>
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
			                                <option value="SI" <c:if test="${empDto.job_cat =='SI'}" >selected</c:if>>SI</option>
			                                <option value="SM" <c:if test="${empDto.job_cat =='SM'}" >selected</c:if>>SM</option>
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
		                                	<option value="정규직" <c:if test="${empDto.employ_cat =='정규직'}" >selected </c:if>>정규직</option>
		                                	<option value="계약직" <c:if test="${empDto.employ_cat =='계약직'}" >selected </c:if>>계약직</option>
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
		                            	<input name="emp_addrs" type="text" size="40" value="${empDto.emp_addrs }"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>연락처 :&nbsp;</strong></td>
		                            <td width="392">
			                              <input name="emp_mp1" type="text" size="10" value=${fn:split(empDto.emp_mp,'-')[0]}>
			                              - 
			                              <input name="emp_mp2" type="text" size="10" value=${fn:split(empDto.emp_mp,'-')[1]}>
			                              - 
			                              <input name="emp_mp3" type="text" size="10" value=${fn:split(empDto.emp_mp,'-')[2]}>
			                        </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>이메일:&nbsp;</strong></td>
		                            <td width="392">
		                            	<input name="emp_email" type="text" size="20" value=${empDto.emp_email }> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>기술등급 :&nbsp;</strong></td>
		                            <td width="392">
		                            	<input name="skill_grade" type="text" size="20" value=${empDto.skill_grade }> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>주량 :&nbsp;</strong></td>
		                            <td width="392">
		                            	<input name="alcohol" type="text" size="20" value=${empDto.alcohol }> 
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
		              <td width="49"><img src="${path}/image/bt_remove.gif" width="49" height="18" id="modifyDone"></td>
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
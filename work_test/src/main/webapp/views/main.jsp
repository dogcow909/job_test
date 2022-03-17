<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="${path }/resources/image/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원조회</strong></td>
  </tr>
  <tr> 
    <td><table width="640" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="30" align="right"><select name="select" class="INPUT">
              <option selected>::::: 전체 :::::</option>
            </select> <input name="textfield" type="text" class="INPUT"> <a href="#"><img src="${path }/resources/image/search.gif" width="49" height="18" border="0" align="absmiddle"></a></td>
        </tr>
        <tr> 
          <td><table width="640" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="3" background="${path }/resources/image/bar_bg1.gif"></td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="${path }/resources/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">수정</a> <img src="${path }/resources/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">인사기록카드</a> <img src="${path }/resources/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">경력정보</a> <img src="${path }/resources/image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">근무정보</a> </td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="1" align="right" bgcolor="B1B1B1"></td>
              </tr>
              <tr> 
                <td>
				<!-------------------------  ����Ʈ ------------------------------>
				<table width="640" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="35" height="20" align="center"><input type="checkbox" name="checkbox" value="checkbox"></td>
                      <td width="85" align="center">ȫ�浿</td>
                      <td width="153" align="center">123456-1234567</td>
                      <td width="91" align="center">��</td>
                      <td width="91" align="center">�߱�</td>
                      <td width="91" align="center">����</td>
                      <td width="94" align="center">�ٹ�</td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="${path }/resources/image/line_bg.gif"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><input type="checkbox" name="checkbox2" value="checkbox"></td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="${path }/resources/image/line_bg.gif"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><input type="checkbox" name="checkbox3" value="checkbox"></td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
            ����
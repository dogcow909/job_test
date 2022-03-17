<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td align="center" valign="top"><table width="170" height="300" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="9"><img src="${path }/resources/image/left_top.gif" width="170" height="9"></td>
        </tr>
        <tr> 
          <td align="center" valign="top" background="${path }/resources/image/left_bg.gif">
		  <!----------------------  �޴��� ----------------------------->
		  <table width="150" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="17" height="20"><img src="${path }/resources/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td width="133"><a href="${path }/empList">기본정보</a></td>
              </tr>
              <tr> 
                <td height="20">&nbsp;</td>
                <td><a href="${path }/addEmp">- 등록</a></td>
              </tr>
              <tr> 
                <td height="20"><img src="${path }/resources/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>직원명부</td>
              </tr>
              <tr> 
                <td height="20"><img src="${path }/resources/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>퇴직자현황</td>
              </tr>
              <tr> 
                <td height="20"><img src="${path }/resources/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>예비인력정보</td>
              </tr>
              <tr> 
                <td height="20"><img src="${path }/resources/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>거래처정보</td>
              </tr>
              <tr> 
                <td height="20">&nbsp;</td>
                <td>- 등록</td>
              </tr>
            </table>
		  <!----------------------  �޴��� ----------------------------->
			</td>
        </tr>
        <tr> 
          <td height="9"><img src="${path }/resources/image/left_bottom.gif" width="170" height="9"></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td align="center"><table width="170" height="49" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="center" background="${path }/resources/image/left_box.gif">
		  <!------------------------------ ��°˻� ---------------------------------->
		  <table width="155" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="17"><img src="${path }/resources/image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td width="143" height="20"><strong>경력검색</strong></td>
              </tr>
              <tr align="right"> 
                <td colspan="2"><input name="textfield" type="text" class="flat" size="15" maxlength="14"> 
                  <img src="${path }/resources/image/search.gif" width="49" height="18" align="absmiddle"></td>
              </tr>
            </table>
		  <!------------------------------ ��°˻� ---------------------------------->
			</td>
        </tr>
      </table></td>
  </tr>
</table>

    
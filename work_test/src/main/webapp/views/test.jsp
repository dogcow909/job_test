<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>hello</h2>
	
	<c:forEach var="dto" items="${testDTO}">
	 <ul>
	 	<li>${dto.emp_no}</li>
	 </ul>
	</c:forEach>
	<c:set var="path" value="${pageContext.request.contextPath }" />
</body>
</html>
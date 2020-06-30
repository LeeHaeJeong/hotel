<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
</head>
<body>
	<c:forEach items="${chk}" var="Hotel">
		<tr>
			<th>체크인</th>
			<td><fmt:formatDate pattern="yyyy/MM/dd"
					value="${Hotel.checkIn}" /></td>
			<th>체크아웃</th>
			<td><fmt:formatDate pattern="yyyy/MM/dd"
					value="${Hotel.checkOut}" /></td>
		</tr>
	</c:forEach>
</body>
</html>
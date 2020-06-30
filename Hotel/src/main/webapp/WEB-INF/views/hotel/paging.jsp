<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul class="btn-group pagination">
    <c:if test="${pageMaker.prev}">
    <li>
        <a href='<c:url value="/hotel/list?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
    <li>
        <a href='<c:url value="/hotel/list?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage>0}">
    <li>
        <a href='<c:url value="/hotel/list?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
    </li>
    </c:if>
</ul>


</body>
</html>
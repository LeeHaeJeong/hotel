<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
ul i {
	border: 2px solid green;
	margin: 5px;
	color:green;
}
</style>


<!-- row의 끝-->
<div class="row">
	<div class="col-lg-12">
		<div class="pannel pannel-defalut">
			<div class="pannel-heading">게시판 목록 테이불</div>
			
		</div>
		<!-- /pannel heading의 끝-->
		<br><br><br><br>
		<div class="pannel-body">

			
			
			</div>
			<table class="table table-striped table-bordered table-hover">

				<thead class="thead-light">
					
					<tr>
						<th scope="col">#번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						
						
					</tr>
				</thead>

				<tbody class="tbody tbody-warning">
				
					<c:forEach items="${list}" var="hotel">
					
						<tr>
							<td>${hotel.id}</td>
							<td><a href='<c:url value="/hotel/update?id=${hotel.id}"/>'>
									${hotel.title}</a>
							</td>
							<td>${hotel.name}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${hotel.modified}" /></td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			</div>
			<ul class="btn-group pagination">
			    <c:if test="${pageMaker.prev }">
			    <li>
			        <a href='<c:url value="/hotel/list?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
			    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
			    <li>
			        <a href='<c:url value="/hotel/list?page=${pageNum }"/>'><i class="fa">${pageNum}</i></a>
			    </li>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			    <li>
			        <a href='<c:url value="/hotel/list?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
			    </li>
			    </c:if>
			</ul>
			<a href="/hotel/insert">
			<button type="submit" class="btn btn-info">글쓰기</button>
			</a>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="../includes/footer.jsp"%>

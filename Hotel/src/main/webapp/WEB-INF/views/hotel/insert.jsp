<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<body>
  <form action="/hotel/insert" method="post">
        <div class="form-group">
              <label for="exampleFormControlInput1">이름</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="name" placeholder="이름을 작성해주세요.">
          </div>
        <div class="form-group">
            <label for="exampleFormControlInput1">제목</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="제목을 작성해주세요">
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">내용</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="10"></textarea>
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">전화번호</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="phone_number" rows="10"></textarea>
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">주소</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" name="address" rows="10"></textarea>
          </div>
         
        <button type="submit" class="btn btn-info">등록하기</button>
        <button type="button" class="btn btn-secondary">목록으로</button>
    </form>
<%@include file="../includes/footer.jsp"%>
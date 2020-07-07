<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<br><br><br>
<body>
  <form action="/hotel/insert" method="post">
        <div class="form-group">
              <label for="namelabel">이름</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="이름을 작성해주세요.">
          </div>
        <div class="form-group">
            <label for="titlelabel">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 작성해주세요">
          </div>
          <div class="form-group">
            <label for="contentlabel">내용</label>
            <textarea class="form-control" id="content" name="content" rows="10"></textarea>
          </div>
          <div class="form-group">
            <label for="phone_numberlabel">전화번호</label>
            <textarea class="form-control" id="phone_number" name="phone_number" rows="10"></textarea>
          </div>
          <div class="form-group">
            <label for="addresslabel">주소</label>
            <textarea class="form-control" id="address" name="address" rows="10"></textarea>
          </div>         
        <button type="submit" class="btn btn-info">등록하기</button>
        <button type="button" class="btn btn-secondary">목록으로</button>   
    </form>
<script type="text/javascript">
$(document).ready(function(){

    var formObj =$("form");
    $("button[type='button']").on("click",function(e){
        e.preventDefault();
    formObj.attr("action",'/hotel/list').attr("method","get");     
    formObj.submit();

    });          
});

</script>
<%@include file="../includes/footer.jsp"%>
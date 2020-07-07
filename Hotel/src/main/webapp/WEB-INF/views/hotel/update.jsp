<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<div class="pannel pannel-defalut">
			<div class="pannel-heading"></div>
			
		</div>
	</div>
</div>
		<!-- /pannel heading의 끝-->
<br><br><br>
<div class="pannel-body">
	<table class="table table-striped table-bordered table-hover">
		
		<form action='/hotel/update' role="form" method="post">		
	        <div class="form-group">
	            <label for="titlelabel">제목</label>
	            <input type="text" class="form-control" id="title" name="title" value="${detail.title}" >
	        </div>
	        
	        <div class="form-group">
	            <label for="namelabel">작성자</label>
	            <input type="text" class="form-control" id="name" name="name" value="${detail.name}">
	        </div>
	        
	        <div class="form-group">
	            <label for="contentlabel">내용</label>
	            <input type="text" class="form-control" id="content" name="content" value="${detail.content}" >
	        </div>
	        
	        <div class="form-group">
	            <label for="phone_numberlabel">폰번호</label>
	            <textarea class="form-control" id="phone_number" rows="10" name="phone_number" readonly="readonly">${detail.phone_number}</textarea>
	        </div>
	        <input type="hidden" name="id" value="${detail.id}">       
	        <button type="submit" class="btn btn-info" data-oper="modify">수정하기</button>
	        <button type="submit" class="btn btn-secondary" data-oper="list" >뒤로가기</button>
	        <button type="submit" class="btn btn-info" data-oper="remove">삭제</button>
	    </form>
	</table>
</div>

<script type="text/javascript">
$(document).ready(function(){

    var formObj =$("form");
    $("button").on("click",function(e){
        e.preventDefault();

	var operation = $(this).data("oper");
   	console.log(operation)
    if(operation == 'remove'){
      formObj.attr("action","/hotel/remove");
    }else if(operation == 'list'){
      formObj.attr("action",'/hotel/list').attr("method","get");     
      formObj.empty(); // pageNum과 amount만 남겨놓고 form 태그 나머지 제거 -> page와 amount는 임시로 저장됨
    }
    formObj.submit();

            
    });
});

</script>


</body>
</html>
<%@include file="../includes/footer.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<body>

	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

	<main class="mt-5">
		<hr class="my-5">

		<!--Section: Facility-->
		<section id="facility">

			<!-- Heading -->
			<h2 class="mb-5 font-weight-bold text-center"></h2>

		
			<!--Grid row-->
			<div class="row">

				<!--Grid column-->
				<div class="col-md-6 mb-4">
				
					
					<!--Carousel Wrapper-->
					<div id="carousel-example-1z"
						class="carousel slide carousel-fade carousel-fade"
						data-ride="carousel">
						<!--Indicators-->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-1z" data-slide-to="1"></li>
							<li data-target="#carousel-example-1z" data-slide-to="2"></li>
							<li data-target="#carousel-example-1z" data-slide-to="3"></li>
							<li data-target="#carousel-example-1z" data-slide-to="4"></li>
							<li data-target="#carousel-example-1z" data-slide-to="5"></li>
						</ol>
						<!--/.Indicators-->
						
					<!--Section: Roomtypest-->
					<section id= roomtypest>
						<!--Slides-->
						<div class="carousel-inner z-depth-1-half" role="listbox">
							<div class="carousel-item active">																				
								<img class="d-block w-100"
									src="../../resources/img/${name}.jpg"
									width="700" height="500"/> 								
							</div>			
						</div>
						<!--/.Slides-->
					</section>	
					<!--Section: Roomtypest-->
					
					<!--/-->
						<!--Controls-->
						<a class="carousel-control-prev" href="#carousel-example-1z"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carousel-example-1z"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
						<!--/.Controls-->
					</div>
					<!--/.Carousel Wrapper-->
		
				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-md-6">

					<!--Excerpt-->
					<a href="" class="teal-text">
						<h6 class="pb-1">
							<i class="fa fa-heart"><strong> <c:out value="${roomName}"></c:out>
							</strong></i>
						</h6>
					</a>
					
					<h4 class="mb-3">
						<strong>이 방은 <c:out value="${roomName}"></c:out>룸 입니다
						</strong>
					</h4>
					
					<p><c:out value="${text}"></c:out></p>

				</div>
				<!--Grid column-->

			</div>
			<!--Grid row-->
			<div>
				<form action="/hotel/reservation" method="post" >
					<label>체크 인 </label> 
					<input type="date" id=chkIn" name="checkIn" /> 
					<label>체크 아웃</label> 
					<input type="date"  id="chkOut" name="checkOut"/> 
					<input
						type="hidden" id ="room" name="room" value="${roomName}"/>

					<button type="submit" id="click-btn">선택</button>
				</form>
			</div>

			<div>
				<h3>예약된 시간</h3>
				<br>
				<c:if test="${not empty chk}">
					<c:forEach items="${chk}" var="Hotel">
						<tr>
							<th>체크인</th>
							<td><fmt:formatDate pattern="yyyy/MM/dd"
									value="${Hotel.checkIn}" /></td>
							<th>체크아웃</th>
							<td><fmt:formatDate pattern="yyyy/MM/dd"
									value="${Hotel.checkOut}" /></td>
						</tr>
						<br>
					</c:forEach>
				</c:if>
				<c:if test="${empty chk }">
					<th>현재 방은 비어있는 예약되있지 않습니다.</th>
				</c:if>

			</div>

		</section>
		<!--Section: Facility-->

		<hr class="my-5">

		<!--Section: Contact-->
		<section id="contact"></section>
		<!--Section: Contact-->

	</main>
	<!--Main layout-->

<%@include file="../includes/footer.jsp"%>

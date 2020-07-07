<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<body>
<c:if test="${noName}">
		<form name="return" action="/hotel/index" method="get">
			<script>
				alert("잘못된 주소입니다.");
				$("form[name='return']").submit();
			</script>

		</form>
	</c:if>

	<main class="mt-5">
		<hr class="my-5">

		<!--Section: Gallery-->
		<section id="gallery">

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

					</div>
					<!--/.Carousel Wrapper-->

				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-md-6">

					<!--Excerpt-->
					<a href="#" class="teal-text">
					<h6 class="pb-1">
						<i class="fa fa-heart">
							<strong>
								<c:out value="${roomName}"></c:out>
							</strong>
						</i>
					</h6>
						</a>
					<h4 class="mb-3">
						<strong>이 방은 <c:out value="${roomName}"></c:out>룸 입니다
						</strong>
					</h4>
					<p><c:out value="${text}"></c:out></p>
					
					
			<div>
				<form action="/hotel/reservation" method="post">
					<div class="input-daterange input-group" id="flight-datepicker">
						<div class="form-item">
							<input class="input-sm form-control"
								type="text" id="start-date" name="start" placeholder="check in"
								required />
						</div>
						<div class="form-item">
							 <input class="input-sm form-control"
								type="text" id="end-date" name="end" placeholder="check out" />
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" id="click-btn">예약</button>
					</div>
					<input type="hidden" name="room" value="${roomName}">
					<input type="hidden" name="text" value="${text}">				

				</form>
			</div>

				</div>
				<!--Grid column-->

			</div>
			<!--Grid row-->

			<div style="display:none">
				<table>
					<tbody>
							<c:forEach items="${chk}" var="Hotel">
								<tr>
									<td id="in"><fmt:formatDate pattern="yyyy/MM/dd"
											value="${Hotel.checkIn}" /> </td>
									<td id="out"><fmt:formatDate pattern="yyyy/MM/dd"
											value="${Hotel.checkOut}" /> </td>
								</tr>
							</c:forEach>
					</tbody>
				</table>
			</div>

		</section>


	</main>
	<script>
	
		var $tin = $("tbody  #in");				//체크인
		var $tout = $("tbody  #out");			//체크 아웃
		var inSplit = $tin.text().split(' ');		// 체크인을 배열로 변환 ( 공백을 이용하여 절단 )
		var outSplit = $tout.text().split(' ');		// 체크아웃을 "
		
		var checkInPicker = $('#start-date');			//datepicker(체크인)			
		var checkOutPicker = $('#end-date');			//datepicker(체크아웃)
		var selectCheckIn;								//선택 된 체크인 
		var selectCheckOut;								//선택 된 체크아웃
		var checkDate;
		var checkDate2 =$($("div #end-date")[0]);
		var dateCheck = false;						//체크아웃이 체크인보다 앞인지 확인
		$(document).ready(function(){
			
		// 예약 된 날짜 Disable...비활성화 시키기
		function disable(date) {
			
			var dateRange = [];		//리턴 할 값들을 저장할 배열
			var dateString = jQuery.datepicker.formatDate('yy/mm/dd', date);	//포켓 설정
			var size = '${chk.size()}';		//반복문 크기 조정
			var i = 0;	
			for (i; i < size; i++) {
				//New Date(startdate[i]) 에서 시작 new Date(enddate[i]) 까지 ( 범위 지정 ) 
				//증감 연산부분에선 현재 날짜를 하루 올려야 하기에 d.setDate()로 현재 날짜 +1일 (d.getDate()+1) 을 했다.
				for (var d = new Date(inSplit[i]); d <= new Date(outSplit[i]); d
						.setDate(d.getDate() + 1)) {
					dateRange.push($.datepicker.formatDate('yy/mm/dd', d));
				};
			};
			return [ dateRange.indexOf(dateString) == -1 ];
		}; //disable 종료
			
			
		//저장되 있는 (혹시 모를) 체크인의 datepicker정보 삭제
		checkInPicker.datepicker("destroy");
		
		//체크인 시작
		checkInPicker.datepicker({
			minDate :  new Date(),
			autoclose : true,
			dateFormat : "yy/mm/dd",
			maxViewMode : 0,
			beforeShowDay : disable 
		}).on('change', function() {
			
			checkDate =$($("div #start-date")[0]).val();
			checkDate2.val(checkDate);
			
			//체크인으로 선택한 값 저장
			selectCheckIn = checkInPicker.val();
			});


	 	//저장되 있는 (혹시 모를) 체크아웃의 datepicker정보 삭제
		checkOutPicker.datepicker("destroy");
		//체크아웃 시작
		checkOutPicker.datepicker({
				minDate :  new Date(),
				autoclose : true,
				dateFormat : "yy/mm/dd",
				maxViewMode : 0,
				startDate : 'now',
				beforeShowDay : disable
			}).on('change', function() {
				//체크아웃으로 선택한 값 저장
				selectCheckOut = checkOutPicker.val();
				
				//체크인과 체크아웃 날짜 확인
				if (selectCheckIn > selectCheckOut) {
					alert("체크아웃의 날짜가 체크인의 날짜보다 빠릅니다.\n 다시 설정해 주세요");
					dateCheck = true;

				} else {
					dateCheck = false
				};
			}); 
			//예약 버튼 클릭 시 
			$("#click-btn").on('click', function(e) {
				//체크아웃 날짜가 체크인 날짜보다 빠를 때 
				if (dateCheck) {
					e.preventDefault();		//'click' 이벤트 잠시 멈춤
					alert("체크아웃의 날짜를 다시 조정해주세요");
				}
				//dateCheck가 false 일땐 아무 동작 없음 ( #click-btn은 submit 타입이므로 form 실행)
			});
		}); //document
		
	</script>
<br><br><br>
<%@include file="../includes/footer.jsp"%>

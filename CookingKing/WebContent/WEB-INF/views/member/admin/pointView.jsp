<%@page import="java.text.DecimalFormat"%>
<%@page import="point.model.vo.Point"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
<%
	List<Point> pointView = (List<Point>)request.getAttribute("pointView");
	User selectedUser = (User)request.getAttribute("selectedUser");
	int cnt = 1;
/* 	int resultSum = (int)(request.getAttribute("resultSum")); */
	User commission = (User)session.getAttribute("commission");
	DecimalFormat pointF = new DecimalFormat("###,###,### 포인트");
%>
 
  <link rel="stylesheet"href="<%=request.getContextPath()%>/css/point.css" />      
 <div class="pi-wrapper">
    <div class="point-notice">
		<p class="page-title-p"><strong><%=selectedUser.getUserId() %>님</strong>의 포인트</p>
    </div>
   <div id="ins-cont-wrapper">
	<br />
	<p class="page-small-p">포인트 기록</p>
	<div class="point-table">
<table>
				<tr id="tbl-head">
		
					<th id="pm-th-no">번호</th>
			<!-- (예빈) 사용자에게 노출하지 않아도 된다고 판단되어 우선 주석처리함. -->
					<!-- <th>입/출력</th> -->
					<th id="pm-th-cont">입/출력 내용</th>
					<th>입/출금 포인트</th>
					<th>입/출금 날짜</th>
					
				</tr>
				
				<%for(Point p : pointView) { %>
					<tr>
						<td><%= cnt++ %></td>
						<%-- <td><%= p.getPointIO() %></td> --%>
						<td><%= p.getPointContent() %></td>
						<td><%= p.getPointAmount()%></td>
						<td><%= p.getPointIODate() %></td>
					</tr>
				<%} %>
			<tfoot>
				<tr id="tbl-footer">
					<th colspan="10">총액</th>
				</tr>
				 <tr id="tbl-footer2">
				 	<td colspan="10"> <%= selectedUser.getPointSum()%></td>
				 </tr>
			</tfoot>
			</table>
	</div>
	</div>
	<br />
	
<div id="ins-input-wrapper">
		<div class="point-deposit-User">	
			<div class="pointExc-notic">
			<p class="push"></p>
			<p class="page-small-p2">포인트 총액</p>
				<p>현재 <strong><%= pointF.format(selectedUser.getPointSum()) %></strong>가 있습니다.</p>
			</div>
			<div class="pointExc-input1">
				<form action="<%= request.getContextPath() %>/admin/deposit" method="post" id="pointDep-frm" ">
				
					<div class="point-input33">
							<p class="page-small-p22">포인트 충전</p>
						<div class="point-input1-notice">
							<label for="pointAmountLabel" id="select-amount">충전할 포인트 액수를 선택해주세요.</label>
						</div>
						<div class="point-input1-index">
				<!-- (예빈)  각 클래스의 전반적인 가격대를 보아 충전 액수가 다소 적다고 생각되어 금액대를 수정하며, 
							배치 편의상 label과 radio의 위치를 바꿈. -->
						<div id="less-point">
							<label for="chargeVal1">10,000 포인트</label>
							<input type="radio" name="pointAmount" id="chargeVal1"  value="10000"/>
							<label for="chargeVal2">15,000 포인트</label>
							<input type="radio" name="pointAmount" id="chargeVal2"  value="15000"/>
							<label for="chargeVal3">20,000 포인트</label>
							<input type="radio" name="pointAmount" id="chargeVal3"  value="20000"/>
						</div>
						<div id="more-point">
							<label for="chargeVal4">30,000 포인트</label>
							<input type="radio" name="pointAmount" id="chargeVal4"  value="30000"/>
							<label for="chargeVal5">50,000 포인트</label>
							<input type="radio" name="pointAmount" id="chargeVal5"  value="50000"/>
							<label for="chargeVal6">100,000 포인트</label>
							<input type="radio" name="pointAmount" id="chargeVal6"  value="100000"/>
						</div>
						</div>
<!-- 						<div class="point-input1-payAmt-view"></div>
					</div>
					
					<div class="point-input2-view"> -->
						<p></p> 
						<label for="pointContent" id="pointAmount">내용을 입력해주세요.</label>
						<br />
						<input type="text" name="pointContent" id="pointContent" required/>
						<input type="submit" value="포인트 충전" id="view-btn"/>
	<!-- 				<div class="point-input4-view">
					</div> -->
					</div>

					<input type="hidden" name="userId" value="<%=selectedUser.getUserId() %>" />
				</form>
			</div>
		</div> <!-- div 끝 -->
		
		<div class="point-exchange-tutor">
					<div class="point-input44">
		<p class="page-small-p2">포인트 차감</p>
			<div class="pointExc-frm">
				<form action="<%= request.getContextPath() %>/admin/viewPointLog" method="post" id="pointExc-frm">
						<div class="point-input1-index2">
						<label for="pointAmount" id="select-amount">차감할 포인트를 입력해주세요.</label>
						<br />
						<input type="text" name="pointAmount" id="pointAmount" class='NumOlny' placeholder="환전할 포인트를 입력해주세요." required />
					</div>
					
					<div class="point-input2-view">
						<label for="pointContent" id="pointAmount">내용을 입력해주세요.</label>
						<br />
						<input type="text" name="pointContent" id="pointContent" required/>
						<input type="submit" value="포인트 차감" id="view-btn"/>
					
					<div class="point-input4-view">
					</div>
					</div>
					<input type="hidden" name="userId" value="<%=selectedUser.getUserId() %>" />
				</form>
			</div>
		</div> <!-- point-exchange-tutor div 끝 -->
	</div>
</div>
<script>



$(document).ready(function(){
	
	$(".NumOnly").keypress(function(event){
		if (event.which && (event.which < 48 || event.which > 57)) {
			event.preventDefault();
		  }
	});
	
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>    

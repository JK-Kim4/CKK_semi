<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>  

<script>
		function management(id){
			var str = id == "grantU" ? "권한 신청 회원 목록" : "전체 회원 목록";
			/* (예빈)요소 배치 편의상 별도의 p태그로 작성하기로 함. */
			/* $("#list-span").html("<"+str+">").attr("name", id); */
			
			if(id == "grantU"){
				$.ajax({
					url : "<%= request.getContextPath() %>/admin/grant",
					dataType : "html",
					success : function(data){
						$("#memberList-div").html(data);
					},
					error : function(xhr, status, err){
						console.log(xhr, status, err);
					}
				});
			}
			else {
				$.ajax({
					url : "<%= request.getContextPath() %>/admin/member/list",
					dataType : "html",
					success : function(data){
						$("#memberList-div").html(data);
					},
					error : function(xhr, status, err){
						console.log(xhr, status, err);
					}
				});
			}
		}

		
</script>
<style>
/* footer의 높이는 각 페이지별로 제어할 것 (각 페이지마다 지정된 높이의 고정값이 다르므로) */
.public-footer{
   top: 87em;
}
</style>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/memberManagement.css" />
<div class="mm-switch-wrapper">
	<label for="memberM" id="memberM-lab">전체 회원 목록</label>
	<input type="radio" name="management" id="memberM" onclick="management('memberM');" />
	<label for="grantU" id="grantU-lab">권한 신청 회원 목록</label>
	<input type="radio" name="management" id="grantU" onclick="management('grantU');"/>
	<br />
	<span id="list-span"></span>
	<div id="memberList-div"></div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@page import="board.model.vo.Board"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>  
<%
	Calendar today = Calendar.getInstance();
	today.setTime(new Date());
	Calendar lastApply = Calendar.getInstance();
	lastApply.setTime(new Date());
	lastApply.add(Calendar.MONTH, 1);
	
	Calendar classDateS = Calendar.getInstance();
	classDateS.setTime(new Date());
	classDateS.add(Calendar.MONTH, 1);
	classDateS.add(Calendar.DATE, 3);
	
	Calendar classDateE = Calendar.getInstance();
	classDateE.setTime(new Date());
	classDateE.add(Calendar.MONTH, 1);
	classDateE.add(Calendar.DATE, 3);
	classDateE.add(Calendar.MONTH, 1);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Board b = (Board)request.getAttribute("board");
%>
<!-- <style>
	table, th, td{
	 border: 1px solid #000;
	 border-collapse: collapse;
	}
	.file-label:hover, .hidden-label:hover{
		color : blue;
		text-decoration: underline;
		font-weight: bold;
	}
</style> -->
<script>
$(function(){
	$(".numberInput").keypress(function(event){
		if (event.which && (event.which < 48 || event.which > 57)) {
			event.preventDefault();
		  }
	});
	
	$(".file-input").change(function(){
		//파일을 선택한 경우
		if($(this).val() != ""){
			var file = $(this).val();
			var idx = file.lastIndexOf("\\");
			var fileName = file.substr(idx+1);
			
			$(this).siblings(".file-label").css("display", "none");
			$(this).siblings(".hidden-label").css("display", "initial").text(fileName);
		}
		//파일 선택을 취소한 경우
		else{
			$(this).siblings(".file-label").css("display", "initial");
			$(this).siblings(".hidden-label").css("display", "none").text("");
		}
	});
	
	$(".file-label, .hidden-label").click(function(){
		$(this).siblings(".file-input").trigger("click");
	});
	
});
function check(){
	var regExp = /^.{1,14}$/;
	if(regExp.test($("#title").val()) == false){
		alert("제목은 공백포함 14글자 이하로 설정 가능합니다.");
		$("#title").select();
		
		return false;
	}
	return true;
};
</script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board-view.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board-list.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board-insert.css" />
<div class="view-div">
<form action="<%= request.getContextPath() %>/board/update" method="POST" enctype="multipart/form-data" onsubmit="return check();">
<section id="ins-cont-wrapper">
<div class="page-title">
	<p class="page-title-p">클래스 수정</p>
</div>
	<label for="ins-title">제목</label>
	<input type="text" name="ins-title" id="ins-title" required value="<%= b.getTitle() %>"/>
	<div class="ins-cont">	
	<!-- <label for="classContent">내용</label> -->
	<textarea name="classContent" id="classContent" cols="30" rows="10" 
	placeholder="
	부득이 일정한 내용의 게시물은 게재가 제한될 수 있습니다.
	
	여러분의 다양한 생각이나 경험 또는 의견이 담긴 게시물은 
	최대한 게재가 유지되어 다른 이용자들에게 전파될 것입니다. 
	다만 여러분이 쿠킹킹을 보다 안전하게 이용할 수 있도록, 
	쿠킹킹에서 여러분과 타인의 권리가 서로 존중되고 보호받을 수 있도록, 
	그리고 쿠킹킹이 신뢰 있는 서비스로서 안정적으로 제공될 수 있도록 
	부득이 아래와 같은 경우 여러분의 게시물 게재가 제한될 수 있으므로, 
	이에 대한 확인 및 준수를 요청 드립니다."
	required><%= b.getClassContent() %></textarea>
	</div>
	</section>
	
	<section id="ins-input-wrapper">
<div class="ins-input-inner">
<p id="ins-input-title">클래스 상세 정보를 설정해 주세요.</p>
<section id="ins-input-in-inner">
<div class="ins-info1">
	<label for="price">가격</label>
	<input type="text" name="price" id="price" class="numberInput" required value="<%= b.getPrice() %>"/>
	<label for="classDate">일시</label> <!-- 지원 마감일 최대기한 3일 이후 부터 한달 -->
	<input type="date" name="classDate" id="classDate" min="<%= sdf.format(classDateS.getTime()) %>" max="<%= sdf.format(classDateE.getTime()) %>" required value="<%= b.getClassDate() %>"/>
	<br />
	<label for="startTime">시작</label>
	<select name="startTime" id="startTime" required>
		<option value="" selected disabled>~시 부터</option>
	<% for(int i = 0; i < 24; i++){ %>
		<option value="<%= i %>" <%= b.getStartTime() == i ? "selected" : "" %>><%= i %>시</option>
	<% } %>
	</select>
	<label for="endTime">종료</label>
	<select name="endTime" id="endTime" required>
		<option value="" selected disabled>~시 까지</option>
	<% for(int i = 0; i < 24; i++){ %>
		<option value="<%= i %>" <%= b.getEndTime() == i ? "selected" : "" %>><%= i %>시</option>
	<% } %>
	</select>
</div>

<div class="ins-info3">	
	<label for="category">분야</label>
	<select name="category" id="category" required>
		<option value="" disabled>카테고리</option>
		<option value="MD" <%= b.getCategory().equals("MD") ? "selected" : "" %>>Main Dish</option>
		<option value="DS" <%= b.getCategory().equals("DS") ? "selected" : "" %>>Dessert</option>
		<option value="DR" <%= b.getCategory().equals("DR") ? "selected" : "" %>>Drink</option>
		<option value="AL" <%= b.getCategory().equals("AL") ? "selected" : "" %>>Liquor</option>
	</select>
	
	<label for="classLocation">지역</label>
	<select name="classLocation" id="classLocation" required>
		<option value="" disabled>지역</option>
		<option value="NORTH" <%= b.getClassLocation().equals("NORTH") ? "selected" : "" %>>강북구</option>
		<option value="SOUTH" <%= b.getClassLocation().equals("SOUTH") ? "selected" : "" %>>강남구</option>
		<option value="EAST" <%= b.getClassLocation().equals("EAST") ? "selected" : "" %>>강동구</option>
		<option value="WEST" <%= b.getClassLocation().equals("WEST") ? "selected" : "" %>>강서구</option>
	</select>
</div>

<div class="ins-info4">
	<label for="classAddress">주소</label>
	<input type="text" name="classAddress" id="classAddress" required value="<%= b.getClassAddress() %>"/>
	<br />
	<label for="capacity">인원</label>
	<input type="text" name="capacity" id="capacity" class="numberInput" required value="<%= b.getCapacity() %>"/>
	<label for="lastApplyDate">지원 마감일</label> <!-- 게시글 등록 날짜로부터 한달 -->
	<input type="date" name="lastApplyDate" id="lastApplyDate" min="<%= sdf.format(today.getTime()) %>" max="<%= sdf.format(lastApply.getTime()) %>" required value="<%= b.getLastApplyDate() %>"/>
	<br />
</div>

<div class="bu">
	<table id="bu-tbl">
		<tr>
			<th>사진</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<tr>
			<td>
				<span><%= b.getClassPic1Org() %></span>
			</td>
			<td>
				<input class="file-input" type="file" name="pic1-input" id="pic1-input" style="opacity: 0; position: absolute; width: 0px;"/>
				<label class="hidden-label" style="display: none;"></label>
				<label class="file-label" for="changePic1">파일 변경</label>
			</td>
			<td>
				<label>삭제 불가</label>
			</td>
		</tr>
		<tr>
			<td>
				<span><%= b.getClassPic2Org() != null ? b.getClassPic2Org() : "업로드한 파일이 없습니다." %></span>
			</td>
			<td>
				<input class="file-input" type="file" name="pic2-input" id="pic2-input" style="opacity: 0; position: absolute; width: 0px;"/>
				<label class="hidden-label" style="display: none;"></label>
				<label class="file-label" for="changePic2"><%= b.getClassPic2Org() != null ? "파일 변경" : "파일 업로드" %></label>
			</td>
			<td>
				<label for="del-pic2">삭제하기</label>
				<input type="checkbox" name="del-pic2" id="del-pic2" <%= b.getClassPic2Org() != null ? "" : "disabled" %>/>
			</td>
		</tr>
		<tr>
			<td>
				<span><%= b.getClassPic3Org() != null ? b.getClassPic3Org() : "업로드한 파일이 없습니다." %></span>
			</td>
			<td>
				<input class="file-input" type="file" name="pic3-input" id="pic3-input" style="opacity: 0; position: absolute; width: 0px;"/>
				<label class="hidden-label" style="display: none;"></label>
				<label class="file-label" for="changePic2"><%= b.getClassPic3Org() != null ? "파일 변경" : "파일 업로드" %></label>
			</td>
			<td>
				<label for="del-pic3">삭제하기</label>
				<input type="checkbox" name="del-pic3" id="del-pic3" <%= b.getClassPic3Org() != null ? "" : "disabled" %>/>
			</td>
		</tr>
	</table>
<!-- 	</div>
</section> -->
</div>
</section>
<div class="ins-apply">
	<input type="hidden" name="classNo" value="<%= b.getClassNo() %>" />

	<input type="submit" value="수정하기" id="ins-submit2"/>
	<input type="button" value="취소" onclick="history.go(-1);" />
</div>
</div>
</section>
</form>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<%--
	isErrorPage="true" 설정을 통해서 발생한 예외객체에 접근할 수 있다.
	exception 내장된 예외 객체
	단, HttpStatus코드에 의해 현재 예외페이지로 넘어온다면, exception객체는 null이다.
 --%>
 <%--예외객체 꺼내기 --%>
 <%
 	int statusCode = response.getStatus();
 	String msg = exception != null ? exception.getMessage():String.valueOf(statusCode); 
 %>
 
<html>
<head>
<meta charset="UTF-8">
<title>오류</title>
<style>
body{
	text-align:center;
}
#error-msg{
	color:red;
	font-size: 2em;
}
</style>
</head>
<body>
	<h1>오류</h1>
	<p>요청하신 페이지가 없습니다.</p>
	<p id="error-msg"><%= msg %></p>
	<hr />
	
	<a href="<%= request.getContextPath()%>">처음페이지~!</a>
</body>
</html>
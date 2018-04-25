<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String pageChange;
	%>
	<!-- get 방식으로 값 보내기 -->
	<!-- <a href="./template.jsp?page=newitem">신상품</a><br> -->
	<a href="?pageChange=newitem.jsp">신상품</a>
	<br>
	<a href="?pageChange=bestitem.jsp">인기상품</a>

</body>
</html>
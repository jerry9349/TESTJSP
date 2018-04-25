<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:useBean id="beantest" class="test.BeanTest" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h3>자바빈 사용 예제</h3>

<%-- <h3><%= beantest.getName() %></h3>
<% beantest.setName("batman"); %>
<h3><%= beantest.getName() %></h3> --%>


자바빈 객체의 멤버변수를 접근하는 것이 아니라 getter 호출 

<jsp:setProperty name="beantest" property="tel" value = "3"/>
<h3><jsp:getProperty name="beantest" property="tel"/></h3> 



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="beanJoin" class="test.BeanJoin" scope="page"/>
<jsp:setProperty property="*" name="beanJoin"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




<table width="50%" height="80" border="1" align="center" cellpadding="5" cellspacing="0" bordercolor="#9999FF">
	<tr align="center">
		<td colspan="2" align="center" bgcolor="skyblue">
			<div style="font-weight: bold; font-size: 18px">회원 기본 정보
			</div></td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center">
			<div style="font-weight: bold;">아이디:
			</div></td>
		<td><jsp:getProperty name="beanJoin" property="my_id"/></td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">비밀번호:</div></td>
		<td><jsp:getProperty name="beanJoin" property="my_pwd1"/></td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">비밀번호 확인:</div></td>
		<td><jsp:getProperty name="beanJoin" property="my_pwd2"/></td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">메일주소:</div></td>
		<td><jsp:getProperty name="beanJoin" property="my_mail"/></td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">이름:</div></td>
		<td><jsp:getProperty name="beanJoin" property="my_name"/></td>
	</tr>
	<tr align="center">
		<td colspan="2" bgcolor="skyblue">
			<div style="font-weight: bold; font-size: 18px">개인 신상 정보
			</div></td>
		
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">주민등록번호:</div></td>
		<td><jsp:getProperty name="beanJoin" property="my_num1"/>&nbsp-
		&nbsp<jsp:getProperty name="beanJoin" property="my_num2"/></td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">생일:</div></td>
		<td><jsp:getProperty name="beanJoin" property="my_birth"/>년&nbsp
		<jsp:getProperty name="beanJoin" property="month"/>월&nbsp
		<jsp:getProperty name="beanJoin" property="day"/>일</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">관심분야:</div></td>
		<td><% 
		String check[] = beanJoin.getChk();
		for(String i:check){
			out.print(i);%><br><%
		}
		
		%></td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">자기소개:</div></td>
		<td><jsp:getProperty name="beanJoin" property="my_intro"/></td>
	</tr>
	
</table>


</body>
</html>
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
		String select = request.getParameter("pageChange");

		if (select == null) {
			select = "bestitem.jsp";
		}
	%>


	<table border=1 width=500>

		<tr>
			<td colspan="2"><jsp:include page="top.jsp" flush="false" /></td>
		</tr>

		<tr>
			<td width=100><jsp:include page="left.jsp" flush="false" /></td>
			<td><jsp:include page="<%=select%>" flush="false" /></td>
		</tr>

		<tr>
			<td colspan="2"><jsp:include page="bottom.jsp" flush="false" /></td>
		</tr>
	</table>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#center{
		border:1px solid red;
	
	}

	#table1{
		width:1000px;
		background-color: gray;
		border: 1px solid black;
	}
	
	#table1 td{
		border-left: 1px solid black;
	}
	#table1 th{
		border-left: 1px solid black;
	}
</style>
<script type="text/javascript">
	
</script>

</head>
	<body>
		<div id="center" align="center">
			<table id="table1">
				<tr>
					<th>编号</th>
					<th>财务详细</th>
					<th>账单日期</th>
					<th>收入金额</th>
					<th>支出金额</th>
					<th>结余</th>
					<th>备注</th>
				</tr>
				<c:forEach var="i" items="safas">
					<tr>
						<td>sdfas</td>
						<td>fasfs</td>
						<td>fsdfsdf</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>
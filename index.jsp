<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>年月入力画面</title>
</head>
<body>
<p>カレンダーを表示する年月を入力してください。</p>

<form action="calendar.jsp" method="GET">
<p>
<select name="year">
<% for(int i = 2020; i < 2100; i++){ %>
<option value="<%=i%>"><%=i %></option> 
<% }%>
</select>
年

<select name="month">
<% for(int i = 1; i <= 12; i++){ %>
<option value="<%=i%>"><%= i %></option> 
<% }%>
</select>
月
</p>
<p><input type="submit" value="カレンダーを見る"></p>

</form>
</body>
</html>
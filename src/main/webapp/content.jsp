<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
  <title>글 내용</title>
  <link rel="stylesheet" href="content.css">
</head>
<body>
<%
  String num = request.getParameter("num");

  try {
    Context initContext = new InitialContext();
    Context envContext = (Context)initContext.lookup("java:/comp/env");
    DataSource DBConnUtils = (DataSource)envContext.lookup("jdbc/game");

    Connection conn = DBConnUtils.getConnection();
    Statement stmt = conn.createStatement();
    String sql = "SELECT * FROM board WHERE num = " + num;
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();

    String title = rs.getString("title");
    String writer = rs.getString("writer");
    String content = rs.getString("content");
    Date writeDate = rs.getDate("regdate");
%>
<h2><%= title %></h2>
<p><%= writer %> | <%= writeDate %></p>
<p><%= content %></p>

<form action="delete.jsp" method="post">
  <input type="hidden" name="num" value="<%= num %>">
  <input type="submit" value="삭제">
</form>

<a href="list.jsp">목록으로</a>

<%
    rs.close();
    stmt.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
</body>
</html>

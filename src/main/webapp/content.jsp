<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  // 파라미터에서 글 번호를 가져옴
  int num = Integer.parseInt(request.getParameter("num"));

  try {
    // 데이터베이스 연결 설정
    Context initContext = new InitialContext();
    Context envContext = (Context)initContext.lookup("java:/comp/env");
    DataSource DBConnUtils = (DataSource)envContext.lookup("jdbc/game");
    Connection conn = DBConnUtils.getConnection();
    Statement stmt = conn.createStatement();

    // 글 번호에 해당하는 게시글 정보를 데이터베이스에서 가져옴
    String sql = "SELECT * FROM board WHERE num=" + num;
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    String title = rs.getString("title");
    String writer = rs.getString("writer");
    String content = rs.getString("content");
    Date writeDate = rs.getDate("regdate");

    // 가져온 게시글 정보를 화면에 출력함
%>
<html>
<head>
  <title><%= title %></title>
</head>
<body>
<h2><%= title %></h2>
<p>작성자: <%= writer %></p>
<p>작성일자: <%= writeDate %></p>
<hr>
<p><%= content %></p>
<hr>
<p><a href="list.jsp">목록으로</a></p>
</body>
</html>
<%
    // 데이터베이스 연결 해제
    rs.close();
    stmt.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>

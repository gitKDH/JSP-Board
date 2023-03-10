<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>게시판</title>
</head>
<body>
<h2>게시판</h2>
<table border="1">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일자</th>
    </tr>
    <%
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context)initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)envContext.lookup("jdbc/game");

            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM board ORDER BY num DESC";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int idx = rs.getInt("num");
                String title = rs.getString("title");
                String writer = rs.getString("writer");
                String content = rs.getString("content");
                Date writeDate = rs.getDate("regdate");
    %>
    <tr>
        <td><%= idx %></td>
        <td><%= title %></td>
        <td><%= writer %></td>
        <td><%= writeDate %></td>
    </tr>
    <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
<a href="write.jsp">글쓰기</a>
</body>
</html>

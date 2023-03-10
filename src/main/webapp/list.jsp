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
        <th>내용</th>
    </tr>
    <%
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context)initContext.lookup("java:/comp/env");
            DataSource DBConnUtils = (DataSource)envContext.lookup("jdbc/game");

            Connection conn = DBConnUtils.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM board ORDER BY num DESC";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int num = rs.getInt("num");
                String title = rs.getString("title");
                String writer = rs.getString("writer");
                String content = rs.getString("content");
                Date writeDate = rs.getDate("regdate");
    %>
    <tr>
        <td><%= num %></td>
        <td><a href="content.jsp?num=<%=num%>"><%= title %></a></td>
        <td><%= writer %></td>
        <td><%= writeDate %></td>
        <td><%= content %></td>
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

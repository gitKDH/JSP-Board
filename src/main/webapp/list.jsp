<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 목록</title>
</head>
<body>
<h1>게시글 목록</h1>
<hr>
<%
    // 데이터베이스 연결 설정
    String url = "jdbc:mysql://127.0.0.1:3306/game?useUnicode=true&characterEncoding=utf8";
    String id = "root";
    String pw = "12345";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, id, pw);

        String sql = "SELECT * FROM board";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            int idx = rs.getInt("num");
            String title = rs.getString("title");
            String writer = rs.getString("writer");
            String content = rs.getString("content");
            Date writeDate = rs.getDate("regdate");

            // 게시글 목록 출력
%>
<%
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<button onclick="location.href='write.jsp'">글 작성</button>
</body>
</html>

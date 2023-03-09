<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
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
        Context initContext = new InitialContext();
        Context envContext = (Context)initContext.lookup("java:/comp/env");
        DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");

        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = ds.getConnection();
        Statement stmt = conn.createStatement();
        String sql = "SELECT * FROM board ORDER BY num DESC";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            int num = rs.getInt("num");
            String title = rs.getString("title");
            String writer = rs.getString("writer");
            String date = rs.getString("regdate");
    %>
    <%
        }
        rs.close();
        stmt.close();
        conn.close();
    %>
</table>
<a href="write.jsp">글쓰기</a>
</body>
</html>

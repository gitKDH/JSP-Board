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
        Context initContext = null;
        try {
            initContext = new InitialContext();
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
        Context envContext = null;
        try {
            envContext = (Context)initContext.lookup("java:/comp/env");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
        DataSource ds = null;
        try {
            ds = (DataSource)envContext.lookup("jdbc/game");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = ds.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM board ORDER BY num DESC";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int num = rs.getInt("num");
                String title = rs.getString("title");
                String writer = rs.getString("writer");
                String date = rs.getString("regdate");
    %>
    <tr>
        <td><%=num%></td>
        <td><%=title%></td>
        <td><%=writer%></td>
        <td><%=date%></td>
    </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</table>
<a href="write.jsp">글쓰기</a>
</body>
</html>

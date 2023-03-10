<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>데이터베이스 연동 확인</title>
</head>
<body>
<h2>데이터베이스 연동 확인</h2>
<%
    Connection conn = null;
    try {
        Context initContext = new InitialContext();
        Context envContext = (Context)initContext.lookup("java:/comp/env");
        DataSource ds = (DataSource)envContext.lookup("jdbc/game");

        conn = ds.getConnection();

        System.out.println("데이터베이스 연결에 성공했습니다.");
    } catch (SQLException e) {
        System.out.println("SQLException: " + e.getMessage());
    } catch (NamingException e) {
        System.out.println("NamingException: " + e.getMessage());
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {}
        }
    }
%>
</body>
</html>

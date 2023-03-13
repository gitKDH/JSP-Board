<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>게시판</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <link rel="stylesheet" href="mypage.css">
    <link rel="stylesheet" href="reset.css">
</head>
<body>
<div id="mypage_wrap">
    <div class="mypage_main_wrap">
        <h2 class="mypage">마이페이지</h2>
        <div class="status name">
            <p><img src="images/soccer-player.png" alt="player" width="100" height="100"></p>
            <p>닉네임 <br><span class="rate">내 평점 : </span></p>
        </div>
        <div class="status">
            <p class="match_text">성사된 매치</p>
            <div class="match_wrap">
                <p class="match">풋살 - xx풋살장 (6x6)</p>
                <button class="match_button">매치 상세</button>
            </div>
        </div>
        <div id="match_list">
            <div class="match_on">
                <h3>내가 올린 매치</h3>
                <table>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일자</th>
                    </tr>
                    </thead>
                    <%
                        try {
                            Context initContext = new InitialContext();
                            Context envContext = (Context) initContext.lookup("java:/comp/env");
                            DataSource DBConnUtils = (DataSource) envContext.lookup("jdbc/game");

                            Connection conn = DBConnUtils.getConnection();
                            Statement stmt = conn.createStatement();
                            String sql = "SELECT * FROM board ORDER BY num DESC";
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                int num = rs.getInt("num");
                                String title = rs.getString("title");
                                String writer = rs.getString("writer");
                                Date writeDate = rs.getDate("regdate");
                    %>
                    <tbody>
                    <tr>
                        <td><%= num %>
                        </td>
                        <td><a href="content.jsp?num=<%=num%>"><%= title %>
                        </a></td>
                        <td><%= writer %>
                        </td>
                        <td><%= writeDate %>
                        </td>
                    </tr>
                    </tbody>
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
                <a class="board_write" href="write.jsp">글쓰기</a>
            </div>
            <div class="match_on">
                <h3>관심있는 매치</h3>
                <table>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일자</th>
                    </tr>
                    </thead>
                    <%
                        try {
                            Context initContext = new InitialContext();
                            Context envContext = (Context) initContext.lookup("java:/comp/env");
                            DataSource DBConnUtils = (DataSource) envContext.lookup("jdbc/game");

                            Connection conn = DBConnUtils.getConnection();
                            Statement stmt = conn.createStatement();
                            String sql = "SELECT * FROM board ORDER BY num DESC";
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                int num = rs.getInt("num");
                                String title = rs.getString("title");
                                String writer = rs.getString("writer");
                                Date writeDate = rs.getDate("regdate");
                    %>
                    <tbody>
                    <tr>
                        <td><%= num %>
                        </td>
                        <td><a href="content.jsp?num=<%=num%>"><%= title %>
                        </a></td>
                        <td><%= writer %>
                        </td>
                        <td><%= writeDate %>
                        </td>
                    </tr>
                    </tbody>
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
            </div>
            <div class="match_on">
                <h3>수락 대기중인 매치</h3>
                <table>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일자</th>
                    </tr>
                    </thead>
                    <%
                        try {
                            Context initContext = new InitialContext();
                            Context envContext = (Context) initContext.lookup("java:/comp/env");
                            DataSource DBConnUtils = (DataSource) envContext.lookup("jdbc/game");

                            Connection conn = DBConnUtils.getConnection();
                            Statement stmt = conn.createStatement();
                            String sql = "SELECT * FROM board ORDER BY num DESC";
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                int num = rs.getInt("num");
                                String title = rs.getString("title");
                                String writer = rs.getString("writer");
                                Date writeDate = rs.getDate("regdate");
                    %>
                    <tbody>
                    <tr>
                        <td><%= num %>
                        </td>
                        <td><a href="content.jsp?num=<%=num%>"><%= title %>
                        </a></td>
                        <td><%= writer %>
                        </td>
                        <td><%= writeDate %>
                        </td>
                    </tr>
                    </tbody>
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
            </div>
        </div>
    </div>
</div>
</body>
</html>

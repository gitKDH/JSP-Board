<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
</head>
<body>
<h1>게시글 작성</h1>

<form method="post" action="insert.jsp">
    <div>
        <label for="title">제목</label>
        <input type="text" name="title" id="title" required>
    </div>
    <div>
        <label for="writer">작성자</label>
        <input type="text" name="writer" id="writer" required>
    </div>
    <div>
        <label for="content">내용</label>
        <textarea name="content" id="content" required></textarea>
    </div>
    <button type="submit">작성 완료</button>
</form>

<div class="btn-container">
    <a href="list.jsp" class="btn-cancel">취소</a>
</div>

</body>
</html>

<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" /> --%>
<!-- dao클래스 사용 -->	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" /> 
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>

<title>교재 상세 페이지 입니다......</title>
</head>
<body>

	<div class="container py-4">

		<%@ include file="menu.jsp" %> 
		<!-- 메뉴바를 외부파일로 연결 -->
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
				<h1 class="display-5 fw-bold">도서정보</h1>
				<p class="col-md-8 fs-4">BookInfo</p>
			</div>
		</div> <!-- 중간타이틀 : 상단 box -->
		
		<%
			//DAO, DTO 처리 
			// http://192.168.111.101:8080/BookMarket/book.jsp?id=ISBN1234
			String id = request.getParameter("id"); 
			// url로 넘어온 id 값을 변수에 넣음
			
			var dao = BookRepository.getInstance();
			Book book = dao.getBookById(id); // dao에 다녀와서 객체를 리턴
			/* System.out.print(book); */
		%>
		
		 <div class="row align-items-md-stretch">
		 	<div class="col-md-5">
		 		<!-- 교재 이미지용 박스 -->
		 		<img src="./resources/images/<%=book.getFilename() %>"
		 			style="width : 70%">
		 	</div>
		 
	     	<div class="col-md-6">
				<h3><b><%=book.getName()%></b></h3>
				<p><%=book.getDescription()%>
				<p><b>도서코드 : </b><span class="badge text-bg-danger"><%=book.getBookId()%></span>							
				<p><b>저자</b> : <%=book.getAuthor()%>	
				<p><b>출판사</b> : <%=book.getPublisher()%>	
				<p><b>출판일</b> : <%=book.getReleaseDate()%>					
				<p><b>분류</b> : <%=book.getCategory()%>
				<p><b>재고수</b> : <%=book.getUnitsInStock()%>
				<h4><%=book.getUnitPrice()%>원</h4>
				<p><a href="#" class="btn btn-info"> 도서주문 &raquo;</a> 
					<a href="./books.jsp" class="btn btn-secondary"> 도서목록 &raquo;</a>
	    	</div>   
	   	</div> <!-- 본문영역 : 중간 box --> 
	   	
		<%@ include file="footer.jsp" %>

	</div>

</body>
</html>
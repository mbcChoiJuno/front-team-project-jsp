<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8"); // post 메서드 한글 지원 필수코드
	
	// 파일 업로드 처리용 코드 추가
	String filename="";
	String realFolder=application.getRealPath("/resources/images"); // http://192.168.111.101:8080/BookMarket
	int maxSize = 1024 * 1024 * 5; // 5mb
	String encType = "UTF-8";
	
	MultipartRequest multipartRequest = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	// 오류 발생 시 cos.jar 버전 확인 -> cos_2.jar 마이그레이션
	// enctype="multipart/form-data" 전달시 request가 아닌 multipartRequest로 들어옴
	
	String bookId = multipartRequest.getParameter("bookId");
	String name = multipartRequest.getParameter("name");
	String unitPrice = multipartRequest.getParameter("unitPrice");
	String author = multipartRequest.getParameter("author");
	String publisher = multipartRequest.getParameter("publisher");
	String releaseDate = multipartRequest.getParameter("releaseDate");	
	String description = multipartRequest.getParameter("description");	
	String category = multipartRequest.getParameter("category");
	String unitsInStock = multipartRequest.getParameter("unitsInStock");
	String condition = multipartRequest.getParameter("condition"); // post로 전달받은 값

	Enumeration files = multipartRequest.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multipartRequest.getFilesystemName(fname);
	
	
	int price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice); 
	// 가격이 문자타입으로 전달됨, 정수타입으로 변경 

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	// 재고가 문자타입으로 전달됨, long 타입으로 변경
	
	
	BookRepository dao = BookRepository.getInstance();

	Book newBook = new Book(); // 빈객체 생성
	newBook.setBookId(bookId); // 위 전달된 값을 객체에 넣음
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(fileName);
	
	System.out.print(newBook.toString());
	dao.addBook(newBook); // 만들어진 객체를 리스트배열에 꼽는다.
	
	response.sendRedirect("books.jsp"); // 성공시 강제로 이동하는 페이지


%>
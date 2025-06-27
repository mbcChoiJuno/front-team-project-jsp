/**
 * addBook.jsp 검증용 js
 */

/*function check2(regExp, e) {
	return false;
}*/

function check(regExp, e, msg) {
	if (regExp.test(e.value)) {
		return true;
	} else {
		alert(msg);
		e.focus();
		return false;
	}
}

function error(obj, msg) {
	obj.focus();
	alert(msg);
	return false;
}

function checkAddBook () {
	 
	var bookId = document.getElementById("bookId");
	
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var description = document.getElementById("description");
	var unitsInStock = document.getElementById("unitsInStock");
	
	if (false == check(/^ISBN[0-9]{4,11}$/, bookId,
		"[도서 코드]\nISBN과 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 ISBN으로 시작하세요")) {
		return false;
	}
	
	if (name.value.length > 50 || 4 > name.value.length) {
		return error(name, "[도서명]\n최소 4자에서 최대 50자 입력");
	}
	
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		return error(unitPrice, "[가격]\n숫자만 입력하세요");
	}
	
	if (0 > unitPrice.value) {
		return error(unitPrice, "[가격]\n음수를 입력할 수 없습니다.");
	}
	
	if (unitPrice.value.length >= 7 || isNaN(unitPrice.value)) {
		return error(unitPrice, "[가격]\n100만원 미만 값만 입력하세요");
	}
	
	if (isNaN(unitsInStock.value) || unitsInStock.value.length >= 4) {
		return error(unitsInStock, "[재고]\n숫자만 입력하세요 999개 이하만 입력 가능합니다.");
	}
	
	if (100 > description.value.length) {
		return error(description, "[상세설명]\n최소 100자 이상 입력하세요");
	}
	
	/*document.newBook.submit();*/
}










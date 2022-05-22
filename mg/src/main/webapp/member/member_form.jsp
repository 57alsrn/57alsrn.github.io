<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:import url="/include/header.jsp" />


<style type="text/css">
table, tr {
	text-align: center;
}

#div2, #div1 {
	width: 60%;
	margin: 0 auto;
	text-align: center;
}

table, th, tr, td {
	border: 1px solid;
}

table {
	height: 250px;
}

#td1 {
	width: 200px;
}

.td2 {
	text-align: left;
}
</style>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script>

	function formCk() {
		if (f1.id.value == "") {
			alert("아이디를 입력해주세요!");
			f1.id.focus();
			return false;
		}
		if (f1.pwd.value == "") {
			alert("패스워드를 입력해주세요!");
			f1.pwd.focus();
			return false;
		}
		if (f1.name.value == "") {
			alert("성함을 입력해주세요!");
			f1.name.focus();
			return false;
		}
		if (f1.tel.value == "" || f1.tel.length < 10) {
			alert("전화번호를 입력해주세요!");
			f1.tel.focus();
			return false;
		}
		if (f1.postcode.value == "") {
			alert("우편번호를 입력해주세요!");
			f1.postcode.focus();
			return false;
		}
		if (f1.roadAddress.value == "") {
			alert("주소를 입력해주세요!");
			f1.roadAddress.focus();
			return false;
		} else {
			alert("회원가입을 축하드립니다! \n로그인 후 이용해주세요.")

		}

	}

	jQuery.ajaxSetup({
		cache : false
	});
	$(document).ready(function() {
		var path = "${pageContext.request.contextPath}"

		$('#idBtn').click(function() {
			var query = {
				id : $('#id').val()
			}

			if (f1.id.value == "") {
				alert("아이디 입력은 필수 입니다.");
				f1.id.focus();
				return false;
			}

			$.ajax({
				type : 'get',
				url : path + "/idCk.do",
				data : query,
				success : function(data) {
					if (data == 1) {
						alert("중복된 아이디 입니다.");
						$("#submit").attr("disabled", "disabled");
						$('#id').val('');
						$('#id').focus();

					} else {
						alert("사용가능한 ID 입니다.");
						$("#submit").removeAttr("disabled");
					}
					$("#id").keyup(function() {

						$("#submit").attr("disabled", "disabled");

					});

				}
			})
		})

	})
</script>




<br>
<br>
<div id=div1 align="center">
	<font size=5> 회원등록하기 </font>
</div>
<br>

<div id=div2>

	<form name="f1" onSubmit="return formCk()"
		action="${path}/member_formOk.do" method="post">


		<table class="table table-hover">
			<tr class="table-dark">
				<td>아이디</td>
				<td class=td2><input type=text name="id" id="id" size=20>
					<input type="button" value="아이디 중복확인" id="idBtn" size=20></td>
			</tr>
			<tr class="table-dark">
				<td>패스워드</td>
				<td class=td2><input type="password" name="pwd" size=15></td>
			</tr>
			<tr class="table-dark">
				<td>이름</td>
				<td class=td2><input type=text name="name" size=15></td>
			</tr>
			<tr class="table-dark">
				<td>전화</td>
				<td class=td2><input type=tel name="tel" size=15
					placeholder="010-0000-0000"></td>
			</tr>


			<tr class="table-dark">
				<td>주소</td>
				<td class=td2><input type="text" id="sample6_postcode"
					name="postcode" placeholder="우편번호"> <input type="button"
					onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" name="roadAddress" size=50
					placeholder="주소"><br> <input type="text"
					id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" name="extraAddress"
					placeholder="참고항목"></td>
			</tr>




			<tr class="table-dark">
				<td colspan=2 align="center"><input type="submit" id="submit"
					value="회원등록" disabled="disabled"> <input type="reset"
					value="다시작성"> <input type="hidden" name="idCheck" value="0"></td>

			</tr>
		</table>

	</form>
</div>
<BR>



<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<c:import url="/include/footer.jsp" />

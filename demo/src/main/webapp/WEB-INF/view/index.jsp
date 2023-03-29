
<%--
  Created by IntelliJ IDEA.
  User: mingu
  Date: 2023/03/03
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
    <title>mgKim</title>
    <%--    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>--%>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%--    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>--%>

    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<style>
    /* 로그인 폼을 감싸는 div 요소 스타일 */
    .login-form {
        max-width: 500px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f4f4f4;
        box-shadow: 0px 0px 10px #ccc;
    }

    /* 로그인 폼 제목 스타일 */
    .login-form h2 {
        text-align: center;
        margin-top: 0;
    }

    /* 입력 폼 요소 스타일 */
    .login-form div input[type="text"],
    .login-form div input[type="password"] {
        display: block;
        width: 100%;
        margin-bottom: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    .container {
        display: flex;
        justify-content: center;
    }

    /*.modal {*/
    /*    display: none; !* 모달 창 숨기기 *!*/
    /*    position: fixed; !* 위치 고정 *!*/
    /*    z-index: 1; !* 화면 상단에 표시 *!*/
    /*    left: 0;*/
    /*    top: 0;*/
    /*    width: 100%;*/
    /*    height: 100%;*/
    /*    overflow: auto; !* 스크롤바 표시 *!*/
    /*    background-color: rgba(0, 0, 0, 0.4); !* 흐릿한 배경 *!*/
    /*}*/

    .modal-content {
        background-color: #fefefe; /* 모달 내용 배경 */
        margin: 15% auto; /* 모달 창 상단 여백 */
        padding: 20px;
        border: 1px solid #888;
        width: 40%; /* 모달 창 너비 */
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
</style>
<script>
    $(function () {
        init();

    });

    function init() {
        var signupModal = $("#signup-modal");
        var signupBtn = $("#signup-btn");
        var closeBtn = $(".close");

        signupBtn.click(function () {
            signupModal.css("display", "block");
        });

        closeBtn.click(function () {
            signupModal.css("display", "none");
        });
        // 바깥부분 눌렀을 경우 모달창 close
        // $(window).click(function(event) {
        //     if (event.target == signupModal[0]) {
        //         signupModal.css("display", "none");
        //     }
        // });

    }

    function regUser() {

        let id = $('#regId').val();
        let regPwd = $('#regPwd').val();
        let regPwdConf = $('#regPwdConf').val();
        let regAge = $('#regAge').val();
        let regPhone = $('#regAge').val();
        let regAddr = $('#regAge').val();
        let regName = $('#regAge').val();
        let regSex = $('input[name=regSex]:checked').val();
        if ($('#checkRst').val() == '0') {
            alert('아이디 중복체크를 해주세요.')
            return false;
        } else if (id.length < 8) {
            alert('8자리 이상의 아이디를 입력해주세요.')
            return false;
        } else if (regPwd != regPwdConf) {
            alert('비밀번호와 비밀번호 확인이 다르게 입력되었습니다.')
            return false;
        } else if (regAge < 1) {
            alert('올바른 나이를 입력해주세요.')
            return false;
        } else if (regSex == null) {
            alert('성별을 체크해주세요.');
            return false;
        }
        $.ajax({
            url       : "/regUser.do"
            , type    : "post"
            , dataType: "text"
            , data    : {
                id: id
                ,regPwd : regPwd
                ,regAge : regAge
                ,regSex : regSex
                ,regName : regName
                ,regPhone : regPhone
                ,regAddr : regAddr
            }
            , success : function (data) {
                if(data == 1){
                    alert('회원가입 성공')
                    let signupModal = $("#signup-modal");
                    signupModal.css("display", "none");
                    console.log(id);
                    console.log(regPwd);
                    console.log(regAge);
                    console.log(regSex);
                }

            }
            , error : function (){
                alert('등록실패')
            }

        })

    }

    function idChk(){
        let regex = /^(?=.{1,15}$)(?=.*[A-Za-z]{5,})(?=.*\d{3,})[A-Za-z\d]{8,}$/;

        let id = $('#regId').val()
        if(regex.test(id) == false ){
            alert('아이디는 영문 5자리 이상 + 숫자 3자리 이상, 15자 이하로 해주세요.')
            $('#checkRst').val(0);
        }
        else{
            $.ajax({
                url : "/idChk.do"
                , type    : "post"
                , dataType: "text"
                ,data : {
                    idChk : id
                }
                ,success : function (data){
                    let rst = JSON.parse(data);
                    if($('#regId').val() != ''){
                        if (rst.idChklist[0] == 1) {

                            alert('중복된 아이디가 존재합니다. 다른 아이디를 이용해주세요.')
                            $('#checkRst').val(0);

                        }
                        else{
                            console.log(regex.test(id));
                            alert('사용할 수 있는 아이디 입니다.')
                            $('#checkRst').val(1);
                        }
                    }
                    else{
                        alert('아이디를 입력해주세요.')
                    }

                }
            })
        }

    }

    function login(){
        let id = $('#uId').val();
        let pwd = $('#uPwd').val();
        $.ajax({
            url : "/login.do"
            , type    : "post"
            , dataType: "text"
            ,data : {
                id : id
                ,pwd : pwd
            }
            ,success : function (data){
                console.log(data)
                if(data == ''){
                    alert('아이디 또는 비밀번호를 확인해주세요.');

                }
                else{
                    alert('로그인 성공!')
                    window.location.href = "/main.do";
                }
            }

        })
    }

</script>

<body>
<div>
    <p>${id.ID}</p> <br>
    <p>${id.PW}</p> <br>
    <p>${id.NAME}</p> <br>

</div>
<c:if test="${id == null}">
    <br><br><br>

    <div class="login-form">
        <h2>Login</h2>
        <div>
            <input id="uId" type="text" placeholder="Username">
            <input id="uPwd" type="password" placeholder="Password">
            <div class="container">
                <button type="button" id="signup-btn" class="btn btn-light">회원가입</button>

                <div id="signup-modal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <!-- 여기에 회원가입 폼을 추가하십시오. -->
                        <h2>회원가입</h2>
                        <div>
                        <%-- <img src="static/1.jpg">--%>
                            <input type="hidden" id="checkRst" value=0>
                            <div>

                                <button style="float: right; margin-bottom: 20px;" class="btn btn-light" onclick="idChk()">
                                    중복체크
                                </button>
                            </div>
                            <label for="regId">아이디:</label>
                            <br><input type="text" id="regId" name="username"><br>
                            <label for="regPwd">비밀번호:</label>
                            <input type="password" id="regPwd" name="password"><br>
                            <label for="regPwdConf">비밀번호 확인:</label>
                            <input type="password" id="regPwdConf" name="confirm-password"><br>
                            <label for="regAge">이름</label>
                            <input type="text" id="regName" name="confirm-password"><br>
                            <label for="regAge">나이</label>
                            <input type="text" id="regAge" name="confirm-password"><br>
                            <label for="regAge">휴대번호</label>
                            <input type="text" id="regPhone" name="confirm-password"><br>
                            <label for="regAge">주소</label>
                            <input type="text" id="regAddr" name="confirm-password"><br>
                            <p>성별</p>
                            <div style="margin : auto">
                                <input type="radio" name="regSex" value="1">&nbsp;남자 &nbsp&nbsp;
                                <input type="radio" name="regSex" value="2">&nbsp;여자
                            </div>
                            <br>
<%--                            <label for="regEmail">이메일:</label>--%>
<%--                            <input type="text" id="regEmail" name="email"><br>--%>
                            <div style="text-align: center">
                                <input class="btn btn-light" style="width : 100px; margin: auto " id="regBtn"
                                       onclick="regUser();" value="가입하기">
                            </div>
                        </div>

                    </div>
                </div>
                &nbsp;
                <button type="button" class="btn btn-light" onclick="login()">로그인</button>



            </div>
        </div>
    </div>
</c:if>
<div><c:if test="${id != null}">
    <button type="button" class="btn btn-light" onclick="logOut()">로그아웃</button>
</c:if>
</div>


</body>

</html>

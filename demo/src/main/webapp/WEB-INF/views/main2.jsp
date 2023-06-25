<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
    <title>빡공하자
    </title>
    <%--    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>--%>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>

<script>
    var MainVo = '${MainVo}'

    $(function () {
        init();
        $("#sId").on("keyup",function(key){
            if(key.keyCode==13) {
                searchList();
            }
        });

        var grid;

    });


    // 초기화 실행
    function init() {

    }
         //  function searchList() {

        // $.ajax({
        //     type     : "post"
        //     , url    : "/list.do"
        //     , success: function () {
        //         $('#List').val();
        //         location.replace('/list.do')
        //         alert("조회성공");
        //     }
        // });
   // }
    var selectData= {} ;
    var a;
    function searchList(){
        $('#grid').empty();
        var grid = new tui.Grid({
            el: $('#grid')[0],
            //document.getElementById('grid'),
            columns: [
                {
                    header: '아이디',
                    width : 200,
                    name  : 'id'
                },
                {
                    header: '이름',
                    name  : 'name',

                }
                ,
            ]
            ,draggable: true




        });

        $.ajax({
            url : "/list.do"
            ,type : "post"
            ,dataType : "text"
            ,data : {
                id : $('#sId').val()
            }
            ,success : function (data){


                 let  a = JSON.parse(data);
                 var c ;
                console.log(a)
                $.each(a, function(idx, item){

                })
                let rist = [];
                let cu = {};
                rist.push(a['MainVo']);
                console.log(rist)
                for(var i=0;i<rist.length;i++){
                    cu = rist[0]

                }
                console.log(cu)
                grid.resetData(cu)
            }

        })


    }



</script>

<body>
<div class="container">
    <div class="hi">
        <br>
    </div>

    <div class="hello">
        <h2>안녕하세요.</h2>
        <input class="ms-3" type="text" id="sId">
        <button class="btn btn-light ms-3" onclick="searchList()" id="idSearch">검색</button>
        <button type="button" class="btn btn-dark ms-3" onClick="location.href='/'">홈으로</button>

        <!-- :value="name" @keyup="update"> -->
        <div class="class"></div>
    </div>

    <br>
    <br>

    <div id="List">
        <div id="grid" class="grid"></div>

        <input type="text" name="" id="z">
        <h3> ${MainVo}</h3>

        <c:forEach items="${MainVo}" var="list">
            <tr>
                <td>${list.id}</td>
                <td>${list.name}</td>
            </tr>
        </c:forEach>
    </div>
</div>
</body>

</html>
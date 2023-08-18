<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/project/css/reset.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <title>회원가입</title>
    <link href="/project/image/square_logo.png" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="/project/css/style.css"/>
    <link rel="stylesheet" href="/project/css/contents.css"/>
    <link rel="stylesheet" href="/project/css/register.css"/>
    <link rel="stylesheet" href="/project/css/common.css"/>
    <script src="/project/js/common.js"></script>
    <script>
    	function idCheck() {
    		if ($("#id").val().trim() == "") {
    			alert("아이디를 입력하세요");
    			$("#id").focus();
    		}else {
    			$.ajax({
        			url: 'dupCheck.do?id='+$("#id").val(),
        			success : function(res) {
        				if (res == 'usable') {
        					alert('사용가능');
        				} else {
        					alert('사용불가');
        					$("#id").val(""); 
        				}
        			}		
        		});
    		}
    	}
    	
    	function goSave() {
    		if($("#id").val().trim() == '') {
    			alert('아이디를 입력하세요');
    			$("#id").focus();
    			return;
    		}
    		let con = true;
    		$.ajax({
    			url: 'dupCheck.do?id='+$("#id").val(),
    			async: false,
    			success : function(res) {
    				if (res == 'notusable') {
    					alert('아이디가 중복되었습니다.');
    					$("#id").val(""); 
    					con = false;
    				}
    			}		
    		});
    		if(!con) return;
    		if($("#password").val().trim() == '') {
    			alert('비밀번호를 입력하세요');
    			$("#password").focus();
    			return;
    		}
    		if($("#pswd2").val().trim() == '') {
    			alert('비밀번호 확인을 입력하세요');
    			$("#pswd2").focus();
    			return;
    		}
    		if($("#password").val() != $("#pswd2").val()) {
    			alert("비밀번호와 비밀번호 확인값이 다릅니다.")
    			$("#pswd2").val("");
    			$("#pswd2").focus();
    			return;
    		}
    		if($("#name").val().trim() == '') {
    			alert('닉네임을 입력하세요');
    			$("#name").focus();
    			return;
    		}
    		if (confirm('가입하시겠습니까?')) {
    			$("#frm").submit();
    		}
    	}
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
</head>
<body>
    <div class="wrap">

 <!-- header -->
      <div id="header">
        <img src="/project/image/org_logo.png" id="logo"/>
      </div>

      <!-- wrapper -->
      <div id="wrapper">
        <form name="frm" id ="frm" action="regist.do" class="reg_form" method="post" enctype="multipart/form-data">
          <!-- content-->
          <div id="content">
            <!-- ID -->
            <div>
              <h3 class="join_title">
                <label for="id">아이디</label>
              </h3>
              <span class="reg_login_input">
                <input type="text" name="id" id="id" class="int" maxlength="20" />
                <!-- <span class="step_url">@omok.com</span> -->
              </span>
              <!-- <span class="input_error"></span>  -->
              <span class="id_check"><a href="javascript:idCheck();"  class="btn bgGray" style="float:right; width:auto; clear:none; background-color: #bddc89">중복확인</a></span>
            </div>

            <!-- PW1 -->
            <div>
              <h3 class="join_title"><label for="password">비밀번호</label></h3>
              <span class="reg_login_input">
                <input type="password" name = "password" id="password" class="int" maxlength="20" />
                <!-- <span id="alertTxt">사용불가</span> -->
                <!-- <img
                src="../image/m_icon_pass.png"
                id="pswd1_img1"
                class="pswdImg"
              /> -->
              </span>
              <!-- <span class="input_error"></span>  -->
            </div>

            <!-- PW2 -->
            <div>
              <h3 class="join_title">
                <label for="pswd2">비밀번호 재확인</label>
              </h3>
              <span class="reg_login_input_check">
                <input type="password" id="pswd2" class="int" maxlength="20" />
                <!-- <img
                src="../image/m_icon_check_disable.png"
                id="pswd2_img1"
                class="pswdImg"
              /> -->
              </span>
              <!-- <span class="input_error"></span>  -->
            </div>

            <!-- NAME -->
            <div>
              <h3 class="join_title"><label for="name">닉네임</label></h3>
              <span class="reg_login_input">
                <input type="text" name="nickname" id="name" class="int" maxlength="20" />
              </span>
              <!-- <span class="input_error"></span>  -->
            </div>


            <div class="space"></div>
            <button
              type="button"
              id="btnJoin"
              class="green_button"
              style="background-color: #bddc89"
              onclick="goSave();"
            >
              가입하기
            </button>
            <div class="space"></div>
            <button type="button" id="btnJoin" class="green_button" onclick="history.go(-1)">
              나가기
            </button>
            
          </div>
          <!-- content-->
        </form>
      </div>
    </div>
    <!-- wrapper -->
    <script src="/project/js/main.js"></script>
      
    </div>
</body>
</html>
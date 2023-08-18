<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.project.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<% BoardVO board = (BoardVO) request.getAttribute("board"); %>
<% PlayerVO player = (PlayerVO) session.getAttribute("loginSess"); %>
<%
 	response.setHeader("Refresh", "1");
%>
<%@ page import="java.text.*" %>
<% DecimalFormat df = new DecimalFormat("0.##");%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>오목게임</title>
    <link href="/project/image/square_logo.png" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="/project/css/reset.css" />
    <link rel="stylesheet" href="/project/css/gamelayout.css" />
    <!-- 사용자 세션에서 받은 넘버로 스톤 결정 -->
	<style type="text/css">
		.st:hover {
			<% if (board.getPlayer1() == player) {%>
  			background-image: url(/project/image/stone1.png);
  			<%} else {%>
  			background-image: url(/project/image/stone2.png);
  			<%} %>
		}
	</style>
  </head>
  <body>
    <div class="wrap">
      <header id="header">
        <div class="time">
          <p>30초</p>
        </div>
        <div class="roomArea">
          <div id="roomNo">
            <span> NO.<%=board.getBoard_pk() %></span>
          </div>
          <div id="roomName">
            <span> <%=board.getTitle() %></span>
          </div>
        </div>
        <div class="time">
          <p>30초</p>
        </div>
      </header>
      <main id="main">
        <div class="player">
          <div class="playerInfo">
            <div class="playerName">
              <p><%=board.getPlayer1().getNickname()%></p>
            </div>
            <div class="imgArea">
              <img src="/project/image/player1.png" alt="" />
            </div>
            <div class="textArea">
              <p> <%=board.getPlayer1().getVictory()%> 승 <%=board.getPlayer1().getTotal() - board.getPlayer1().getVictory()%>패</p>
              <p><%= Math.round((double)board.getPlayer1().getVictory() / board.getPlayer1().getTotal() * 100)%> %</p>
              <p>선공!</p> 
            </div>
          </div>
        </div>
        <div class="board">
          <div class="stone">
            <img src="/project/image/stone1.png" alt="" width="90px"/>
          </div>
          <div class="boardMain">
            <ul>
              <% for (int i = 0; i < board.getMap().length; i++) {%>
              <li class="row">
                <ul>
                  <% for (int j = 0; j < board.getMap()[0].length; j++) {%>
                  <% if (board.getMap()[i][j].equals("st1")) {%>
                  <li class="columns"><div class="st st1"></div></li>
                  <%} else if (board.getMap()[i][j].equals("st2")) {%>
                  <li class="columns"><div class="st st2"></div></li>
                  <%} else {%>
                  <li class="columns"><div class="st" onClick="location.href='put?roomNo=<%=board.getBoard_pk() %>&row=<%=i %>&col=<%=j %>'"></div></li>
                  <%} %>
                  <%} %>
                </ul>
              </li>
              <%} %>
            </ul>
          </div>
          <div class="stone">
            <img src="/project/image/stone2.png" alt="" width="100px" />
          </div>
        </div>
        <div class="player">
       
          <div class="playerInfo">
          <% String player2;
          	 int victory;
          	 int defeat = 0;
          	 int total;
          	 double odd;
          	 
 			if(board.getPlayer2()==null){
 				player2="";
 				victory=0;
 				total=0;
 				odd = 0;
 			}else{
 				player2=board.getPlayer2().getNickname();
 				victory=board.getPlayer2().getVictory();
 				defeat = board.getPlayer2().getTotal() - board.getPlayer2().getVictory();
 				odd = (double)board.getPlayer2().getVictory()/board.getPlayer2().getTotal()*100;
 			}
          %> 
            <div class="playerName">
                <p><%=player2%></p>
            </div>
            <div class="imgArea">
              <img src="/project/image/player2.png" alt="" />
            </div>
            <div class="textArea">
              <p><%=victory%>승 <%=defeat %> 패</p>
              <p> <%=Math.round(odd)%> %</p>
              <p> 후공! </p>
            </div>
          </div>
        </div>
      </main>
      <footer id="footer">
        <!-- <div class="watchPlayer">
          <p>ê´ì ì ëªë¨(ìë¦¬)</p>
        </div>
        <div class="chatting">
          <p>ì±íì°½ ìë¦¬</p>
        </div> -->
        <div class="btn">
          <button class="favorite styled" type="button" onclick="location.href='back?roomNo=<%=board.getBoard_pk() %>'">무르기</button>
          <% if (board.turn != 0) {%>
          <button class="favorite styled" type="button" onclick="location.href='surrender?roomNo=<%=board.getBoard_pk() %>'">기권</button>
          <%} else { %>
          <button class="favorite styled" type="button" onclick="location.href='surrender?roomNo=<%=board.getBoard_pk() %>'">나가기</button>
          <%} %>
        </div>
      </footer>
    </div>
  </body>
</html>

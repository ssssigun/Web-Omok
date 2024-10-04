# 웹 오목 게임
<p align="center">
<br><img src=./src/main/webapp/image/readme/omokLogin.png width="90%" /><br><br> 
</p>
스프링 + JSP를 사용하여 만든 웹 오목 게임
<br/>
<br/>

**이 프로젝트는 상업용 프로적트가 아니며, 캐릭터 및 배경의 저작권은 원작자(스마일 게이트)에게 있습니다.**

## 👨🏻‍💻 멤버
 - 김지원 (팀장)
    - 랭킹판
 - 이시권
    - 로그인, 로비 정보창
 - 이창준
    - 게임 진행, 로비 방생성
 - 박정은 
    - 화면 설계 및 전체 디자인 적용
 - 윤서영 
    - 회원가입, 디자인 보조

## 🖥️ 프로젝트 소개
웹 환경에서 소켓(Socket)을 사용하지 않고 구현한 오목 게임입니다. 스프링(Spring)을 처음 배우면서 팀원들과 함께 무언가를 만들어보자는 생각으로 시작한 프로젝트입니다.<br>

## ⏰ 개발 기간
* 23.04.21 ~ 23.05.18


### ⚙️ 기술 스택

- **Language** : Java 
- **Framework** : Spring
- **Database** : Oracle
- **ORM** : Mybatis

## 📝 기획 및 설계

| 아키텍쳐 |
| :---: |
| <br><img src=./src/main/webapp/image/readme/omokArchitecture.png width="90%" /><br><br> |
|  |

| ERD |
| :---: |
| <br><img src=./src/main/webapp/image/readme/omokERD.png width="90%" /><br><br> |
|  |

| 화면 설계 |
| :---: |
| <br><img src=./src/main/webapp/image/readme/omokDesign.png width="90%" /><br><br> |
||

### 📌 주요 기능
| 로그인 |
| :---: |
| <br><img src= ./src/main/webapp/image/readme/omokLogin.png width="90%" /><br><br> |
| 회원 정보를 받아 로그인하는 화면입니다. 오른쪽엔 회원들의 랭킹이 표시됩니다.|

| 회원 가입 |
| :---: |
| <br><img src= ./src/main/webapp/image/readme/omokJoin.png width="90%" /><br><br> |
| 생성 규칙에 맞게 회원 정보를 받아 회원 가입하는 화면입니다. |

| 로비 |
| :---: |
| <br><img src= ./src/main/webapp/image/readme/omokLobby.png width="90%" /> <br><br> <img src= ./src/main/webapp/image/readme/omokRoom.png width="90%" /><br>|
| 원하는 방을 찾아 게임에 참여하는 로비입니다. 사용자가 방을 생성할 수도 있습니다. 왼쪽엔 본인의 정보가 표시되어있습니다. |


| 랭킹판 |
| :---: |
| <br><img src= ./src/main/webapp/image/readme/omokRank.png width="90%" /><br><br> |
| 회원들의 승률을 기준으로 랭킹을 보여주는 랭킹판입니다. |

| 게임방|
| :---: |
| <br><img src= ./src/main/webapp/image/readme/omokPlay.png width="90%" /><br><br> |
| 게임을 진행하는 게임방입니다. 순서대로 돌을 놓고 5개가 되면 승부가 마무리됩니다.|
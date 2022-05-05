 # healthJava-Spring-Project
Trainer Matching Web Site with Spring Framework

## Spring Framework를 이용한 트레이너 중계 플랫폼 웹 사이트

![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=java&logoColor=white)
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white)

![](../header.png)

### 개요
- 팀프로젝트로 진행하여 스프링 프레임워크를 이용해서 트레이너 중계 플랫폼 웹 사이트 제작 <br>
- 장기화된 코로나로 인해 새로운 취미를 찾게되면서 운동을 하는 사람들이 늘게 되었습니다. <br>
- 개인이 많이 하는 운동인 헬스를 이용하면 좋을 것 같아 PT 트레이너와 회원의 중계가 가능한 사이트를 만들게 되었습니다.

### 팀 관련
- 총 4명
- Front 2명 (주로 View 관련, JSP, JavaScript)
- Back 2명 (서비스 로직 : Sql, Controller, Service 등등)

## 개발 기간
- 2022.03.24 ~ 2022.04.13
- 총 22일 소요

## 개발 환경 

```sh
Windows10
Oracle
apache-tomcat-9.0.56
STS
Eclipse
```

## 사용 예제


### 메인 페이지 상위
<br>
<img src="https://user-images.githubusercontent.com/89288109/164006439-9ca7fc3e-66a2-46e7-a60c-6cb5580872b1.png" width="700" height="200">

- 로그인, 회원가입 
- 로그인 시 마이페이지, 캐시충전, 로그아웃 가능
- 관리자로 로그인 했을 시에는 관리자 페이지 따로 존재
- 등록된 트레이너 검색 가능, 동적 쿼리를 이용해 처리


### 메인 페이지 하위
<br>
<img src="https://user-images.githubusercontent.com/89288109/164007091-3e34bc90-a371-416b-918f-b92a747e3242.png" width="700" height="500">

- 이달의 트레이너 상위 3개의 목록 
- 많이 도움된 리뷰(좋아요 많이 달린 순)상위 3개 목록 
- 클릭 시 해당 트레이너 포스팅 페이지로 이동한다.


### 캐시 충전 
<br>
<img src="https://user-images.githubusercontent.com/89288109/164007870-efc8ed0f-02b4-4365-9c2c-b093a156836e.png" width="700" height="500">

- 캐시 충전은 계좌 잔액 부족시와 결제 비밀번호가 일치하지 않을 경우 
- 유효성 검사를 거쳐 메시지를 띄움


### 계좌 관리
<br>
<img src="https://user-images.githubusercontent.com/89288109/164008431-4f5bfa6a-d326-4d64-8908-e0baf1f88ae9.png" width="700" height="500">
<br>
<img src="https://user-images.githubusercontent.com/89288109/164008620-709afcef-1ce5-4a06-8aab-54d853b610f9.png" width="700" height="200">

- 계좌 등록 시에 공백 유효성 검사 처리
- 계좌 비밀번호는 암호화하여 저장
- 은행정보는 enum으로 매핑


### 게시판

#### 공지사항

<br>
<img src="https://user-images.githubusercontent.com/89288109/164009176-c6443e63-9f71-4bfe-9f49-ed17ab5dfcab.png" width="700" height="300">
<br>

- 페이징 처리
- 게시글 번호 처리
- 관리자만 작성이 가능

#### FAQ

<br>
<img src="https://user-images.githubusercontent.com/89288109/164009514-8ec29926-bfd0-4d5f-a831-6577a3a56121.png" width="700" height="300">
<br>

- 페이징 처리 & 게시글 번호 처리
- 관리자만 작성이 가능
- 동적 쿼리를 이용해 검색 정보와 카테고리 정보와 페이징 정보 동시 처리

#### 1:1 문의

<br>
<img src="https://user-images.githubusercontent.com/89288109/164009903-467b09fa-1f6a-4b73-a665-f61cf44321ab.png" width="700" height="300">
<br>
<img src="https://user-images.githubusercontent.com/89288109/164009910-5c8530da-5949-40e6-8cea-5a384ea865d5.png" width="700" height="300">
<br>

- 내가 작성한 1:1문의 내역 목록과 작성 버튼
- 관리자만이 답글을 달아줄 수 있음
- 카테고리 선택 가능


### 1회 PT 신청

#### 1회 PT 신청 모달

<br>
<img src="https://user-images.githubusercontent.com/89288109/164011567-8c4d4041-a2b4-4e66-aa75-2975d2d2034f.png" width="700" height="700">
<br>

- 트레이너 포스팅 페이지에서 1회 PT 신청 버튼을 누를 시 생기는 모달 창
- 결제 비밀번호 유효성 검사 기능


#### 1회 PT 신청 목록 페이지(회원 전용)

<br>
<img src="https://user-images.githubusercontent.com/89288109/164011086-c50daf30-bc50-4b27-8d6f-d3e4a2334717.png" width="700" height="400">
<br>

- 회원이 신청한 1회 PT 신청 목록들
- 상태가 완료일 시 PT가 완료되었다는 의미로 리뷰 작성 가능


#### 1회 PT 신청 목록 페이지(트레이너 전용)

<br>
<img src="https://user-images.githubusercontent.com/89288109/164011096-57d5d975-8759-4b7c-99f9-532b96ebd32f.png" width="700" height="400">
<br>

- 트레이너 본인에게 PT 신청한 회원 목록들
- 상태 미확인(신청 확인 전) - 확인(신청 확인 후) - 완료(PT 완료)로 상태 변경 가능 버튼


### 포스팅 페이지

<br>
<img src="https://user-images.githubusercontent.com/89288109/164013191-4b81aada-c90b-4213-99df-30a4143516a5.png" style="text-align:center;" width="500" height="1000">
<br>
<img src="https://user-images.githubusercontent.com/89288109/164015943-36bba6f5-8f8b-4232-b8b0-67dad207a22b.png" style="text-align:center;" width="600" height="450">
<br>


- 트레이너 정보와 포스팅 정보를 담은 페이지
- 1회 PT 신청 및 PT 문의 버튼 (회원 전용)
- 1달 마다 주기적으로 결제가 필요하다. (@Schedule를 사용해서 자동 결제 구현 캐시 차감 방식) => 결제가 실패할 경우 포스팅 페이지를 이용할 수 없음
- 트레이너 마이페이지에서 작성 및 수정 가능
- kakao map api를 이용해서 센터 주소 표현
- 리뷰 좋아요는 로그인 사용자만 가능

### 트레이너 신청 페이지

<br>
<img src="https://user-images.githubusercontent.com/89288109/164014857-369c8fbb-a6a3-4b10-ae7a-33729547cb0b.png" width="500" height="600">
<br>

- 트레이너 마이페이지에서 트레이너 신청 및 수정 가능
- 트레이너 신청 완료 시 자동으로 예비트레이너 등급으로 등업
- 관리자 확인 후 트레이너로 등업 가능
- kakao api를 이용하여 주소 등록
- 신청 시 15,000원 결제 필요 (계좌 번호 및 잔액 유효성 검사)

### 리뷰 페이지

#### 리뷰 작성 및 수정

<br>
<img src="https://user-images.githubusercontent.com/89288109/164015237-f0e37fac-aef9-41f7-a81c-c28838e9963d.png" width="700" height="400">
<br>

- 1회 PT 완료 시 리뷰 작성 가능
- 1회 PT 신청 목록에서 리뷰 수정 가능

#### 리뷰 목록 페이지

<br>
<img src="https://user-images.githubusercontent.com/89288109/164015588-76e94559-2efe-46b9-9f92-78c3d2247d1d.png" width="700" height="500">
<br>

- 본인이 작성한 리뷰 목록 페이지
- 수정 및 삭제 가능
- 페이징 처리

### 관리자 페이지

<br>
<img src="https://user-images.githubusercontent.com/89288109/164016498-67761458-9e7c-485a-b3e4-e946e9902e31.png" width="700" height="500">
<br>
<img src="https://user-images.githubusercontent.com/89288109/164016497-cbc9b714-574b-43e3-9569-2d00a1403556.png" width="700" height="500">
<br>
<img src="https://user-images.githubusercontent.com/89288109/164016490-bc51b8bd-3e11-4e92-b050-a3aa8deb3a66.png" width="700" height="800">
<br>

- 회원 관리 상태 변경 탈퇴회원, 일반회원, 관리자 자바스크립트 이벤트 get 요청 처리
- 트레이너 관리 페이지에서 상세 보기 클릭 시 트레이너 상세 모달 창
- 트레이너 상태 변경 가능 예비트레이너, 트레이너
- 수상 경력 및 이력은 ajax로 처리


## 정보

### DB ERD Model
<img src="https://user-images.githubusercontent.com/89288109/166461660-751e5e4f-192d-4607-915b-8433088cd4da.png" width="800" height="500">

### 중계 플랫폼 사이트 
- http://www.itwill.xyz/healthJava/ 
- 위 링크에서 확인 가능합니다.

### 프로젝트 회고
- https://sweeeetgoguma.tistory.com/entry/%ED%8C%8C%EC%9D%B4%EB%84%90-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%ED%8A%B8%EB%A0%88%EC%9D%B4%EB%84%88-%EB%A7%A4%EC%B9%AD-%EC%82%AC%EC%9D%B4%ED%8A%B8?category=931977

© 2022 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About

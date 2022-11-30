# Spring-AlpacaAuction
AlpacaAuction 프로젝트는 많은 사람들이 여러가지 카테고리를 이용 할 수 있는 플랫폼입니다.
 
----

+ 기술스택

         Java
         Spring
         Oracle Data Base
         JavaScript
         Ajax
         HTML/CSS
         BootStrap
         GitHub(프로젝트 관리)
 
 ----
 
 + 기능적 요구사항
 
1.사용자는 회원가입을 하고 이를 통한 로그인을 할 수 있다. 아이디를 찾는 기능을 제공한다.

2.로그인 후에는 해당 회원의 정보를 토대로 마이페이지 기능을 이용할 수 있다.

3.마이페이지에서는 사용자의 프로필을 수정할 수 있다. 프로필 수정 시에는 아이디를 제외한 정보의 수정이 가능하다.

4.사용자가 구매 및 판매한 경매 상품의 목록을 볼 수 있으며 입찰중인지 입찰 완료인지 또는 결제 완료인지 확인 할 수 있다. 또한 
  구매완료한 상품에 한하여 리뷰 및 별점을 작성 할 수 있다.
  
5.메인화면에서는 경매 상품 목록이 나오며, 도서,미술품,취미/수집,중고 카테고리별로 볼 수 있고, 조회순 또는 마감임박순으로 볼 수 있다.

6.각 상품의 상세페이지는 판매자가 등록한 상품의 정보 및 가격, 관심상품 등록, 입찰을 할 수 있으며, 마감일에 내 입찰가가 최고가이면 
  입찰 성공이고 송금 확인이 되면 관리자가 구매 완료 승인을 하고 리뷰를 작성 할 수 있다.
  
7.사용자는 상품 정보 및 경매 기한과 입찰시작가 입찰 단위를 설정하여 판매 상품을 등록 할 수 있다.

8.리뷰게시판에서 모든 리뷰 목록을 볼 수 있으며 작성자/제목/내용별로 검색하여 조회가능하고, 리뷰 상세보기에서 댓글을 작성 할 수 있다.

----

### Project planning
+ 프로젝트 진행과정 : 전체 기간 35일

----
### Data Base Design
+ DB ERD
![스크린샷(13)](https://user-images.githubusercontent.com/112607627/204698050-99d0a957-89b5-4424-9ece-16f699f40be1.png)

----
### LayOut Design

 
 <div align="center">1.메인 화면
 
<img src="https://user-images.githubusercontent.com/112607627/204716709-26eaae2b-332d-40f5-a1c5-0b6846c62e98.png" />


2.회원가입, 로그인, 아이디 찾기

<img src="https://user-images.githubusercontent.com/112607627/204701263-cc88239d-5fc7-4a87-b382-241671f891e7.png" width="250" height="250"/><img src="https://user-images.githubusercontent.com/112607627/204701265-04db7161-8748-463c-a2db-200d3c9b16e3.png" width="250" height="250"/><img src="https://user-images.githubusercontent.com/112607627/204701266-1f7d1349-7b65-4df7-b08a-df5bd83b3130.png" width="250" height="250"/>


3.마이페이지,정보수정

<img src="https://user-images.githubusercontent.com/112607627/204702467-d001f20c-c4f6-4da4-ae41-7fcb687fc67d.png" width="250" height="250"/><img src="https://user-images.githubusercontent.com/112607627/204702634-3d789864-98ff-48ad-a862-2d4a8ea8e6c1.png" width="250" height="250"/>


4.상품등록,상품 상세정보,입찰 페이지

<img src="https://user-images.githubusercontent.com/112607627/204703024-e91e257c-e198-4ed4-827f-8d06f50e638e.png" width="250" height="250"/><img src="https://user-images.githubusercontent.com/112607627/204702861-53e13d5f-4975-4c25-b871-f295f35d4cc7.png" width="250" height="250"/><img src="https://user-images.githubusercontent.com/112607627/204702868-cebb6da3-4f64-4857-93eb-c792bee177a2.png" width="250" height="250"/>


5.관심물품, 내가 쓴 리뷰, 구매현황, 판매현황
 
<img src="https://user-images.githubusercontent.com/112607627/204715430-882b7293-1722-4be4-9077-2420d604b760.png" width="250" height="250"/><img src="https://user-images.githubusercontent.com/112607627/204715433-a9fd2321-9d20-40f8-bc4c-3d1178c70ee6.png" width="250" height="250"/>

<img src="https://user-images.githubusercontent.com/112607627/204715435-204197d1-12ea-44a9-98a1-7b10e91442cc.png" width="250" height="250"/><img src="https://user-images.githubusercontent.com/112607627/204715437-981d8f30-dff1-466a-99ae-65b0c20c301c.png" width="250" height="250"/>


6.리뷰 작성, 리뷰 게시판, 리뷰 상세보기, 리뷰 댓글 

<img src="https://user-images.githubusercontent.com/112607627/204716031-b62c9fa6-051e-4b82-915a-a285c88684a1.png" width="250" height="250"/><img src="https://user-images.githubusercontent.com/112607627/204716023-fcaa49a6-769b-49dd-a642-b4bc39de2ed8.png" width="250" height="250"/>

<img src="https://user-images.githubusercontent.com/112607627/204716025-a3fb21fb-a74d-467b-b3db-942181f61915.png" width="250" height="250"/><img src="https://user-images.githubusercontent.com/112607627/204716028-f82750da-35b7-4014-bf7c-d68c21814f96.png" width="250" height="250"/>

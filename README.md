
간단한 게시판

Controller : User, Post  
 - Post
   : post#index -> 모든 게시글을 보여준다. (root page)
     post#new -> 새로운 게시글을 만드는 form을 보여준다.
     post#create -> new에서 작성한 글을 쓴다. == DB에 저장한다.
     post#show -> /user/show/:id 해당하는 글 1개만 보여준다.
     post#modify -> 게시글을 수정할 수 있는 form을 보여준다. 
     post#update -> Modify에서 수정된 글을 DB에 새로 저장한다.
     post#destroy -> show에서 확인한 글을 지울수 있게 한다.

 -User 
   : user#index -> 모든 유저를 보여준다.
     user#new -> 새로운 유저를 만드는 form을 보여준다.(회원가입)
     user#create -> new에서 작성한 회원 정보를 DB에 저장한다.
     user#show -> /user/show/:id 해당하는 유저 1명만 보여준다.
     user#login -> form에 로그인이 가능한 페이지를 보여준다.
     user#login_process -> 로그인 정보와 db 유저 정보를 비교해 유저를 로그인 시킨다.

Model

 Post 모델
   String title
   String content

 User 모델
   String email
   String password


1:N : User & Post / Post& Reply 
 - 한 User가 여러 Post를 가질수 있다.
 - Post는 특정 한 User에 속해야 한다.



----
oauth 알아보기
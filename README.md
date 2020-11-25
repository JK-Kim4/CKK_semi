#Cooking_King
----------------------


### 프로젝트 기획 이유
> 직장인들에게 자기계발의 필요성에 대해 물었을 때 90% 이상이 긍정적인 대답을 내놓았다.
> 이렇듯 자기계발은 현대인에게 있어서 필수적인 요소로 자리잡게되었다. 
> 특히 요즘들어 전공분야를 너머 취미로만 여겨졌던 분야에 있어서 자신을 가꾸는 현대인들의 비중이 늘어나게 되었고,
> '혼밥', '집밥', '골목식당', '백종원' 등과 같은 키워드와 함께 요식산업에 대한 관심 또한 날로 증가하게되었다.
> 이러한 이유로 요리에 관심을 갖게 된 사용자를 수업 개설을 원하는 튜터와 연결시켜주는 '원데이 클래스 매칭 시스템'을 기획함으로써
> 사용자들에게 편의를 제공하려한다.
-----------------------

### 주요 테이블 

+ ALL_USER ( 회원 관리용 테이블 )
  + 시스템에 가입되어있는 회원의 정보를 저장하는 테이블
  + USER_ID COLUMN 을 Primary key로 사용
  + RESUME_YNP COLUMN 의 상태값을 사용하여 일반회원, 튜터회원의 상태를 구분
  
+ TUTOR_RESUME ( 튜터 이력서 관리 테이블)
  + 제출 이력서의 정보를 저장하는 테이블
  + 일반 회원에서 튜터 회원으로 전환을 원할 경우, 이력서를 작성하면 해당 테이블에 정보값이 입력
  + TUTOR_ID 값을 ALL_USER테이블에서 참조(Foreign key)하여 Primary key로 사용
  
+ POINT_LOG ( 포인트 입출력 기록 테이블 )
  + 시스템 내에서 사용될 포인트를 충전 및 환전 시, 그 정보가 기록되는 테이블
  + 해당 테이블에 정보가 기록되면 ALL_USER의 포인트 총량 컬럼에 update가 되는 트리거가 대입되어있음
  + POINT_LOG의 고유 시퀀스값인 LOG_NO를 Primary key로 사용
  
+ CS_BOARD ( 고객센터 게시판 관리 테이블 )
  + 고객센터 작성 글의 내용을 저장하는 테이블
  + 비밀글, 답변여부를 해당 컬럼으로 확인 가능
  + CS_BOARD의 고유 시퀀스값인 CS_NO를 Primary Key로 사용
  
+ CLASS ( 등록된 수업 관리 테이블 )
  + 수업(클래스) 게시판에 등록된 수업의 정보를 저장하는 테이블
  + 해당 테이블에서 입력받은 수강 종료 날짜, 지원 종료 날짜는 Oracle schduler를 통해 종료 여부가 체크됨
  + CLASS의 고유 시퀀스값인 CLASS_NO를 Primary Key로 사용


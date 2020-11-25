semiproject  
----------------------
### 프로젝트명 : Cooking - king
##### 조원 :  박예빈 김가영 김종완 박준혁 이호근 
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

-----------------------

### 주요 기능  (해당 부분은 작성자 본인이 구현한 기능 위주로 작성되었습니다.)
  
+ 이력서 관리
  + 회원 가입시 초기 상태는 일반 회원으로 가입되며, 튜터 등급으로 변경을 원할 경우 '이력서 관리' 메뉴를 통해 이력서를 제출, 심사에서 승인을 받게되면 튜터 등급으로 변경이 되게된다.
  + '이력서 관리' 메뉴를 클릭 시 tutorResume.jsp로 안내를 받게 되고 제공된 form을 통해 이력서를 작성 할 수 있다. 
  + 해당 jsp에서 '중간 저장' 버튼을 클릭할 경우 TutorWriterResumeServlet을 통해 form이 제출되고, '제출' 버튼을 클릭할 경우 TutorsubmitResumeServlet을 통해 form이 제출된다.
  + 작성자는 해당 기능에서 TutorsubmitResumeServlet전체와 jsp부분을 작업했습니다.
  
+ 포인트 관리
  + 일반 회원의 경우 수업 결제에 사용되어질 포인트와, 튜터 회원의 경우 결제되어진 포인트를 현금으로 환전할 포인트를 관리하는 페이지이다.
  + '포인트 관리' 메뉴를 클릭 시 pointManagement.jsp로 안내를 받게 된다. 해당 페이지는 현재 로그인되어있는 맴버의 상태에 따라  
  일반회원일 경우 '포인트 충전'기능만 노출,  튜터회원일 경우 '포인트 충전'과 '포인트 환전'기능을 모두 노출시키도록 분기처리가 되어있다.
  + '포인트 충전'시 해당 form에 맞는 데이터를 작성 후 버튼을 클릭 하면 PointDepositeServlet으로 제출되며  
  ```java
  Point point = new Point(0, userId, "I", null, pointAmount, null);  
  ```
  "I"값을 갖는 point객체를 생성 후 POINT_LOG테이블에 기록된다.
  + '포인트 환전'시 해당 form에 맞는 데이터를 작성 후 버튼을 클릭 하면 PointExchangeServlet으로 제출되며  
  ```java
  Point tutorPoint = new Point(0, userId, "O", null, (int)pointAmount, null);  
  ```
  "O"값을 갖는 point객체를 생성 후 POINT_LOG테이블에 기록된다.
  + 기록된 POINT_LOG의 값은 트리거를 통해 해당 회원의 포인트 총량에 합산되어 계산되어진다.   
  ```sql
      CREATE OR REPLACE TRIGGER TRG_POINT_LOG_IO
        BEFORE
        INSERT ON POINT_LOG
        FOR EACH ROW
    BEGIN
        IF :NEW.POINT_IO = 'I'
         THEN
            UPDATE ALL_USER
            SET
                POINT_SUM = POINT_SUM + :NEW.POINT_AMOUNT
            WHERE
                USER_ID = :NEW.USER_ID;
        ELSIF  :NEW.POINT_IO = 'O'
        THEN
            UPDATE ALL_USER
            SET
                POINT_SUM = POINT_SUM - :NEW.POINT_AMOUNT
            WHERE
                USER_ID = :NEW.USER_ID;
        END IF;
    END;
    /
```

DROP TABLE SUBMIT;
DROP TABLE REPORT;
DROP TABLE NOTICE;
DROP TABLE WISHLIST;
DROP TABLE TRANSACTION;
DROP TABLE LOCAL CASCADE CONSTRAINTS;
DROP TABLE INTEREST CASCADE CONSTRAINTS;
DROP TABLE CHATTING;
DROP TABLE REVIEW;
DROP TABLE SELL CASCADE CONSTRAINTS;
DROP TABLE REPLY;
DROP TABLE ATTACHMENT;
DROP TABLE BLACKLIST;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE RECOMMEND;
DROP TABLE BOARD;

DROP SEQUENCE SEQ_UNO;       -- 회원 번호 시퀀스
DROP SEQUENCE SEQ_FNO;       -- 파일 번호 시퀀스
DROP SEQUENCE SEQ_BNO;       -- 커뮤니티 게시글 번호 시퀀스
DROP SEQUENCE SEQ_RYNO;     -- 댓글 번호 시퀀스
DROP SEQUENCE SEQ_SNO;       -- 판매 게시판 번호 시퀀스
DROP SEQUENCE SEQ_RENO;     -- 리뷰 번호 시퀀스
DROP SEQUENCE SEQ_CNO;       -- 판매자 문의(채팅) 번호 시퀀스
DROP SEQUENCE SEQ_NNO;       -- 공지사항 번호 시퀀스
DROP SEQUENCE SEQ_RPNO;     -- 신고 내역 번호 시퀀스
DROP SEQUENCE SEQ_SBNO;       -- 전문가 제출 번호 시퀀스
DROP SEQUENCE SEQ_RCNO;     -- 좋아요 번호 시퀀스

CREATE TABLE MEMBER (
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(30) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(100)	NOT NULL,
    NICKNAME VARCHAR2(20) NOT NULL UNIQUE,
    INTEREST VARCHAR2(50),
    ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
    USER_NAME VARCHAR2(10),
    GENDER VARCHAR2(10) CHECK (GENDER IN('남자','여자')),
    EMAIL VARCHAR2(100),
    PHONE VARCHAR2(13),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    BLACKLIST VARCHAR2(1) DEFAULT 'N' CHECK (BLACKLIST IN('Y', 'N')),
    SPECIALITY VARCHAR2(50),
    EXP_SUBMIT VARCHAR(1) DEFAULT 'N' CHECK (EXP_SUBMIT IN('Y', 'N')),
    EXPERT VARCHAR2(1) DEFAULT 'N' CHECK (EXPERT IN('Y', 'N','W'))
);

COMMENT ON COLUMN MEMBER.USER_NO IS '회원고유 식별번호';
COMMENT ON COLUMN MEMBER.USER_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.NICKNAME IS '회원닉네임';
COMMENT ON COLUMN MEMBER.INTEREST IS '회원의 관심분야';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원 가입날짜';
COMMENT ON COLUMN MEMBER.USER_NAME IS '회원의 이름';
COMMENT ON COLUMN MEMBER.GENDER IS '회원의 성별';
COMMENT ON COLUMN MEMBER.EMAIL IS '회원의 이메일';
COMMENT ON COLUMN MEMBER.PHONE IS '회원의 전화번호';
COMMENT ON COLUMN MEMBER.STATUS IS '회원의 존재상태유무(Y/N)';
COMMENT ON COLUMN MEMBER.BLACKLIST IS '회원 블랙리스트유무(Y/N)';
COMMENT ON COLUMN MEMBER.SPECIALITY IS '전문가인증할 때 전문분야';
COMMENT ON COLUMN MEMBER.EXPERT IS '전문가 상태유무(Y/N)';

CREATE SEQUENCE SEQ_UNO NOCACHE;

-- 관리자
INSERT INTO MEMBER (USER_NO, USER_ID, USER_PWD, NICKNAME, INTEREST, ENROLL_DATE, USER_NAME, GENDER, EMAIL, PHONE, SPECIALITY, EXPERT)
VALUES(SEQ_UNO.NEXTVAL, 'admin@admin.com', 'a1111111', '관리자',10 , SYSDATE, '관리자', '남자', 'aa@aa.com','01011112222', '운동', 'Y');

-- 유저1(일반유저)
INSERT INTO MEMBER (USER_NO, USER_ID, USER_PWD, NICKNAME, INTEREST, ENROLL_DATE)
VALUES(SEQ_UNO.NEXTVAL, 'user01@user.com', 'a1111111', '일반유저', '20' ,SYSDATE);

-- 유저2(전문가)
INSERT INTO MEMBER (USER_NO, USER_ID, USER_PWD, NICKNAME, INTEREST, ENROLL_DATE,  USER_NAME, GENDER, EMAIL, PHONE, SPECIALITY,EXPERT)
VALUES(SEQ_UNO.NEXTVAL, 'user02@user.com', 'a1111111', '전문가유저', '30' ,SYSDATE,'정승필', '남자', 'bb@bb.com','01028280000', 'IT', 'Y');

CREATE TABLE ATTACHMENT(
    FILE_NO NUMBER	PRIMARY KEY,
    REF_NO NUMBER NOT NULL,
    ORIGIN_NAME VARCHAR2(255) NOT NULL,
    CHANGE_NAME VARCHAR2(255) NOT NULL,
    FILE_PATH VARCHAR2(1000),
    UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    FILE_LEVEL NUMBER NOT NULL
);

COMMENT ON COLUMN ATTACHMENT.FILE_NO IS '첨부파일 고유식별번호';
COMMENT ON COLUMN ATTACHMENT.REF_NO IS '참조 번호';
COMMENT ON COLUMN ATTACHMENT.CHANGE_NAME IS '파일 수정명';
COMMENT ON COLUMN ATTACHMENT.FILE_PATH IS '저장폴더경로';
COMMENT ON COLUMN ATTACHMENT.UPLOAD_DATE IS '업로드된 시간';
COMMENT ON COLUMN ATTACHMENT.STATUS IS '삭제 유무';
COMMENT ON COLUMN ATTACHMENT.FILE_LEVEL IS '파일레벨(1/2/3/4/5)';

CREATE SEQUENCE SEQ_FNO NOCACHE;

CREATE TABLE BOARD(
    BOARD_NO NUMBER	 PRIMARY KEY	,
    BOARD_TITLE VARCHAR2(100) NOT NULL	,
    BOARD_TYPE NUMBER ,
    BOARD_CONTENT VARCHAR2(4000) NOT NULL,
    BOARD_COUNT NUMBER DEFAULT 0 NOT NULL,
    BOARD_RECOMMEND NUMBER DEFAULT 0 NOT NULL,
    BOARD_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    USER_NO NUMBER NOT NULL,
    FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN BOARD.BOARD_NO IS '커뮤니티 게시판 고유 식별번호';
COMMENT ON COLUMN BOARD.BOARD_TYPE IS '커뮤니티 게시판 타입(1.게시판,2.궁금해요)';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS '커뮤니티 게시글 제목';
COMMENT ON COLUMN BOARD.BOARD_CONTENT IS '커뮤니티 게시글 내용';
COMMENT ON COLUMN BOARD.BOARD_COUNT IS '커뮤니티 게시글 조회 수';
COMMENT ON COLUMN BOARD.BOARD_RECOMMEND IS '커뮤니티 게시글 추천 수';
COMMENT ON COLUMN BOARD.BOARD_DATE IS '커뮤니티 작성된 시간';
COMMENT ON COLUMN BOARD.STATUS IS '게시글 삭제유무(Y/N)';
COMMENT ON COLUMN BOARD.USER_NO IS '커뮤니티 작성한 회원 번호';

CREATE SEQUENCE SEQ_BNO NOCACHE;

-- 기본 커뮤니티 글생성
INSERT INTO BOARD (BOARD_NO, BOARD_TITLE, BOARD_TYPE, BOARD_CONTENT, BOARD_COUNT, BOARD_RECOMMEND, USER_NO)
VALUES(SEQ_BNO.NEXTVAL, '테스트입니다1', 1, '테스트내용입니다', 0, 0, 1);
INSERT INTO BOARD (BOARD_NO, BOARD_TITLE, BOARD_TYPE, BOARD_CONTENT, BOARD_COUNT, BOARD_RECOMMEND, USER_NO)
VALUES(SEQ_BNO.NEXTVAL, '테스트입니다2', 2, '테스트내용입니다2', 0, 0, 1);


CREATE TABLE REPLY(
    REPLY_NO NUMBER NOT NULL PRIMARY KEY,
    REPLY_COUNT NUMBER DEFAULT 0 NOT NULL,
    REPLY_CONTENT VARCHAR2(600) NOT NULL,
    REPLY_DATE DATE DEFAULT SYSDATE NOT NULL,
    BOARD_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
    STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    FOREIGN KEY(BOARD_NO) REFERENCES BOARD(BOARD_NO),
    FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN REPLY.REPLY_NO IS '커뮤니티 댓글 고유 식별번호';
COMMENT ON COLUMN REPLY.REPLY_COUNT IS '커뮤니티 댓글 총 갯수';
COMMENT ON COLUMN REPLY.REPLY_CONTENT IS '커뮤니티 댓글 내용';
COMMENT ON COLUMN REPLY.REPLY_DATE IS '댓글이 작성된 시간';
COMMENT ON COLUMN REPLY.BOARD_NO IS '커뮤니티 게시판 고유 식별번호';
COMMENT ON COLUMN REPLY.USER_NO IS '커뮤니티 댓글 작성한 회원고유 식별번호';
COMMENT ON COLUMN REPLY.STATUS IS '상태값';

CREATE SEQUENCE SEQ_RYNO NOCACHE;

CREATE TABLE INTEREST(
    INTEREST_NO NUMBER PRIMARY KEY,
    INTEREST_NAME VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN INTEREST.INTEREST_NO IS '관심분야 고유 식별번호';
COMMENT ON COLUMN INTEREST.INTEREST_NAME IS '관심분야 카테고리';

INSERT INTO INTEREST VALUES(10, '영상');
INSERT INTO INTEREST VALUES(20, '영화');
INSERT INTO INTEREST VALUES(30, '게임');
INSERT INTO INTEREST VALUES(40, 'IT');
INSERT INTO INTEREST VALUES(50, '운동');
INSERT INTO INTEREST VALUES(60, '요리');

CREATE TABLE LOCAL(
    LOCAL_NO NUMBER PRIMARY KEY,
    LOCAL_NAME VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN LOCAL.LOCAL_NO IS '지역 고유 식별번호';
COMMENT ON COLUMN LOCAL.LOCAL_NAME IS '지역 카테고리';

INSERT INTO LOCAL VALUES(5, '서울');
INSERT INTO LOCAL VALUES(15, '인천');
INSERT INTO LOCAL VALUES(25, '부산');
INSERT INTO LOCAL VALUES(35, '울산');
INSERT INTO LOCAL VALUES(45, '대전');
INSERT INTO LOCAL VALUES(55, '광주');
INSERT INTO LOCAL VALUES(65, '경기');
INSERT INTO LOCAL VALUES(75, '충북/충남');
INSERT INTO LOCAL VALUES(85, '전북/전남');
INSERT INTO LOCAL VALUES(95, '경북/경남');
INSERT INTO LOCAL VALUES(105, '제주');
INSERT INTO LOCAL VALUES(115, '온라인');

--------- 카테고리 부분은 미리 데이터 넣어야 함--------------

CREATE TABLE SELL(
    SELL_NO NUMBER NOT NULL PRIMARY KEY,
    SELL_TITLE VARCHAR2(100) NOT NULL,
    SELL_CONTENT VARCHAR2(4000) NOT NULL,
    PRICE NUMBER NOT NULL,
    SELL_COUNT NUMBER DEFAULT 0 NOT NULL,
    SELL_RECOMMEND NUMBER DEFAULT 0 NOT NULL,
    SELL_DATE DATE DEFAULT SYSDATE NOT NULL,
    SELL_DETAIL VARCHAR2(4000) NOT NULL,
    SELL_REGULATION VARCHAR2(4000) NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    INTEREST_NO NUMBER NOT NULL,
    LOCAL_NO NUMBER NOT NULL	,
    USER_NO NUMBER NOT NULL,
    FOREIGN KEY(INTEREST_NO) REFERENCES INTEREST(INTEREST_NO),
    FOREIGN KEY(LOCAL_NO) REFERENCES LOCAL(LOCAL_NO),
    FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO)
);

CREATE SEQUENCE SEQ_SNO NOCACHE;

COMMENT ON COLUMN SELL.SELL_NO IS '판매게시판 고유 식별번호';
COMMENT ON COLUMN SELL.SELL_TITLE IS '판매게시글 제목';
COMMENT ON COLUMN SELL.SELL_CONTENT IS '판매게시글 내용';
COMMENT ON COLUMN SELL.PRICE IS '판매게시글 가격';
COMMENT ON COLUMN SELL.SELL_COUNT IS '판매게시글 조회 수';
COMMENT ON COLUMN SELL.SELL_RECOMMEND IS '판매게시글 추천 수';
COMMENT ON COLUMN SELL.SELL_DATE IS '판매게시글 작성된 시간';
COMMENT ON COLUMN SELL.SELL_DETAIL IS '판매게시글 상세내용';
COMMENT ON COLUMN SELL.SELL_REGULATION IS '판매게시글 취소 및 환불 규정';
COMMENT ON COLUMN SELL.STATUS IS '판매게시글 삭제유무(Y/N)';
COMMENT ON COLUMN SELL.INTEREST_NO IS '코칭받을 관심분야';
COMMENT ON COLUMN SELL.LOCAL_NO IS '코칭받을 오프라인 지역';
COMMENT ON COLUMN SELL.USER_NO IS '판매게시글 올린 회원고유 식별번호';


CREATE TABLE REVIEW(
    REVIEW_NO NUMBER NOT NULL PRIMARY KEY,
    REVIEW_CONTENT VARCHAR2(1000),
    AVG NUMBER DEFAULT 3 NOT NULL,
    REVIEW_DATE DATE DEFAULT SYSDATE NOT NULL,
    USER_NO NUMBER NOT NULL,
    SELL_NO NUMBER NOT NULL,
    FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO),
    FOREIGN KEY(SELL_NO) REFERENCES SELL(SELL_NO)
);

CREATE SEQUENCE SEQ_RENO NOCACHE;

COMMENT ON COLUMN REVIEW.REVIEW_NO IS '리뷰 고유 식별번호';
COMMENT ON COLUMN REVIEW.REVIEW_CONTENT IS '리뷰 내용';
COMMENT ON COLUMN REVIEW.AVG IS '평점';
COMMENT ON COLUMN REVIEW.REVIEW_DATE IS '리뷰 작성된 시간';
COMMENT ON COLUMN REVIEW.USER_NO IS '회원고유 식별번호';
COMMENT ON COLUMN REVIEW.SELL_NO IS '판매게시판 고유 식별번호';

CREATE TABLE TRANSACTION(
    SELL_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
    REVIEW_NO NUMBER NOT NULL,
    STATUS VARCHAR2(1) DEFAULT '1' CHECK (STATUS IN ('1', '2', '3')),
    PRIMARY KEY(SELL_NO, USER_NO),
    FOREIGN KEY(SELL_NO) REFERENCES SELL(SELL_NO),
    FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO)

);

COMMENT ON COLUMN TRANSACTION.SELL_NO IS '판매게시판 고유 식별번호';
COMMENT ON COLUMN TRANSACTION.USER_NO IS '회원고유 식별번호';

COMMENT ON COLUMN TRANSACTION.STATUS IS '1. 진행중  2. 완료  3. 취소';


CREATE TABLE WISHLIST(
    SELL_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    PRIMARY KEY (SELL_NO, USER_NO),
    FOREIGN KEY(SELL_NO) REFERENCES SELL(SELL_NO),
    FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN WISHLIST.SELL_NO IS '판매게시판 고유 식별번호';
COMMENT ON COLUMN WISHLIST.USER_NO IS '회원고유 식별번호';
COMMENT ON COLUMN WISHLIST.STATUS IS '찜 목록의 존재 유무';

CREATE TABLE CHATTING (
    CHAT_NO NUMBER NOT NULL PRIMARY KEY,
    CHAT_CONTENT VARCHAR2(4000),
    CHAT_DATE DATE DEFAULT SYSDATE NOT NULL,
    SENDER NUMBER NOT NULL,
    RECEIVER NUMBER NOT NULL	,
    SELL_NO NUMBER NOT NULL,
    FOREIGN KEY(SENDER) REFERENCES MEMBER(USER_NO),
    FOREIGN KEY(RECEIVER) REFERENCES MEMBER(USER_NO),
    FOREIGN KEY(SELL_NO) REFERENCES SELL(SELL_NO)
);

CREATE SEQUENCE SEQ_CNO NOCACHE;

COMMENT ON COLUMN CHATTING.CHAT_NO IS '채팅목록 번호';
COMMENT ON COLUMN CHATTING.CHAT_CONTENT IS '판매자 이용자 채팅내역';
COMMENT ON COLUMN CHATTING.CHAT_DATE IS '대화한 날짜';
COMMENT ON COLUMN CHATTING.SENDER IS '회원고유 식별번호';
COMMENT ON COLUMN CHATTING.RECEIVER IS '회원고유 식별번호';
COMMENT ON COLUMN CHATTING.SELL_NO IS '판매게시판 고유 식별번호';

CREATE TABLE NOTICE(
    NOTICE_NO NUMBER PRIMARY KEY,
    NOTICE_TITLE VARCHAR2(100) NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지사항 고유 식별번호';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지사항 제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지사항 내용';
COMMENT ON COLUMN NOTICE.CREATE_DATE IS '공지사항 작성된 시간';
COMMENT ON COLUMN NOTICE.STATUS IS '공지사항 존재유무(Y/N)';

CREATE SEQUENCE SEQ_NNO NOCACHE;

INSERT INTO NOTICE(NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT, CREATE_DATE)
VALUES (SEQ_NNO.NEXTVAL, 'JSP팀 고생하셨습니다.', '모두모두 행복하세요', SYSDATE);
INSERT INTO NOTICE(NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT, CREATE_DATE)
VALUES (SEQ_NNO.NEXTVAL, '프젝 4팀 고생하셨습니다.', '모두모두 행복하세요', SYSDATE);


CREATE TABLE REPORT(
    REPORT_NO NUMBER NOT NULL PRIMARY KEY,
    REPORT_TITLE VARCHAR2(100) NOT NULL,
    REASON VARCHAR2(10) NOT NULL,
    REPORT_CONTENT VARCHAR2(4000) NOT NULL,
    REPORT_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR(1) DEFAULT 'N' CHECK (STATUS IN('Y', 'N')),
    REPORT_USER NUMBER NOT NULL,
    REPORTED_USER NUMBER NOT NULL
);

COMMENT ON COLUMN REPORT.REPORT_NO IS '신고 고유 식별번호';
COMMENT ON COLUMN REPORT.REPORT_TITLE IS '신고한 제목';
COMMENT ON COLUMN REPORT.REASON IS '신고한 카테고리';
COMMENT ON COLUMN REPORT.REPORT_CONTENT IS '신고한 내용';
COMMENT ON COLUMN REPORT.REPORT_DATE IS '신고한 시간';
COMMENT ON COLUMN REPORT.STATUS IS '신고 처리상태(Y/N)';
COMMENT ON COLUMN REPORT.REPORT_USER IS '회원고유 식별번호(신고한 회원번호)';
COMMENT ON COLUMN REPORT.REPORTED_USER IS '회원고유 식별번호(신고당한 회원번호)';

CREATE SEQUENCE SEQ_RPNO NOCACHE;

CREATE TABLE SUBMIT(
    SUBNO NUMBER NOT NULL PRIMARY KEY,
    USER_NO NUMBER,
    USER_NAME VARCHAR2(10),
    GENDER VARCHAR2(10) CHECK (GENDER IN('남자','여자')),
    EMAIL VARCHAR2(100),
    PHONE VARCHAR2(13),
    SPECIALITY VARCHAR2(50),
    EXP_SUBMIT VARCHAR(1) DEFAULT 'Y' CHECK (EXP_SUBMIT IN('Y', 'N')),
    FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO)
);

CREATE SEQUENCE SEQ_SBNO;

COMMENT ON COLUMN SUBMIT.SUBNO IS '제출 고유 식별번호';
COMMENT ON COLUMN SUBMIT.USER_NAME IS '전문가 신청한 유저이름';
COMMENT ON COLUMN SUBMIT.GENDER IS '전문가 신청한 유저성별';
COMMENT ON COLUMN SUBMIT.EMAIL IS '전문가 신청한 유저이메일';
COMMENT ON COLUMN SUBMIT.PHONE IS '전문가 신청한 유저핸드폰번호';
COMMENT ON COLUMN SUBMIT.SPECIALITY IS '신청한 전문분야';
COMMENT ON COLUMN SUBMIT.EXP_SUBMIT IS '전문가 제출상태';
COMMENT ON COLUMN SUBMIT.USER_NO IS '회원고유 식별번호';


CREATE TABLE BLACKLIST (
	USER_NO NUMBER PRIMARY KEY,
	REASON VARCHAR2(1000) NOT NULL,
	BLACK_DATE DATE DEFAULT SYSDATE NOT NULL,
	FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN BLACKLIST.USER_NO IS '회원고유 식별번호';
COMMENT ON COLUMN BLACKLIST.REASON IS '제적 사유';
COMMENT ON COLUMN BLACKLIST.BLACK_DATE IS '블랙리스트에 등재한 시간';

CREATE TABLE RECOMMEND (
	RED_NO NUMBER PRIMARY KEY,
	USER_NO NUMBER NOT NULL,
	BOARD_NO NUMBER,
   	SELL_NO NUMBER,
    	FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO),
	FOREIGN KEY(BOARD_NO) REFERENCES BOARD(BOARD_NO),
        FOREIGN KEY(SELL_NO) REFERENCES SELL(SELL_NO)
);

COMMENT ON COLUMN RECOMMEND.RED_NO IS '좋아요 번호';
COMMENT ON COLUMN RECOMMEND.BOARD_NO IS '게시물 번호';
COMMENT ON COLUMN RECOMMEND.USER_NO IS '유저 번호';
COMMENT ON COLUMN RECOMMEND.SELL_NO IS '판매글 번호';

CREATE SEQUENCE SEQ_RCNO NOCACHE;

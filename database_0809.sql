CREATE SCHEMA `pet119` DEFAULT CHARACTER SET utf8mb4 ;
use pet119;
DROP TABLE `게시판`;

CREATE TABLE `게시판`
(
    `게시판_id`    INT NOT NULL,
    `작성 내용`    VARCHAR(10000),
    `생성시기`    TIMESTAMP,
    `업데이트 시기`    TIMESTAMP,
    `좋아요`    BOOLEAN DEFAULT '0',
    `제목`    VARCHAR(100),
    `좋아요 눌린 횟수`    TINYINT,
    `삭제 여부`    BOOLEAN DEFAULT '0',
    `태그`    VARCHAR(100),
    `아이디`    VARCHAR(30),
 PRIMARY KEY ( `게시판_id` )
);

ALTER TABLE `게시판`
 ADD CONSTRAINT `게시판_PK` PRIMARY KEY ( `게시판_id` );


DROP TABLE `댓글`;

CREATE TABLE `댓글`
(
    `댓글_id`    INT NOT NULL,
    `댓글 내용`    VARCHAR(1000),
    `생성 시기`    TIMESTAMP,
    `업데이트 시기`    TIMESTAMP,
    `삭제 여부`    CHAR(1) DEFAULT 'N',
    `게시판_id`    INT,
    `아이디`    VARCHAR(30),
 PRIMARY KEY ( `댓글_id` )
);

ALTER TABLE `댓글`
 ADD CONSTRAINT `댓글_PK` PRIMARY KEY ( `댓글_id` );


DROP TABLE `반려동물 정보`;

CREATE TABLE `반려동물 정보`
(
    `반려동물정보_id`    INT NOT NULL,
    `아이디`    VARCHAR(30) NOT NULL,
    `이름`    VARCHAR(20),
    `나이`    INT,
    `성별`    CHAR(1),
    `종류`    VARCHAR(20),
    `중 성화 수술 여부`    CHAR(1),
    `알레르기 및 병`    VARCHAR(100),
    `생성 시기`    TIMESTAMP,
    `업데이트 시기`    TIMESTAMP,
    `삭제 여부`    CHAR(1),
    `특이사항`    VARCHAR(1000),
 PRIMARY KEY ( `반려동물정보_id` )
);

ALTER TABLE `반려동물 정보`
 ADD CONSTRAINT `반려동물 정보_PK` PRIMARY KEY ( `반려동물정보_id` );


DROP TABLE `사용자 정보`;

CREATE TABLE `사용자 정보`
(
    `이름`    VARCHAR(20) NOT NULL,
    `나이`    INT,
    `성별`    CHAR(1),
    `전화번호`    VARCHAR(20) NOT NULL,
    `주소`    VARCHAR(100),
    `닉네임`    VARCHAR(20),
    `생성시기`    TIMESTAMP,
    `업데이트 시기`    TIMESTAMP,
    `아이디`    VARCHAR(30) NOT NULL,
    `비밀번호`    VARCHAR(30) NOT NULL,
 PRIMARY KEY ( `아이디` )
);

ALTER TABLE `사용자 정보`
 ADD CONSTRAINT `사용자 정보_PK` PRIMARY KEY ( `아이디` );


DROP TABLE `시설 사진`;

CREATE TABLE `시설 사진`
(
    `시설사진_id`    INT NOT NULL,
    `사진url`    VARCHAR(300),
    `캡션`    VARCHAR(100),
    `시설_id`    INT,
 PRIMARY KEY ( `시설사진_id` )
);

ALTER TABLE `시설 사진`
 ADD CONSTRAINT `시설 사진_PK` PRIMARY KEY ( `시설사진_id` );


DROP TABLE `시설지도`;

CREATE TABLE `시설지도`
(
    `시설_id`    INT NOT NULL,
    `시설이름`    VARCHAR(100),
    `시설종류`    VARCHAR(100),
    `주소`    VARCHAR(100),
    `위도`    INT,
    `경도`    INT,
    `사용자 위치`    VARCHAR(100),
    `아이디`    VARCHAR(30) NOT NULL,
    `시설정보url`    VARCHAR(1000),
 PRIMARY KEY ( `시설_id` )
);

ALTER TABLE `시설지도`
 ADD CONSTRAINT `시설지도_PK` PRIMARY KEY ( `시설_id` );


DROP TABLE `알림`;

CREATE TABLE `알림`
(
    `알림_id`    INT NOT NULL,
    `게시판_알림`    VARCHAR(100),
    `일정_알림`    VARCHAR(100),
    `아이디`    VARCHAR(30),
 PRIMARY KEY ( `알림_id` )
);

ALTER TABLE `알림`
 ADD CONSTRAINT `알림_PK` PRIMARY KEY ( `알림_id` );


DROP TABLE `응답`;

CREATE TABLE `응답`
(
    `챗봇_id`    INT NOT NULL,
    `응답_id`    INT NOT NULL,
    `내용`    VARCHAR(1000),
    `생성 시기`    TIMESTAMP,
 PRIMARY KEY ( `응답_id` )
);

ALTER TABLE `응답`
 ADD CONSTRAINT `응답_PK` PRIMARY KEY ( `응답_id` );


DROP TABLE `인증`;

CREATE TABLE `인증`
(
    `인증_id`    INT NOT NULL,
    `비밀번호_id`    INT,
    `아이디_id`    INT,
    `업데이트 시기`    TIMESTAMP,
    `access_token`    VARCHAR(100),
    `아이디`    VARCHAR(30) NOT NULL,
 PRIMARY KEY ( `인증_id` )
);

ALTER TABLE `인증`
 ADD CONSTRAINT `인증_PK` PRIMARY KEY ( `인증_id` );


DROP TABLE `일정`;

CREATE TABLE `일정`
(
    `일정_id`    INT NOT NULL,
    `제목`    VARCHAR(100),
    `내용`    VARCHAR(1000),
    `생성시기`    TIMESTAMP,
    `업데이트 시기`    TIMESTAMP,
    `삭제 여부`    CHAR(1),
    `반려동물정보_id`    INT,
    `날짜`    DATE NOT NULL,
 PRIMARY KEY ( `일정_id` )
);

ALTER TABLE `일정`
 ADD CONSTRAINT `일정_PK` PRIMARY KEY ( `일정_id` );


DROP TABLE `일지`;

CREATE TABLE `일지`
(
    `건강일지_id`    INT NOT NULL,
    `제목`    VARCHAR(100),
    `내용`    VARCHAR(1000),
    `생성시기`    TIMESTAMP,
    `업데이트 시기`    TIMESTAMP,
    `삭제 여부`    CHAR(1),
    `반려동물정보_id`    INT,
 PRIMARY KEY ( `건강일지_id` )
);

ALTER TABLE `일지`
 ADD CONSTRAINT `일지_PK` PRIMARY KEY ( `건강일지_id` );


DROP TABLE `챗봇문의`;

CREATE TABLE `챗봇문의`
(
    `챗봇_id`    INT NOT NULL,
    `내용`    VARCHAR(1000),
    `생성시기`    TIMESTAMP,
    `아이디`    VARCHAR(30) NOT NULL,
 PRIMARY KEY ( `챗봇_id` )
);

ALTER TABLE `챗봇문의`
 ADD CONSTRAINT `챗봇문의_PK` PRIMARY KEY ( `챗봇_id` );


DROP TABLE `탈퇴 이력`;

CREATE TABLE `탈퇴 이력`
(
    `탈퇴일자`    DATE NOT NULL,
    `탈퇴사유`    VARCHAR(100),
    `아이디`    VARCHAR(30) NOT NULL,
 PRIMARY KEY ( `아이디`,`탈퇴일자` )
);

ALTER TABLE `탈퇴 이력`
 ADD CONSTRAINT `탈퇴 이력_PK` PRIMARY KEY ( `아이디`,`탈퇴일자` );



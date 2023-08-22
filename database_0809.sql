DROP TABLE if exists`user`;

CREATE TABLE `user`
(
    `user_name`    VARCHAR(20) NOT NULL,
    `user_age`    INT,
    `user_gender`    CHAR(1),
    `user_phone`    VARCHAR(20) NOT NULL,
    `user_address`    VARCHAR(100),
    `user_nickname`    VARCHAR(20),
    `user_time`    TIMESTAMP,
    `user_update`    TIMESTAMP,
    `user_id`    VARCHAR(30) NOT NULL,
    `user_pw`    VARCHAR(30) NOT NULL
);

insert into user values('han',24,'M','010-1234-5678','pohang','han',now(),now(),'abcd','1234');

ALTER TABLE `user`
 ADD CONSTRAINT `user_PK` PRIMARY KEY ( `user_id` );


DROP TABLE if exists`게시판`;

CREATE TABLE `게시판`
(
    `board_id`    INT NOT NULL,
    `board_content`    VARCHAR(10000),
    `board_time`    TIMESTAMP,
    `board_update`    TIMESTAMP,
    `board_like`    BOOLEAN DEFAULT '0',
    `board_title`    VARCHAR(100),
    `board_like_count`    TINYINT,
    `board_delete`    BOOLEAN DEFAULT '0',
    `board_tag`    VARCHAR(100),
    `user_id`    VARCHAR(30)
);

ALTER TABLE `게시판`
 ADD CONSTRAINT `게시판_PK` PRIMARY KEY ( `board_id` );


DROP TABLE if exists `댓글`;

CREATE TABLE `댓글`
(
    `comments_id`    INT NOT NULL,
    `comments_content`    VARCHAR(1000),
    `comments_time`    TIMESTAMP,
    `comments_update`    TIMESTAMP,
    `comments_delete`    CHAR(1) DEFAULT 'N',
    `board_id`    INT,
    `comments_id1`    VARCHAR(30)
);

ALTER TABLE `댓글`
 ADD CONSTRAINT `댓글_PK` PRIMARY KEY ( `comments_id` );


DROP TABLE if exists`반려동물 정보`;

CREATE TABLE `반려동물 정보`
(
    `pet_id`    INT NOT NULL,
    `user_id`    VARCHAR(30) NOT NULL,
    `pet_name`    VARCHAR(20),
    `pet_age`    INT,
    `pet_gender`    CHAR(1),
    `pet_type`    VARCHAR(20),
    `pet_neutralization`    CHAR(1),
    `pet_allergy`    VARCHAR(100),
    `pet_time`    TIMESTAMP,
    `pet_time1`    TIMESTAMP,
    `pet_delete`    CHAR(1),
    `pet_special`    VARCHAR(1000)
);

ALTER TABLE `반려동물 정보`
 ADD CONSTRAINT `반려동물 정보_PK` PRIMARY KEY ( `pet_id` );


DROP TABLE if exists`시설 사진`;

CREATE TABLE `시설 사진`
(
    `photo_id`    INT NOT NULL,
    `photo_url`    VARCHAR(300),
    `photo_caption`    VARCHAR(100),
    `facility_id`    INT
);

ALTER TABLE `시설 사진`
 ADD CONSTRAINT `시설 사진_PK` PRIMARY KEY ( `photo_id` );


DROP TABLE if exists`시설지도`;

CREATE TABLE `시설지도`
(
    `facility_id`    INT NOT NULL,
    `facility_name`    VARCHAR(100),
    `facility_type`    VARCHAR(100),
    `facility_add`    VARCHAR(100),
    `facility_lat`    INT,
    `facility_lng`    INT,
    `facility_mine_loc`    VARCHAR(100),
    `user_id`    VARCHAR(30) NOT NULL,
    `facility_info_url`    VARCHAR(1000)
);

ALTER TABLE `시설지도`
 ADD CONSTRAINT `시설지도_PK` PRIMARY KEY ( `facility_id` );


DROP TABLE if exists`알림`;

CREATE TABLE `알림`
(
    `alarm_id`    INT NOT NULL,
    `alarm_board`    VARCHAR(100),
    `alarm_schedule`    VARCHAR(100),
    `user_id`    VARCHAR(30)
);


DROP TABLE if exists`응답`;

CREATE TABLE `응답`
(
    `chatbot_id`    INT NOT NULL,
    `response_id`    INT NOT NULL,
    `response_content`    VARCHAR(1000),
    `time`    TIMESTAMP default now()
);

ALTER TABLE `응답`
 ADD CONSTRAINT `응답_PK` PRIMARY KEY ( `response_id` );


DROP TABLE if exists `인증`;

CREATE TABLE `인증`
(
    `log_certified_id`    INT DEFAULT 0 NOT NULL,
    `log_pw_id`    INT DEFAULT null,
    `log_id_id`    INT DEFAULT null,
    `log_update`    TIMESTAMP,
    `log_acess_token`    VARCHAR(100) DEFAULT null,
    `user_id`    VARCHAR(30) NOT NULL
);

ALTER TABLE `인증`
 ADD CONSTRAINT `인증_PK` PRIMARY KEY ( `log_certified_id` );


DROP TABLE if exists `일정`;

CREATE TABLE `일정`
(
    `schedule_id`    INT NOT NULL,
    `schedule_title`    VARCHAR(100),
    `schedule_content`    VARCHAR(1000),
    `schedule_time1`    TIMESTAMP,
    `schedule_update`    TIMESTAMP,
    `schedule_delete`    CHAR(1),
    `pet_id`    INT,
    `schedule_time`    DATE NOT NULL
);

ALTER TABLE `일정`
 ADD CONSTRAINT `일정_PK` PRIMARY KEY ( `schedule_id` );


DROP TABLE if exists`일지`;

CREATE TABLE `일지`
(
    `diary_id`    INT NOT NULL,
    `diary_title`    VARCHAR(100),
    `diary_content`    VARCHAR(1000),
    `diary_time`    TIMESTAMP,
    `diary_update`    TIMESTAMP,
    `diary_delete`    CHAR(1),
    `pet_id`    INT
);

ALTER TABLE `일지`
 ADD CONSTRAINT `일지_PK` PRIMARY KEY ( `diary_id` );


DROP TABLE if exists `챗봇문의`;

CREATE TABLE `챗봇문의`
(
    `chatbot_id`    INT NOT NULL,
    `chatbot_content`    VARCHAR(1000),
    `chatbot_time`    TIMESTAMP default now(),
    `user_id`    VARCHAR(30) NOT NULL
);

ALTER TABLE `챗봇문의`
 ADD CONSTRAINT `챗봇문의_PK` PRIMARY KEY ( `chatbot_id` );


DROP TABLE if exists`탈퇴 이력`;

CREATE TABLE `탈퇴 이력`
(
    `resign_date`    DATE NOT NULL,
    `resign_reason`    VARCHAR(100),
    `user_id`    VARCHAR(30) NOT NULL
);

ALTER TABLE `탈퇴 이력`
 ADD CONSTRAINT `탈퇴 이력_PK` PRIMARY KEY ( `user_id`,`resign_date` );

select * from 챗봇문의;
select * from 응답; 
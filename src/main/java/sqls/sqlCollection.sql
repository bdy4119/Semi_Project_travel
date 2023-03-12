

--쿼리문 작성 해주시고 수정 사항 생기면 업데이트 부탁드립니다


-- member table
-- alter table하는데 member필요해서 일단 임의로 생성해보려고 하는데 혹시 몰라서 올립니닷,,
-- 동민님이 작성하시면서 추가되는 거 있으면 요거 지우고 동민님껄로 다시 생성할게요:)
create table member(
	id varchar(50) primary key, -- 중복방지/ null과 같은값 허용X
	pwd varchar(50) not null,
	name varchar(50) not null,
	email varchar(50) unique, -- null은 허용O, 같은값은 허용X
	auth int -- user인지 client인지 확인
);
-- -----------------------------------------------


--영권 DB-------------------------------------------------------------------------------------------
create table member
(
    id    varchar(50) primary key,
    pwd   varchar(50) not null,
    name  varchar(50) not null,
    email varchar(50) unique,
    auth  int
);

CREATE TABLE cb
(
    seq         INT         NOT NULL AUTO_INCREMENT,
    id          VARCHAR(45) NOT NULL,
    title       VARCHAR(45) NOT NULL,
    contents    TEXT        NOT NULL,
    createdtime TIMESTAMP NULL,
    readcount   INT NULL,
    deletetime  TIMESTAMP NULL,
    updatetime  TIMESTAMP NULL,
    PRIMARY KEY (seq)
);


CREATE TABLE cbParam
(
    seq         INT         NOT NULL,
    id          VARCHAR(45) NOT NULL,
    contents    VARCHAR(45) NULL,
    createdtime TIMESTAMP NULL,
    deletetime  TIMESTAMP NULL,
    updatetime  TIMESTAMP NULL
);

insert into member
values ('abc', 123, '홍길동', 'abc@naver.com', 3);

INSERT INTO cb
VALUES (1, 'helloid', 'hellotitle', 'hellocontents', CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (2, 'helloid2', 'hellotitle2', 'hellocontents2', CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO cbparam
VALUES (1, 'hiid', 'hicontents', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (2, 'hiid2', 'hicontents2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
--영권 DB-------------------------------------------------------------------------------------------


--다연 DB-------------------------------------------------------------------------------------------
-- review부분에 들어갈 전체 정보 table
create table review
(
    seq        int auto_increment primary key COMMENT '시퀀스 넘버',
    id         varchar(50)   not null COMMENT '아이디',

    ref        decimal(8)    not null COMMENT '답변 글이 참조하는 원래번호',
    step       decimal(8)    not null COMMENT '답변 글 출력순서',
    depth      decimal(8)    not null COMMENT '답변 글 깊이',

    title      varchar(200)  not null COMMENT '글제목',
    content    varchar(4000) not null COMMENT '내용',
    wdate      timestamp     not null COMMENT '작성일',

    del        decimal(1)    not null COMMENT '수정으로로 삭제할시 0으로 수정',
    readcount  decimal(8)    not null COMMENT '조회수',

    updatedate DATETIME NULL COMMENT '수정일자',
    deletedate DATETIME NULL COMMENT '삭제일자'
);

alter table review
add foreign key(id) references member(id);



-- 댓글 table
create table reviewcomment(
	seq decimal(5) not null,
	id varchar(50),
	content varchar(1000) not null,
	wdate timestamp not null
);

alter table reviewcomment
add foreign key(id) references member(id);
-- ----------


-- 데이터 삽입용
insert into review
values (1, 'bdy', 0, 0, 0, '제주여행기', '제주여행 테스트', now(), 0, 0, null, null);


-- 데이터 정보 전체 불러오기
select seq,
       id,
       ref,
       step,
       depth,
       title,
       content,
       wdate,
       del,
       readcount,
       updatedate,
       deletedate
from (select row_number() over(order by ref desc, step asc) as rnum, seq
           , id
           , ref
           , step
           , depth
           , title
           , content
           , wdate
           , del
           , readcount
           , updatedate
           , deletedate
      from review

      order by ref desc, step asc) a
where rnum between 21 and 30;


-- 글쓰기 쿼리문
insert into review(id, ref, step, depth, title, content, wdate, del, readcount)
values ('id', (select ifnull(max(ref, 0) + 1 from bbs b),
                      0,
                      0,
                      'title',
                      'content',
                      now(),
                      0,
                      0));
                      
                    


--다연 DB-------------------------------------------------------------------------------------------

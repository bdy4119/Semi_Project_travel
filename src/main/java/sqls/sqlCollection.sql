

--쿼리문 작성 해주시고 수정 사항 생기면 업데이트 부탁드립니다

--영권 DB-------------------------------------------------------------------------------------------
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

INSERT INTO cb
VALUES (1, 'helloid', 'hellotitle', 'hellocontents', 0, 0, 0, 0),
       (2, 'helloid2', 'hellotitle2', 'hellocontents2', 0, 0, 0, 0),;

INSERT INTO cbparam
VALUES (1, 'hiid', 'hicontents', 0, 0, 0),
       (2, 'hiid2', 'hicontents2', 0, 0, 0);
--영권 DB-------------------------------------------------------------------------------------------


--다연 DB-------------------------------------------------------------------------------------------
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
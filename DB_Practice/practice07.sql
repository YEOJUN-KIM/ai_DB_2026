-- 집계 함수와 트랜잭션 연습
-- practice04.sql과 practice05.sql을 먼저 실행한다.


-- 1. 기본 집계 함수
-- 과목 수, 전체 수업 시간, 평균 수업 시간, 최대·최소 수업 시간 조회
select count(*) as "과목수",
       sum(hours) as "전체수업시간",
       round(avg(hours), 2) as "평균수업시간",
       max(hours) as "최대수업시간",
       min(hours) as "최소수업시간"
from courses;


-- 2. COUNT와 DISTINCT
-- 전체 수강 건수와 수강한 학생 수 조회
select count(*) as "전체수강건수",
       count(distinct student_id) as "수강학생수"
from enrollments;


-- 3. GROUP BY
-- 과목별 수강 인원 조회
select c.id "과목번호",
       c.title "과목명",
       count(e.student_id) "수강인원"
from courses c
left join enrollments e
    on c.id = e.course_id
group by c.id, c.title
order by c.id;


-- 4. HAVING
-- 수강 인원이 2명 이상인 과목만 조회
select c.id "과목번호",
       c.title "과목명",
       count(e.student_id) "수강인원"
from courses c
inner join enrollments e
    on c.id = e.course_id
group by c.id, c.title
having count(e.student_id) >= 2
order by c.id;


-- 5. ROLLBACK
-- 변경 작업을 취소하여 트랜잭션 시작 전 상태로 되돌린다.
begin;

update courses
set hours = hours + 1
where id = 1;

select id, title, hours
from courses
where id = 1;

rollback;

-- ROLLBACK 후에는 기존 수업 시간으로 조회된다.
select id, title, hours
from courses
where id = 1;


-- 6. COMMIT
-- 아래 예제는 연습용 임시 테이블의 변경 사항을 확정한다.
drop table if exists transaction_practice;

begin transaction;

create temporary table transaction_practice (
    id int,
    content varchar(100)
);

insert into transaction_practice (id, content)
values (1, 'COMMIT 연습');

commit;

select *
from transaction_practice;



begin;
drop table accounts;

create table accounts (
account_id int primary key, 
owner_name varchar(50) not null,
balance numeric(12, 0) not null check (balance >= 0)
);

insert into accounts (account_id, owner_name ,balance )
values (1,'김철수', 10000),(2,'박영희',200000);

commit;
rollback;
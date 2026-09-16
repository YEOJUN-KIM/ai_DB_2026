-- DB생성
create database ai_db;


-- Table 생성
create table students (
	id int generated always as identity primary key,	-- 학생 구분값 자동증가
	name varchar(50) not null,							-- 이름
	age int,											-- 나이
	email varchar(100),									-- 이메일
	created_at timestamp default current_timestamp 		-- 현재 작성된 일자
);

CREATE TABLE students (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INT,
email VARCHAR(100),
major VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert문
insert into students (name, age, email) values
('홍길동', 20, 'hong@example.com'),
('김철수', 21, 'KIM1@example.com'),
('김영희', 21, 'KIM2@example.com');

-- Select문
select * from students;
select name, age from students;

-- Update문
update students set
	email = 'hong@kakao.com'
	where id = 1;

-- Delete문
delete from students 
where name = '홍길동';
-- 수강 테이블 생성쿼리
create table enrollments (
    id int generated always as identity primary key,
    students_id int not null,
    course_name varchar(100) not null,
    enrolled_at timestamp default current_timestamp,
    constraint fk_enrollments_students
    	foreign key (students_id)
    	references students(id)
);
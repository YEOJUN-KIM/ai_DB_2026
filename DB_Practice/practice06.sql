-- where로 테이블 연결
SELECT
    s.id,
    s.name,
    s.email,
    s.age,
    s.major,
    STRING_AGG(c.title, ', ' ORDER BY c.id) AS courses
FROM students s, courses c, enrollments e
WHERE s.id = e.student_id
  AND c.id = e.course_id
GROUP BY
    s.id,
    s.name,
    s.email,
    s.age,
    s.major
ORDER BY s.id;

-- join으로 테이블 연결
SELECT
    s.id,
    s.name,
    s.email,
    s.age,
    s.major,
    STRING_AGG(c.title, ', ' ORDER BY c.id) AS courses
FROM students s
JOIN enrollments e
    ON s.id = e.student_id
JOIN courses c
    ON c.id = e.course_id
GROUP BY
    s.id,
    s.name,
    s.email,
    s.age,
    s.major
ORDER BY s.id;


select s.id "학생번호", s.name "학생이름", s.email "이메일", s.major "전공",
       e.id "수강번호", e.enrolled_at "수강일자",
       c.id "과목번호", c.title "과목명", c.instructor "교강사명", c.hours "총시간"
from students s
inner join enrollments e
on s.id = e.student_id
inner join courses c
on c.id = e.course_id
where c.hours >= 10 and s.id = 1;


-- INNER JOIN: 수강 내역이 있는 학생과 과목만 조회
select s.id "학생번호",
       s.name "학생이름",
       c.id "과목번호",
       c.title "과목명"
from students s
inner join enrollments e
    on s.id = e.student_id
inner join courses c
    on c.id = e.course_id
order by s.id, c.id;


-- LEFT JOIN: 수강 여부와 관계없이 모든 학생 조회
-- 수강 내역이 없는 학생의 과목 정보는 NULL로 표시된다.
select s.id "학생번호",
       s.name "학생이름",
       c.id "과목번호",
       c.title "과목명"
from students s
left join enrollments e
    on s.id = e.student_id
left join courses c
    on c.id = e.course_id
order by s.id, c.id;


-- RIGHT JOIN: 수강생 존재 여부와 관계없이 모든 과목 조회
-- 수강생이 없는 과목의 학생 정보는 NULL로 표시된다.
select s.id "학생번호",
       s.name "학생이름",
       c.id "과목번호",
       c.title "과목명"
from enrollments e
inner join students s
    on s.id = e.student_id
right join courses c
    on c.id = e.course_id
order by c.id, s.id;

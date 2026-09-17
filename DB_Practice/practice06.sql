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
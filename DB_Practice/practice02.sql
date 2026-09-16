-- students 테이블에 별칭 s를 지정한다. 쿼리 안에서 s.name처럼 열을 참조할 수 있다.
select * from students s;

-- 테이블 완전 초기화 -> 데이터 모두 삭제
truncate students;


-- 전체 데이터를 확인한 뒤 각 조건의 조회 결과를 비교한다.
select * from students;

/*
 조건 지정 (WHERE절)
 조건에 맞는 행만 조회한다.
*/

-- 1. 나이가 21인 학생 조회
select * from students
where age = 21;

-- 2. 나이가 20 이상인 학생의 이름과 나이 조회
select name, age from students
where age >= 20;

-- 3. 이름이 '김철수'인 학생 조회
select * from students
where name = '김철수';

-- 여러 조건 연결: AND는 모든 조건, OR는 하나 이상의 조건을 만족하는 행을 조회한다.
-- AND와 OR를 함께 사용할 때는 괄호로 조건을 묶어 의도를 명확하게 표현한다.

-- 4. 나이가 21이면서 이름이 '김'으로 시작하는 학생
select * from students
where age = 21 and name like '김%';

-- 5. 나이가 20이거나 21인 학생
select * from students
where age = 20 or age = 21;

-- 6. 나이가 20 또는 21이면서 이름이 '김'으로 시작하는 학생
select * from students
where (age = 20 or age = 21) and name like '김%';

/*
 문자열 패턴 검색 (LIKE 연산자)
 %: 0개 이상의 글자와 일치
 _: 정확히 한 글자와 일치
*/

-- 1. 이름이 '김'으로 시작하는 학생 조회
select * from students
where name like '김%';

-- 2. 이름에 '영'이 포함된 학생 조회
select * from students
where name like '%영%';

-- 3. 이름이 '수'로 끝나는 학생 조회
select * from students
where name like '%수';

-- 4. '김' 뒤에 정확히 두 글자가 오는 학생 조회
select * from students
where name like '김__';

-- 5. 이메일이 '@example.com'으로 끝나는 학생의 이름과 이메일 조회
select name, email from students
where email like '%@example.com';

/*
 조회 결과 정렬 (ORDER BY절)
 ASC: 오름차순 (생략 시 기본값)
 DESC: 내림차순
 여러 열을 지정하면 앞의 열부터 정렬하고, 같은 값은 다음 열로 정렬한다.
 WHERE와 함께 사용하면 ORDER BY를 WHERE 뒤에 작성한다.
*/

-- 1. 나이가 적은 순으로 조회
select * from students
order by age asc;

-- 2. 나이가 많은 순으로 조회
select * from students
order by age desc;

-- 3. 나이가 같으면 id가 작은 순으로 조회
select * from students
order by age asc, id asc;

-- 4. 이름이 '김'으로 시작하는 학생을 나이 내림차순, id 오름차순으로 조회
select s.name, s.age from students s
where s.name like '김%'
order by s.age desc, s.id asc;


-- id가 큰 순으로 학생 3명을 조회
select * from students
order by id desc
limit 3;

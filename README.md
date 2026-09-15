# ai_DB_2026

ai에이전틱_DB리포지토리

## 1일차

### PostgreSQL

데이터베이스. 데이터를 한군데에서 관리하는 목적의 시스템

줄여서 Postgre 라고 통칭. **관계형** 데이터베이스.

`SQL`을 통해서 데이터를 저장, 수정, 삭제, 조회 할 수 있는 시스템

- 관계형 데이터베이스
  - Oracle
  - MySQL
  - SQL Server

위 대부분 상용 소프트웨어, Postgre는 **오픈소스 시스템**. 라이선스 비용X

### DB의 특징

- 데이터 무결성
- 데이터 안정성
- 데이터 동시성
- 표준SQL 지원
- 확장성

### Postgre 설치

- 자신의 OS에 직접 설치하는 방법
- postgresql-18.6-3-windows-x64.exe 실행

<table>
  <tr>
    <td>
      <img src="./img/비밀번호%20설정.png" width="300">
    </td>
    <td>
      <b>비밀번호 설정</b><br><br>
      • superuser 아이디: <code>postgres</code><br>
      • 비밀번호: ex) <code>123456</code>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td>
      <img src="./img/포트%20설정.png" width="300">
    </td>
    <td>
      <b>포트 설정</b><br><br>
      • Port: <code>5432</code><br>
      • 기본 PostgreSQL 포트는 5432
    </td>
  </tr>
</table>

- DBeaver 설치

  - GUI DB관리 실행 툴
  - 다운로드 링크 : https://dbeaver.io/download/
- DB 접속

  1. DBeaver 실행
  2. 새 데이터베이스 연결 클릭
  3. 데이터베이스 설정
  4. Test Connection 클릭 Driver 다운로드
  5. 정상 접속 확인
  6. 확인 후 완료 클릭

#### Docker 설치

- 환경의존성 문제를 해결한 컨테이너 기술 솔루션
- 가상환경 상 프로그램 실행하게 제공
- 컨테이너 - OS, 라이브러리, 설정 등 하나의 패키지로 만들어진 이미지
- Docker 실행파일 -> Docker Desktop 윈도우에서 Docker를 편하게 사용하도록

#### Docker Desktop 설치

- https://docs.docker.com/desktop/setup/install/windows-install/
- 윈도우 버전 설치
- close and Restart 이후
- WSL(Window Subsystem for Linux)설치

<table>
  <tr>
    <td>
      <img src="./img/WSL설치.png" width="500">
    </td>
    <td>
      <b>PowerShell을 관리자권한으로 실행</b><br><br>
      <b>wsl --install를 입력</b><br><br>
    </td>
  </tr>
</table>

#### PostgresSQL 이미지 다운로드
- 이미지 : 도커 리포지토리에 미리 만들어놓은 시스템 패키지
- 컨테이너 : 나의 도커에서 미리 다운로드받은 이미지를 동작시킨 시스템

#### Docker 기본 명령어
- Postgres 이미지 다운로드
``` bash
  docker pull postgres:latest
```
- Docker 명령어로 실행
  - 여러 옵션으로 실행해야하므로 주로 명령어로 실행함
``` bash
  docker run --name my-postgres -e POSTGRES_PASSWORD=123456 -p 25432:5432 -d postgres:latest
```

### PostgresSQL 기본구조

<table>
  <tr>
    <td>
      <img src="./img/DB기본구조.png" width="300">
    </td>
    <td>
      <b>ai_db : 데이터베이스(프로젝트 전체 공간)</b><br><br>
      <b>Schemas : 프로젝트 폴더</b><br><br>
      <b>Tables : 실제 데이터를 담는 표</b><br><br>
    </td>
  </tr>
</table>

### DB 생성

- SQL 편집기 클릭
- 새이름으로 저장 클릭 후 *.sql로 저장

```sql
 -- 새 데이터베이스 생성 
 create database ai_db;
```

- 입력 후 실행(Ctrl + Enter) 후 새로고침(F5)

### Table 생성

- SQL Schemas를 ai_db로 옮겨준 후(Ctrl + 0)

```sql
 -- Table 생성
create table students (
   id int generated always as identity primary key,	    -- 학생 구분값 자동증가
   name varchar(50) not null,							-- 이름
   age int,											    -- 나이
   email varchar(100),									-- 이메일
   created_at timestamp default current_timestamp 		-- 현재 작성된 일자
);
```

- 입력 후 실행(Ctrl + Enter) 후 새로고침(F5)

### 데이터 조작어(DML)

- CRUD - Create, Read, Update, Delete 약자
  - C - Insert
  - R - Select
  - U - Update
  - D - Delete

#### `insert문` 쿼리 작성

```sql
 -- Insert문
insert into students (name, age, email) values 
('홍길동', 20, 'hong@example.com'),
('김철수', 21, 'KIM1@example.com'),
('김영희', 21, 'KIM2@example.com');
```

<br>

#### `select문` 쿼리 작성

```sql
-- Select문
select * from students;
select name from students;
```

<br>

#### `update문` 쿼리 작성

```sql
-- Update문
update students set
	email = 'hong@kakao.com'
	where id = 1;
```

<br>

#### `delete문` 쿼리 작성

```sql
-- Delete문
delete from students 
  where name = '홍길동';
```

<br>

### Postgres 기본타입


| 데이터 타입 |        설명        |          예제          |
| :---------: | :----------------: | :---------------------: |
|     INT     |        정수        |       10, 25, -9       |
|   BIGINT   |      큰 정수      |    1000000000000...    |
|   NUMERIC   |    정확한 소수    |        120000.56        |
| VARCHAR(n) |  길이 제한 문자열  |        '홍길동'        |
|    TEXT    | 긴 문자열(대략 1G) |    뉴스 게시물 본문    |
|   BOOLEAN   |      참 거짓      |       true, false       |
|    DATE    |        날짜        |       2026-09-15       |
|  TIMESTAMP  | 일자(날짜 + 시간) | 2026-09-15 16:00:30.125 |
|    JSONB    |    JSON 데이터    |   {"name" : "홍길동"}   |

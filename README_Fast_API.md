# FastAPI

- 실행 속도가 빠르다
- 테스트를 위한 UI를 자동으로 만들어 줌
- Pydantic을 사용, 요청과 응답 데이터를 검증할 수 있다
- PostgreSQL, MySQL, Oracle 등 DB와 연동이 쉽다

### API 서버

클라이언트 요청을 받아 필요한 작업을 수행, 그 결과를 클라이언트에게 돌려주는 프로그램

## 개발환경 설정

### FastAPI 패키지 설치

```bash
pip install fastapi uvicorn
```

- 현재 파이썬에 `fastapi`와 `uvicorn` 패키지를 설치
- C:\Users\User\AppData\Roaming\Python\Python314\Scripts
- sysdm.cpl을 실행 - 고급 - 환경변수
- Path에서 C:\Users\User\AppData\Roaming\Python\Python314\Scripts를 추가
- cmd, VS CODE 재시작

### Fast API 시작
``` bash
uvicorn Main:app --reload --port 8000
```
- `Main:app` : 실행할 파일명
- `--reload` : 수정되면 곧바로 반영되어서 서버 재시작
- `--port 8000` : 서버를 시작할 포트 지정
- http://127.0.0.1:8000 로 접속
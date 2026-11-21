# 1) 기존 베이스 이미지: 공식 nginx 경량(alpine) 버전
FROM nginx:alpine

# 2) 이미지 정보(메타데이터) 기록
LABEL org.opencontainers.image.title="codyssey-web" \
      org.opencontainers.image.authors="DoSquatBro"

# 3) 환경변수: 실행 환경 구분용
ENV APP_ENV=dev

# 4) 기본 페이지를 내 웹페이지로 교체
COPY app/ /usr/share/nginx/html/

# 5) 이 컨테이너가 80번 포트를 사용한다고 문서화
EXPOSE 80

# 6) 헬스체크: 30초마다 웹서버가 응답하는지 스스로 점검
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -qO- http://127.0.0.1/ || exit 1
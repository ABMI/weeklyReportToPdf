# weeklyReportToPdf
의료정보학과 연구노트 작업을 간편하게 하기위해 작성된 코드 입니다.  
주간보고 파일을 .md > .html > .pdf 순으로 변환하며 pdf로 변환할때는 wkhtmltopdf를 사용합니다.

## 1. git clone
```bash
git clone https://github.com/ABMI/weeklyReportToPdf.git
cd weeklyReportToPdf
```

## 2. wkhtmltopdf 다운로드 
URL : https://wkhtmltopdf.org/downloads.html  

## 3. wkhtmltopdf 설치
설치 경로는 ./weeklyReportToPdf

## 4. 주간보고 clone
```bash
git clone <주간보고 페이지>.wiki.git
ex) git clone https://github.com/ABMI/WeeklyWorkReport-2020.wiki.git
```

## 5. 주간보고 스케쥴,home 삭제
주간보고 포맷에 맞게 개발되어 아래 파일들을 삭제해야 코드가 제대로 돌아갑니다. 
- home.md
- N월 N주차-주간스케쥴.md

## 6. weeklyReportToPdf.R 파일 이동
주간보고가 있는 파일안에 weeklyReportToPdf.R 파일을 넣어준 뒤 코드 실행  

- R 실행시 주의사항  
getwd() 명령어로 현재 경로가 주간보고가 있는 경로가 맞는지 확인 아닐 시, setwd()로 경로 변경



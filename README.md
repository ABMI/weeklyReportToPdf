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

## weelyReportToPdf.R 실행
```R
# Input Parameter#####
wikiFolderPath = 'D:/test/weeklyReportToPdf/WeeklyWorkReport-2022.wiki'
#######################

# 위 wikiFolderPath의 경로를 Clone 된 WeeklyWorkReport Path로 수정 후 
# 전체 실행(Ctrl+A -> Ctrl+Enter)
```
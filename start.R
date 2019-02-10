a <- 100
b <- 200

print(a + b)

# a, b에 대한 변수 설정 후 표기
# 프로그램 전체 제어
  # 1. 프로그램은 순차적으로 실행
  # 2. 조건
  # 3. 반복
# 데이터의 자료구조
  #  데이터프레임=벡터(열) + 리스트(행)

name <- c(1, 2, 3, 4, 5)
name[3]
print(name[3])

name[3] <- 333
name


print(name)

str(name) #구조
table(name) #요약
class(name) #데이터의 타입
typeof(name) #데이터의 타입(상세)

name <- c(1,2,3,4)
name <- c("김지훈","이유진","박동현","김민지")
name[4] <- "송민지"
eng <-  c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)

# 자동완성 (컨트롤+스페이스바, tap)
midTerm <- data.frame(name, eng, math)
midTerm

str(name) #구조
table(name) #요약
class(name) #데이터의 타입
typeof(name) #데이터의 타입(상세)

str(midTerm)
# 파일명 대문자 맞춰서 해야함
# name 명 factor로 들어가는 이유는 그래프 표현할 때 X축이 되야 함
# 3variables 3개 열 4obs 4개 행

View(midTerm)

##################################################
# 2. 직접 데이터 프레임 만들기

lastTerm <-  data.frame(name2 = c("song", "kim", "park"),
                        eng2 = c(100, 50, 80),
                        math2 = c(50, 60, 90)
                        )

View(lastTerm)

lastTerm$name2

str(lastTerm)
str(lastTerm$name2)
str(lastTerm$eng2)
table(lastTerm$eng2)

################################################################
# 연습

test <- c("apple", "banana", "kiwi","apple","banana","apple")
table(test)

###############################################################

mean(lastTerm$eng2)

###############################################################

파일형태
#1. CSV 파일 (텍스트파일, 쉼표로 구분)
#2. EXCEL 파일
#3. JSON, XML 파일
#-> 파일 다운로드 or 원격 접속 후 데이터 요청
#open된 방법으로 데이터 open : dataSend()
#OPEN API 방식

##############################################
# 파일 업로드 해서 데이터 가져오기 \는 /로 수저

midTerm2 <- read.csv("C:/Users/PC/Documents/day02/midterm02.csv")
View(midTerm2)
str(midTerm2)

#############################################
#1. tool > intstall packages 들어가서 라이브러리 readxl 다운받아 설치
    # install.packages("readxl")
#2. 사용하겠다 세팅해야 함 함수 library("readxl") 컨트롤 엔터

library("readxl")

# 엑셀 불러오기 (반드시 불러올 폴더 보기 버튼 > 파일확장명 표시 할 것)
# 오류가 발생할 때 변수명을 midterm33으로 수정하거나, 파일명을 바꾸어 다시 작업할 것
# 엑셀의 컬럼값이 없으면 임의 값을 줘야 함. 시트 여러개일 경우 끝에 시트 숫자 표
# ex) read_excel("C:/Users/PC/Documents/day02/midtest3.xlsx, col_names = F)
# ex) read_excel("C:/Users/PC/Documents/day02/midtest3.xlsx, sheet = 3)
midTerm3 <- read_excel("C:/Users/PC/Documents/day02/midtest3.xlsx")
View(midTerm3)
str(midTerm3)

midTerm3 <- read_excel("C:/Users/PC/Documents/day02/midtest3.xlsx", sheet = 2)
View(midTerm3)

######################################################
## 삭제 시
rm(midTerm3) #변수 삭제
ls() #변수들의 리스트 확인

rm(midTerm3)
list <- ls()
class(list)
rm(list = ls())
#####################################################
# 가지고 온 데이터로 가공하기
midTerm3$name
subMidTerm <- data.frame(midTerm3$name,
                         midTerm3$tell
                         )

subMidTerm

# ↑ 이렇게 표기 시 컬럼 값이 제대로 안나옴  아래와 같이  컬럼값재가공

subMidTerm2 <- data.frame(name2 = midTerm3$name,
                          tel2 = midTerm3$tell
                         )

subMidTerm2

###################################
#파일 저장 방법

write.csv(subMidTerm2, file = "subMidTerm2.csv")

##################################
# 가공된 변수에 내용 추가하기 1. $로 새로운 컬럼 추가

subMidTerm2$age2 <- c(20, 30, 40)
subMidTerm2

addr <- c("서울시", "부산", "경기도")
subMidTerm2$addr <- addr
subMidTerm2

names(subMidTerm2)

# 1번쨰 열 추출 방법 데이터테이블[숫자] > name2
subMidTerm2[1]

# 행 추출 방법 데이터테이블[숫자,] > 1번째 행
subMidTerm2[1,]

# 열 추출 방법 데이터테이블[, 1] > 1번째 열
subMidTerm2[,1]

# 열,행 추출방법 데이터테이블[숫자,숫자] >1번째 열,행
subMidTerm2[1, 1]
subMidTerm2[1, 4]
subMidTerm2[3, 1]
subMidTerm2[3, 3]

# 열  삭제
subMidTerm2[,-1]
subMidTerm2

subMidTerm3 <- subMidTerm2[, -1]
subMidTerm3

# 원본은 그대로 있기 때문에 표기 되는 값은 원본 값으로 표기 됌
# 원본에 반영하려면 지운것을 가지고 원본쪽에 저장해야 함

# subMidTerm2 <- subMidTerm2[, -1]

# 행 삭제
subMidTerm2[-1,]
subMidTerm2

subMidTerm4 <- subMidTerm2[-1,]
subMidTerm4

# :(콜론) 은 ~ 의미임. 2열~4열까지 삭제할때 -c(2:4)로 표현

subMidTerm5 <- subMidTerm2[, -c(2:4)]
subMidTerm5

#, (콤마)는 선택적인 의미, 1,3열 삭제 시 -c(1,3)으로 표현
subMidTerm6 <- subMidTerm2[,-c(1,3)]
subMidTerm6

###############################################
# 1부터 100까지 넣기
 temp1 <- c(1:100)
temp1

# 1부터 10까지 1,3,4,5,7,9, 넣기
temp2 <- c(1,3,5,7,9)
temp2

##############################################
#조건문
a <- 100
b <- 200
c <- 100
print(a == b) #비교의 결과 참이면 true / 거짓으면 false
print(a == c)

if(a != b) {
  print("두 수가 달라요.")
  print("끝...")
}

print(a != b)

##################################
#괄호
#() 소괄호 : 함수, 조건
#{} 중괄호 : 포함
#[] 대괄호 : 인덱스, 리스트

##############################
#조건문 test
#순차적 실행 기본
#조건문 (조건에 따라서 다르게 처리해야 하는 경우)
#반복문 ( 여러번 반복해서 처리해야 하는 경우)
#else if 값이 false 면 else 내용 표기

i <-  2
if(i<5) {
  print("5보다 작아요...")
}else{
  print("5보다 커요...")
}
  
i2 <- "빅데이터"
if(i2 == "빅데이터"){
  print("빅데이터반이 맞군요..")
}else if(i2 == "파이썬"){
  print("파이썬반이군요..")
  }else{print("아무 반도 아니군요..")
  }

i3 <- "수박"
if(i3 == "사과"){
  print("제철이군요")
}else if(i3 == "배"){
  print("설에 먹어요")
}else if(i3 == "키위"){
  print("수입이예요")
}else {
  print("과일이 아닌가봐요")
}

##########################################
# 패키지 설치하기 (lubridate)
# 날짜와 시간 표기 하는 함수 now() 
# wday(date, label = T) 요일 구하는 함수

install.packages("lubridate")
library("lubridate")

date <-  now()
date

year(date)
month(date)
day(date)
wday(date, label = T)
hour(date)
minute(date)
second(date)
     
##########################################
#조건문 활용하기
#11시전이면 굿모닝 / 15시 전이면 굿에프터 눈 / 20시 전이면 굿이브닝 / 기타이면 굿나잇

date1 = hour(date)
if(date1 < 11){
  print("굿모닝")
} else if(date1 < 15){
    print("굿에프터 눈")
} else if(date1 < 20){
    print("굿이브닝")
} else print("굿나잇")

###############################################
#입력받은 값 판별
#scan에 값을 입력 / 문자를 값으로 입력 시 what="" 표현

input <- scan()

if(input == "100점"){
  print("만점입니다")
}else{
  print("다음 기회에")
}

input <- scan(what="")

if(input == "100점"){
  print("만점입니다")
}else{
  print("다음 기회에")
}


#####################################################
# 삼항 연산자
#result = ifelse(변수>조건, "참", "거짓")
# 한줄로 표현가능


temp3 <- 80
result <- ifelse(temp3 >= 80, "통과", "불합격")
result

#####################################################
# 반복문
# 하단에 조건을 넣으면 조건값 될때까지만 돌앙감
#  temp4 <-temp4-1 temp4가 -1될때까지 돌아간다는 뜻,
  #temp4가 10보다 작다 했으니, 10 , 9 ,8 , 7, 6 이런식으로,
  # 그러나 조건에서 7이상 될때 표기 하라 했으니 10 , 9, 8  3번만 표기
# 마지막 문장 break 하면 반복문 끝
# \n 엔터 기능

temp4 <- 10
while(temp4 > 7){
  print("7보다 크군요..!!")
  temp4 <-temp4-1
  }

# for(A in B) B에 있는 값을 A에 넣기 
#EX) for(A in B) {print(조건표출 값)}

temp5 <-  c(1:5)
for(temp6 in temp5){
  print(temp6)
}

name <- c("김아무개", "박아무개", "송아무개", "정아무개")
for(temp8 in name){
  cat("당신의 이름은", temp8, "이군요\n")}

student <- data.frame(name3 = name,
                      age3 = c(30, 50, 15, 45)
                      )
View(student)
                      
                      
for(temp9 in student$name2){
  print(temp9)
}

while(TRUE){
  input2 <- scan()
  print(input2)
  if(input2 == 0){
    print("종료합니다")
    break
  }
}
  

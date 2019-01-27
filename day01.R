install.packages("glue")
install.packages("ggplot2")

library(glue)

# 여기에 glue를 이용해서 프린트연습
# 
# temp 변수 : 아무것도 안붙어있다
# 할당 연산자 (알트+-)
평균 %>%  정렬 %>%  프린트

ages <- c(10, 30, 50)
ages[1]
ages[1] <- 

  # 이름 벡터를 만들고
  # 두번째 사람이 박아무개로 개명
  # 이름의 전체 내용을 출력
  
name <- c("김아무개","박아무개","이아무개")
name[2] <- "명광민"
print(name)

# facter구분하기

address <- c("서울", "대구", "부산", "군산", "서울", "서울", "대구")
str(address)
chr [1:7] "서울" "대구" "부산" "군산" "서울" "서울" "대구")
 
address <- c("서울", "대구", "부산", "군산", "서울", "서울", "대구")
str(address)

address2 <- as.factor(address)
str(address2)

address2[1] <-  "대구"
address2[1] <-  "광주"

# 입력의 다양한 형태
x <- scan()
x

x2 <- scan()
x2[2] <- 222
x2

str(x2)
class(x2)
typeof(x2)


food <- scan(what = "")
food

str(food)
class(food)
typeof(food)

favorite <- food[1]
cat("내가 제일 좋아하는 음식은", favorite)

second <- food[2]
glue("나의 {second} 음식은 2번째로 좋아하는 음식이에요.")

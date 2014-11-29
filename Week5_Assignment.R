## Week 5 Assignment - Shipra Ahuja


## Solution 1 - Ask 3 questions to be answered based on data provided

## 1) What is the total number of polls received in Edinburgh and Glasgow for each age-group?

## 2) How many people prefer Cullen Skink over Partan bree?

## 3) What age group of people preferred Partan bree?

## Solution 2 - Create dataframe in its current "messy" state

Edinburgh16to24 <- c(80100,35900)
Edinburgh25plus <- c(143000,214800)
Glasgow16to24 <- c(99400,43000)
Glasgow25plus <-c(150400,207000)
Response <- c("Yes","No")
messy_df <- data.frame(Edinburgh16to24,Edinburgh25plus,Glasgow16to24,Glasgow25plus,Response)

## Result after exceuring Rscript - 

##Edinburgh_16to24 Edinburgh_25plus Glasgow_16to24 Glasgow_25plus Response
##1            80100           143000          99400         150400      Yes
##2            35900           214800          43000         207000       No

## Solution 3 - Create tidy dataset using functions from tidyr package

tidy_df <- messy_df %>% 
          gather(key,CountofPolls,-Response) %>%
          separate(key, c("City", "AgeGroup"))

print (tidy_df)

## Result after executing R code - 
## Response      City AgeGroup CountofPolls
##1      Yes Edinburgh   16to24        80100
##2       No Edinburgh   16to24        35900
##3      Yes Edinburgh   25plus       143000
##4       No Edinburgh   25plus       214800
##5      Yes   Glasgow   16to24        99400
##6       No   Glasgow   16to24        43000
##7      Yes   Glasgow   25plus       150400
##8       No   Glasgow   25plus       207000


## Solution 4 - Answer questions of question 1 using functions from plyr package

## Answer to Question 1 in Question 1 of assignment
## What is the total number of polls received in Edinburgh and Glasgow for each age-group?

ddply(tidy_df,.(City,AgeGroup),summarize,total_no_of_polls = sum(CountofPolls,na.rm=TRUE))

## Result after executing R code - 

##   City      AgeGroup total_no_of_polls
## 1 Edinburgh   16to24            116000
## 2 Edinburgh   25plus            357800
## 3   Glasgow   16to24            142400
## 4   Glasgow   25plus            357400


## Answer to Question 2 in Question 1 of assignment
## How many people prefer Cullen Skink over Partan bree?

ddply(subset(tidy_df, Response =="Yes"),.(Response),summarize,votesforCullenSkink = sum(CountofPolls,na.rm=TRUE))


## Result after executing R code - 

##Response votesforCullenSkink
##1    Yes              472900

## Answer to Question 3 in Question 1 of assignment
## What age group of people preferred Partan bree?

max(ddply(subset(tidy_df, Response =="No"),.(Response,AgeGroup),summarize,votesforPartanbree = sum(CountofPolls,na.rm=TRUE))[,3])


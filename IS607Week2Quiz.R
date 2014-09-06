## Week 2 Quiz Solutions - Shipra Ahuja
##
##

## Solution 1 - Create a vector that contains 20 numbers containing duplicates
## 

x <- rep(1:15,len=20)  ## Generated 20 numbers using repeat function for numbers from 1 to 15.
x                      ## Prints the values in the vector

## Result after executing R script - 
## [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15  1  2  3  4  5



## Solution 2 -  Use R to convert the vector from question 1 into a character vector.
##
y <- as.character(x)   ## Convert into character vector
class(y)               ## Display the class of converted vector
y                      ## Print the values in the vector

## Result after executing R script - 
## [1] "character"

## [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14" "15" "1" 
## [17] "2"  "3"  "4"  "5"


## Solution 3 - Use R to convert the vector from question 1 into a vector of factors.
##
z <- factor(x)         ## Convert into vector of factors
class(z)               ## Display the class of the converted vector
z                      ## Print the values of the vector

## Result after executing R script - 

##[1] "factor"

##[1] 1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 1  2  3  4  5 
##Levels: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15



## Solution 4 - Display the number of levels in the vector from Question 3
##
levels(z) 

## Result after executing R script - 
## [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14" "15"


## Solution 5 - Solve the formula 3x^2 - 4x + 1 for vector in Question 1
##
formula <- (3*(x^2)) - (4*x) + 1   ## x is a vector created in question 1
formula                            ## Prints the values calculated after solving equation

## Result after executing R script -  

## [1]   0   5  16  33  56  85 120 161 208 261 320 385 456 533 616   0   5  16  33  56


## Solution 6 - Implement ordinary least squares regression in matrix form
##
list1 <- list(x = c(1,1,1,1,1,1,1,1,5,4,6,2,3,2,7,8,8,9,4,7,4,9,6,4),z = c(45.2,46.9,31.0,35.3,25.0,43.1,41.0,35.1)) ## List contains vectors for creating matrices
list2 <- list(a = 8,b = 3, c = 1)              ## List contains no. of rows and columns
X <- matrix(list1$x,nrow=list2$a,ncol=list2$b) ## Create matrix X
y <- matrix(list1$z,nrow=list2$a,ncol=list2$c) ## Create matrix y 
beta <- (solve(Xt %*% X) %*% Xt) %*% y         ## Formula to evaluate beta

Results after executing R script - Value of Beta 
##       [,1]
##[1,] 3.153126
##[2,] 1.983743
##[3,] 3.999539


## Solution 7 - Create named lists.
namedlist1 <- list(name = "JOHN", country = "USA", school = "CUNY") ## Named list containing strings.
namedlist2 <- list(x = 10,y = 20, z = 30)                           ## Named list containing numbers.
namedlist1                                                          ## Print the namedlist1
namedlist2                                                          ## Print the namedlist2

## Result after executing R script for namedlist1 and namedlist2 - 

##$name
##[1] "JOHN"

##$country
##[1] "USA"

##$school
##[1] "CUNY"


##$x
##[1] 10

##$y
##[1] 20

##$z
##[1] 30



## Solution 8 - Create a data frame with 4 columns. Dataframe contains 4 columns each of type character,
## factor with three levels, numeric & date with 10 rows.

Name = c("David", "John", "Tom", "Bob", "Matt", "Lisa", "Nancy","Peter", "Anne", "Paige")
Age  = c(30, 35, 60, 55, 40, 25, 56, 45, 73, 62)
DateofRetirement = as.Date(c("2020-08-31", "2015-09-30", "2015-09-15", "2017-03-01", "2014-12-15", "2016-04-30", "2015-11-30","2015-10-15", "2018-12-31", "2019-07-30"))
df <- data.frame(Serno=factor(seq(1:10)), Name, Age, DateofRetirement,stringsAsFactors=FALSE)
df                            ## Prints the values in dataframe
class(df$Serno)               ## Display the factor class 
class(df$Name)                ## Display the character class
class(df$Age)                 ## Display the numeric class
class(df$DateofRetirement)    ## Display the date class


## Results after executing R script - 

##    Serno  Name Age DateofRetirement
## 1      1 David  30       2020-08-31
## 2      2  John  35       2015-09-30
## 3      3   Tom  60       2015-09-15
## 4      4   Bob  55       2017-03-01
## 5      5  Matt  40       2014-12-15
## 6      6  Lisa  25       2016-04-30
## 7      7 Nancy  56       2015-11-30
## 8      8 Peter  45       2015-10-15
## 9      9  Anne  73       2018-12-31
## 10    10 Paige  62       2019-07-30

##[1] "factor"
##[1] "character"
##[1] "numeric"
##[1] "Date"


## Solution 9 - Add a row with a value for the factor column that isnt already in the list of levels

df2 <- data.frame(Serno=as.factor(11),Name="Jerry",Age=54,DateofRetirement=as.Date("2018-07-15"), stringsAsFactors=FALSE)
combine <- rbind(df,df2)  ##rbind dataframe df from question 8 with the new dataframe df2

## Result after executing R script - 

##Serno  Name Age DateofRetirement
##1      1 David  30       2020-08-31
##2      2  John  35       2015-09-30
##3      3   Tom  60       2015-09-15
##4      4   Bob  55       2017-03-01
##5      5  Matt  40       2014-12-15
##6      6  Lisa  25       2016-04-30
##7      7 Nancy  56       2015-11-30
##8      8 Peter  45       2015-10-15
##9      9  Anne  73       2018-12-31
##10    10 Paige  62       2019-07-30
##11    11 Jerry  54       2018-07-15


## Solution 10 - Read temperatures.csv file from the current working directory

setwd("C:\\Users\\Shipra\\Documents\\CUNY\\IS607DataAcq&Mngt\\Week 2")
tempdata <- read.csv("temperatures.csv")


## Solution 11 - Read measurements.txt TSV file from a directory other than current working directory

measuredata <- read.table("./CUNY/IS607DataAcq&Mngt/Week 2/measurements.txt")



## Solution 12 - Show the code that will read in a delimited file with a pipe separator (the "|" symbol) from a website location.
##
fileurl <- "http://homepages.wmich.edu/~m3schul1/pipetest.psv"
download.file(fileurl, destfile = "./CUNY/IS607DataAcq&Mngt/Week 2/pipetest.psv")
readfile <- read.delim("./CUNY/IS607DataAcq&Mngt/Week 2/pipetest.psv", header = FALSE,sep = "|")

## Results after executing R script - 
##V1   V2              V3   V4
##1  Monday  9am College Algebra Wood
##2  Monday 11am   Business Math Rood
##3 Tuesday 12pm      Statistics Wood



## Solution 13 - Loop calculating 12 factorial
##
fact <- 1
n <- 12
while (n > 1){
  fact <- fact * n
  n <- n - 1
}
fact

## Result after executing R script - 
## [1] 479001600      Result of 12! = 479001600



## Solution 14 - Use loop to calculate the final balance, rounded to the nearest cent, in an account that earns 3.24% interest compounded 
## monthly after six years if the original balance is $1,500

amount <- 1500
term <- 6 * 12
rateofinterest <- 3.24/(100*12)
i <- 1

for (i in 1:term){
  amount <- amount + (amount * rateofinterest)
  i <- i + 1
}
amount <- round(amount,2)
amount

## Result after executing R script - 
## [1] 1821.4        Final balance = 1821.4



## Solution 15 - Create a numeric vector of length 20 and calculate the sum of every third 
## element of the vector 

num <- rep(c(10,20,30,40,50),len=20)
i <- 1
sum <- 0
for (i in 1 : length(num)){
  if (i%%3 == 0){
    sum <- sum + num[i]
  }
}
sum

## Result after executing R script - 
## [1] 180      Sum of every third element is 180



## Solution 16 - Use a for loop to calculate sum of x^i where i= 1 to 10 for x=2.

x <- 2
y <- 0
for (i in 1:10){
  y <- y + (x ^ i)
}
y

## Result after executing R script - 
## [1] 2046    Result of x^i for i 1 to 10 = 2046.    

## Solution 17 - Use a while loop to calculate sum of x^i where i= 1 to 10 for x=2.

x <- 2
y <- 0 
i <- 1
while (i <= 10){ 
  y <- y + (x^i)
  i <- i + 1
}
y

## Result after executing R script - 
## [1] 2046    Result of x^i for i 1 to 10 = 2046.


## Solution 18 - Solve the summation of x^i without using loops

x <- 2
i <- c(1,2,3,4,5,6,7,8,9,10)
summation <- sum(sapply(x^i,sum))
summation

## Result after executing R script - 
## [1] 2046    Result of x^i for i 1 to 10 = 2046


## Solution 19 - Generate a sequence of numbers from 20 to 50 by 5.

sequence <- seq(20,50,by=5)
sequence

## Result after executing R script -
## [1] 20 25 30 35 40 45 50



## Solution 20 - Create a character vector with same word "example" repeated 10 times

repeatchar <- rep("example",len=10)
repeatchar


## Result after executing R script -
## [1] "example" "example" "example" "example" "example" "example" "example" "example"
## [9] "example" "example


## Solution 21 - Take a trio of input numbers a, b, and c and implement the quadratic equation.

a <- 1
b <- 6
c <- 8
x <- (-b + sqrt(b^2 - (4*a*c)))/(2*a)
x
x <- (-b - sqrt(b^2 - (4*a*c)))/(2*a)
x

## Result after executing R script -
## [1] -2
## [1] -4

## Roots of quadratic equation are x = -2 and x = -4

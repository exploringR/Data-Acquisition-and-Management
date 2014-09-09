## Week 2 Assignment - Shipra Ahuja


## Solution 1 - 

## a) Assign the five individuals to a vector called queue.

queue <- c("James", "Mary", "Steve", "Alex", "Patricia")

## Results -
##[1] "James"    "Mary"     "Steve"    "Alex"     "Patricia"


## b) Update the queue for the arrival of a new patron named Harold.

queue <- append(queue,"Harold",after=length(queue))

## Results -
##[1] "James"    "Mary"     "Steve"    "Alex"     "Patricia" "Harold"

## c) Update the queue to reflect the fact that James has finished checking out.

queue <- queue[-1]

##Results - 
##[1] "Mary"     "Steve"    "Alex"     "Patricia" "Harold"

## d) Update the queue to reflect the fact that Pam has talked her way in front of Steve with just one item.

queue <- append(queue,"Pam",after=1)

##Results-
##[1] "Mary"     "Pam"      "Steve"    "Alex"     "Patricia" "Harold" 

## e) Update the queue to reflect the fact that Harold has grown impatient and left.

queue <- queue[-length(queue)]

##Results-
##[1] "Mary"     "Pam"      "Steve"    "Alex"     "Patricia"


## f) Update the queue to reflect the fact that Alex has grown impatient and left. 
## (Do this as if you do not know what slot Alex currently occupies by number.)

queue <- queue[-match(c("Alex"),queue)]

##Results - 
##[1] "Mary"     "Pam"      "Steve"    "Patricia"

## g) Identify the position of Patricia in the queue.

print(match(c("Patricia"),queue))

## Results - 
##[1] 4


## h) Count the number of people in the queue.
length(queue)

##Results - 
##[1] 4


## Solution 2 - Implement the quadratic equation, meaningful output is given whether 
## there are one,two, or no solutions.

quadraticeqn <- function(a,b,c)
{
  delta = ((b^2) - (4*a*c))
  if (delta > 0)
  {
   r1 <- (-b + sqrt(delta))/(2 * a)
   r2 <- (-b - sqrt(delta))/(2 * a)
   result <- c(r1,r2)
   return(result)
  } else if(delta == 0)
  {
    r1 <- -b/(2 * a)  
    return (r1)
  } else if (delta < 0)
  {
    r1 <- complex(real = -b/(2 * a), imaginary = sqrt(-delta)/(2 * a))
    r2 <- complex(real = -b/(2 * a), imaginary = -(sqrt(-delta)/(2 * a)))
    result <-  c(r1,r2)
    return (result)
  }
}  
  
## Results after executing R script  -    

##Case 1
##> quadraticeqn(1,6,8)
##[1] -2 -4

##Case 2
##> quadraticeqn(1,2,1)
##[1] -1

##Case 3
##> quadraticeqn(2,2,1)
##[1] -0.5+0.5i -0.5-0.5i


## Solution 3 - Use R to determine how many numbers from 1 to 1000 are not divisible by any of 3,7, and 11.

count <- 0
for (i in 1:1000)
  {
    if (i %% 3 != 0 && i %% 7 != 0 && i %% 11 != 0 )
    {
      count <- count + 1
    } 
  }
print (count)  

## Results after executing R script - 
##[1] 520


## Solution 4 - R code that takes three input constants f, g, and h and determines whether they form a Pythagorean Triple

pythagorastriplet <-  function(f,g,h)
{
  maxval <- max(f,g,h)
  minval <- min(f,g,h)
  thirdval <- f + g + h - maxval - minval
  if (maxval^2 == minval^2 + thirdval^2)
  {
    print ("It is a Pythagorean Triplet")
  } else
  { 
    print ("It is not a Pythagorean Triplet")
  }
  
}
##Results after executing R script - 
##> pythagorastriplet(13,12,5)
##[1] "It is a Pythagorean Triplet"
##> pythagorastriplet(12,13,5)
##[1] "It is a Pythagorean Triplet"
##> pythagorastriplet(5,12,13)
##[1] "It is a Pythagorean Triplet"
##> pythagorastriplet(5,3,4)
##[1] "It is a Pythagorean Triplet"
##> pythagorastriplet(3,5,4)
##[1] "It is a Pythagorean Triplet"
##> pythagorastriplet(4,3,5)
##[1] "It is a Pythagorean Triplet"
##> pythagorastriplet(1,2,3)
##[1] "It is not a Pythagorean Triplet"
##> pythagorastriplet(6,4,7)
##[1] "It is not a Pythagorean Triplet"


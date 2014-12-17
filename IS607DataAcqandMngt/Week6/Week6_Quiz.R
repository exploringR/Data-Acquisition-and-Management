# Week 6 Quiz - Shipra Ahuja

install.packages("XML")
require(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theURL, which = 1, header = FALSE, stringsAsFactors = FALSE)
bowlPool


## 1. What type of data structure is bowlpool? 

## Solution 1 - BowlPool is a Dataframe.

class(bowlPool)

## Result - 
##[1] "data.frame"

  
## 2. Suppose instead you call readHTMLTable() with just the URL argument,
## against the provided URL, as shown below

theURL <- "http://www.w3schools.com/html/html_tables.asp"
hvalues <- readHTMLTable(theURL)

## What is the type of variable returned in hvalues?

## Solution 2 -  hvalues is a list

class(hvalues)

## Result -
##[1] "list"


# 3. Write R code that shows how many HTML tables are represented in hvalues

## Solution 3 - 

length(hvalues)   ## Since hvalues is a list, it gives the no. of elements(tables) in the list
names(hvalues)    ## This will give the names of the tables that have been read in hvalues

## There are 7 tables in hvalues.

## Result - 
## [1] 7

##[1] "NULL"        "NULL"        "NULL"        "NULL"        "NULL"        "NULL"       
##[7] "bottomlinks

# 4. Modify the readHTMLTable code so that just the table with Number, 
# FirstName, LastName, # and Points is returned into a dataframe

## Solution 4 - 

table1 <- hvalues[[1]]
print (table1)
class(table1)

## Result - 

##Number First Name Last Name Points
##1      1        Eve   Jackson     94
##2      2       John       Doe     80
##3      3       Adam   Johnson     67
##4      4       Jill     Smith     50

##[1] "data.frame"


# 5. Modify the returned data frame so only the Last Name and Points columns are shown.

## Solution 5 - 

names(table1) <- sub(" ", ".", names(table1))
subset.table1 <- subset(table1,select=c(Last.Name,Points))

## Result - 

##Last.Name   Points
##1   Jackson     94
##2       Doe     80
##3   Johnson     67
##4     Smith     50
  

# 6 Identify another interesting page on the web with HTML table values.  
# This may be somewhat tricky, because while
# HTML tables are great for web-page scrapers, many HTML designers now prefer 
# creating tables using other methods (such as <div> tags or .png files).  

## Solution 6 - 

## Webpage - http://webdatacommons.org/webtables/


# 7 How many HTML tables does that page contain?

## Solution 7 - 

myurl <- "http://webdatacommons.org/webtables/"
cnttables <- readHTMLTable(myurl)
length(cnttables)

## Result - 
## [1] 3

## The webpage identified above contains 3 tables.

##

# 8 Identify your web browser, and describe (in one or two sentences) 
# how you view HTML page source in your web browser.

##Solution 8 - 

## Web Browser - Internet Explorer 11

## In order to view HTML page source, click on the "View" menu on menu bar
## and select "View Source". This will show up the HTML source code for that webpage.


##
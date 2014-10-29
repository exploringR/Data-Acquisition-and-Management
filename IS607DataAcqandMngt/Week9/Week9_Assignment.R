## Week 9 Assignment - Part 2 -  Shipra Ahuja

library(rmongodb)  ## to use all mongo functions
library(plyr)      ## to use rbind
library(lubridate) ## cleanup dates in state,district and territory data

## Connect to MongoDB
x <- mongo.create()

## Get the names of the databases that are existing
show.dbs <- mongo.get.databases(x)
print (show.dbs)

## Set & print the name of the database
db <- "unitedstates"
print (db)

## Get the names of the collections existing in the databases
show.collections <- mongo.get.database.collections(x,db)
print (show.collections)

## Set and print the name of the collection
collection <- "usdata"
print (collection)

## Create the namespace using database and collection names
namespace <- paste(db,collection,sep=".")
print (namespace)

## Get a count of the documents existing in the targetted database/collection(namespace)

doc.count <- mongo.count(x,namespace)
print (doc.count)

## Create empty dataframes to read the state, district and territory data from MongoDB

state.data <- data.frame(stringsAsFactors = FALSE)
district.data <- data.frame(stringsAsFactors = FALSE)
territory.data <- data.frame(stringsAsFactors = FALSE)

## Print the empty dataframes for verification
print (state.data)
print (district.data)
print(territory.data)

## create cursor to read the document from the db
data.cursor <- mongo.find(x,namespace)

## Get state data into state dataframe
for (i in 1:50){
  mongo.cursor.next(data.cursor)
  data.state = mongo.bson.to.list(mongo.cursor.value(data.cursor))
  data.state.df = as.data.frame(t(unlist(data.state)), stringsAsFactors = FALSE)
  state.data = rbind.fill(state.data,data.state.df)
  }

## Get district data into district dataframe
  mongo.cursor.next(data.cursor)
  data.district = mongo.bson.to.list(mongo.cursor.value(data.cursor))
  data.district.df = as.data.frame(t(unlist(data.district)), stringsAsFactors = FALSE)
  district.data = rbind.fill(district.data,data.district.df)
  
## Get territory data into territory dataframe
for (i in 52:56){
  mongo.cursor.next(data.cursor)
  data.territory = mongo.bson.to.list(mongo.cursor.value(data.cursor))
  data.territory.df = as.data.frame(t(unlist(data.territory)), stringsAsFactors = FALSE)
  territory.data = rbind.fill(territory.data,data.territory.df)
}

## Comments on data cleanup

## 1) The original statedata.csv, districtdata.txt and inhabitedterritorydata.txt files
##    do not have a column called _id. This is assigned when the files/documents are imported/inserted into
##    MongoDB.
##    Therefore, all the three dataframes have been subsetted to omit the _id column
##    in order to match original data provided in files.

## 2) Appropriate datatypes have been assigned to each of the columns.

## Data cleanup of state data

state.data$population <-  as.numeric(state.data$population)
state.data$area_sq_miles <-  as.numeric(state.data$area_sq_miles)
state.data$land_area_sq_miles <- as.numeric(state.data$land_area_sq_miles)
state.data$house_seats <- as.numeric(state.data$house_seats)

temp_statehood_date <- gsub("/","-",state.data$statehood_date)
temp_statehood_date <- mdy(temp_statehood_date)
state.data$statehood_date <-as.Date(temp_statehood_date)

## Data cleanup of district data

temp_est_date <- gsub("/","-",district.data$establishment_date)
temp_est_date <- mdy(temp_est_date)
district.data$establishment_date <- as.Date(temp_est_date)

district.data$population <- as.numeric(district.data$population)
district.data$area_sq_miles <- as.numeric(district.data$area_sq_miles)
district.data$land_area_sq_miles <- as.numeric(district.data$land_area_sq_miles)
district.data$house_seats <- as.numeric(district.data$house_seats)

## Data cleanup of territory data

territory.data$acquisition_year <- as.numeric(territory.data$acquisition_year)
territory.data$population <- as.numeric(territory.data$population)
territory.data$area_sq_miles <- as.numeric(territory.data$area_sq_miles)
territory.data$land_area_sq_miles <- as.numeric(territory.data$land_area_sq_miles)
territory.data$house_seats <- as.numeric(territory.data$house_seats)

# Removing the _id column that is assigned when inserting documents in MongoDB
subset.state.data <- subset(state.data,select = state:statehood_date)
subset.district.data <- subset(district.data,select = federal_district:house_seats)
subset.territory.data <- subset(territory.data,select = territory:house_seats)
##Week 4 Quiz - Shipra Ahuja

## Solution 1 - Show an appropriate visualization that displays the total
## number of movies for each decade.

movies$decade <- round_any(movies$year,10,floor)
ggplot(movies,aes(x=decade)) + geom_histogram() + ggtitle("Total no. of movies against decade")


## Solution 2 - Show the average IMDB user rating for different genres of movies? 
## Has this changed over time?

melted.m <- subset(melt(movies,id.vars=c("title","year","length","rating"),variable.name="Genre",value.name="Binary",measure.vars=c("Action","Animation","Comedy","Drama","Documentary","Romance","Short")),Binary>0)
ggplot(melted.m, aes(x= Genre, y= rating)) + stat_summary(fun.y=mean,geom="point") + ggtitle("Average user rating against types of genre")

## Yes, Mean Ratings have changed over time .
ggplot(melted.m, aes(x= year, y= rating)) + stat_summary(fun.y=mean,geom="point") + ggtitle("Trend of rating over time")


## Solution 3 - Is there a relationship between length of movie and movie rating?

##- Used length < 500 to remove outliers
## No relationship between length of movie and movie rating.

ggplot(subset(movies,length <500),aes(x=length,y=rating)) + geom_point(shape=1) + geom_smooth(method=lm,se=FALSE) + ggtitle("Depict relationship between length and rating of movies")


## Solution 4 - Is there a relationship between length of movie and genre?

ggplot(melted.m, aes(x= Genre, y= length)) + stat_summary(fun.y=mean,geom="point") + ggtitle("Relationship between length of movie and genre")

## Yes there is a relationship between length of movie and genre
## Animation and short are short
## Comedy and documentary are average
## Action, Drama and Romance are long

## Solution 5 - Which other variable best predicts total number of votes that a movie received.

ggplot(movies,aes(x=year,y=votes)) + geom_point() + ggtitle("Predict no. of votes against year")
ggplot(movies,aes(x=rating,y=votes)) + geom_point() + ggtitle("Predict no. of votes based on rating")

## Rating & Year are the variables which best predicts the no. of votes.

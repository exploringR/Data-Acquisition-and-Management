## Week 6 Assignment - Shipra Ahuja

library(rvest)

html <- html("http://www.bestrentnj.com/Communities/Woodbridge-Center-Plaza")

## Pull out the rental office phone number of the apartment complex

phone <- html_nodes(html,".CommunityPhoneTextBold")
phoneno <- html_text(phone)
print (phoneno)

## Pull out the rental office address of the apartment complex

officeaddress <- html_nodes(html,"#ctl00_ContentPlaceHolder1_panPhoneoffHours tr:nth-child(6) td")
addr <-html_text(officeaddress)
print (addr)

## Pull out the business hours of the rental office of the apartment complex

businesshrs <- html_nodes(html,"tr:nth-child(4) .CommunityOffHoursDetailsText")
hours <- html_text(businesshrs)
print (hours)

## Results after executing R Script - 

##[1] "Call: 877-739-2990"
##[1] "Rental Office Address:1605 Plaza DriveWoodbridge, NJ 07095"
##[1] "Office Hours: Daily 10-5Thursday 10-7"



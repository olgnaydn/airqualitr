listlocations <- function(city)

{

  #listlocations(city): Function is for listing air quality stations in the city defined by user.
  #This functions returns available time intervals, last update date, name of the attributes, geolocations(lat-lon)
  #for air quality stations related to city defined by user.
  
  #getting Postgres Driver
  drv <- dbDriver("PostgreSQL")

  #connectiong server
  con <- dbConnect(drv, dbname = "development",
                   host = "airqualitr.clgjf7569y1t.us-west-2.rds.amazonaws.com",
                   port=5432, user = "airqualitr_team", password = "msgsu2017")
  
  #defining query for getting stations according to user defined city
  query_station_info<- paste("select distinct place, lat, long from airquality_data where place like", 
                "'",city,"%","'",
                " group by place, lat, long",sep = "")
  
  #getting stations for user defined city
  stations <- dbGetQuery(con,query_station_info)
  
  #getting attributes available for user defined city 
  attributes <- dbGetQuery(con,"select * from airquality_data limit 1")
  available_attributes <- colnames(attributes)[4:27]

  list("station_info",stations,"available_attributes",available_attributes )
                         

}

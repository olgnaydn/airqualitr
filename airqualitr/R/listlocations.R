listlocations <- function(city)

{

  #listlocations(city): Function is for listing air quality stations in the city defined by user.
  #This functions returns, station names, name of the attributes, geolocations(lat-lon)
  #for air quality stations related to city defined by user.

  #getting Postgres Driver
  drv <- dbDriver("PostgreSQL")

  #connecting server
  con <- dbConnect(drv, dbname = "airqualitr",
                   host = "108.59.81.28",
                   port=5432, user = "olgun", password = "123456aq")

  #defining query for getting stations according to user defined city
  query_station_info<- paste("select distinct Mevki, lat, long from airqualitr where Mevki like",
                "'",city,"%","'",
                " group by Mevki, lat, long",sep = "")

  #getting stations for user defined city
  stations <- dbGetQuery(con,query_station_info)

  #getting attributes available for user defined city
  attributes <- dbGetQuery(con,"select * from airqualitr limit 1")
  available_attributes <- colnames(attributes)[4:27]

  list("station_info",stations,"available_attributes",available_attributes )


}

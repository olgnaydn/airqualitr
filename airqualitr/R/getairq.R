getairq <- function(city, variables)

{

#getairq(attributes,lat,lon, since, to): Function is for getting airquality data related to
#location  defined by user
#This function returns air quality data related to user defined variables.

  drv <- dbDriver("PostgreSQL")

  #connectiong server
  #connecting server
  con <- dbConnect(drv, dbname = "airqualitr",
                   host = "108.59.81.28",
                   port=5432, user = "olgun", password = "123456aq")

  #defining query for getting attributes defined by user, according to user defined city
  query_stations<- paste('select place, date, lat, long, ', variables,' from airqualitr',sep = "")

  #getting information for all stations of defined city
  values <- dbGetQuery(con,query_stations)
  values_for_defined_city <- values[grep(city, values$place),]
  list(values_for_defined_city)

}

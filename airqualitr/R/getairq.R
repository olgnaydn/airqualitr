getairq <- function(city, variables)

{

#getairq(attributes,lat,lon, since, to): Function is for getting airquality data related to
#location  defined by user
#This function returns air quality data related to user defined variables.

  drv <- dbDriver("PostgreSQL")

  #connectiong server
  con <- dbConnect(drv, dbname = "development",
                   host = "airqualitr.clgjf7569y1t.us-west-2.rds.amazonaws.com",
                   port=5432, user = "airqualitr_team", password = "msgsu2017")

  #defining query for getting attributes defined by user, according to user defined city
  query_stations<- paste('select place, date, lat, long, ', variables,' from airquality_data',sep = "")

  #getting information for all stations of defined city
  values <- dbGetQuery(con,query_stations)
  values_for_defined_city <- values[grep(city, values$place),]

}

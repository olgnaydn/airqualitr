showstations <- function(city,attribute)
{

  #showstations(city): This function builds a map
  #which shows all air quality stations in defined city by using Google Maps or OpenStreet Map

  #getting Postgres Driver
  drv <- dbDriver("PostgreSQL")

  #connectiong server
  con <- dbConnect(drv, dbname = "development",
                   host = "airqualitr.clgjf7569y1t.us-west-2.rds.amazonaws.com",
                   port=5432, user = "airqualitr_team", password = "msgsu2017")

  #defining query for getting avg of attributes defined by user, according to user defined city
  query_station_values<- paste('select place, lat, long, avg(','"',attribute,'"',
                            ') as avg_values from airquality_data where', '"',attribute,'"','is not null',
                            ' group by place, lat, long',sep = "")

  #getting mean values for all stations of defined city
  values <- dbGetQuery(con,query_station_values)
  values_for_defined_city <- values[grep(city, values$place),]

  #building map for defined city
  map <- qmap(city, zoom =10)

  #plotting map
  map + geom_point(data = values_for_defined_city, aes(x = long, y = lat, fill=avg_values), color="blue",size=10, alpha=0.7)

  #returning calcuated values
  list("values_for_defined_city",values_for_defined_city)

  }


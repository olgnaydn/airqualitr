listlocations <- function()

{

  #listlocations(city): Function is for listing air quality stations in the city defined by user.
  #This functions returns available time intervals, last update date, name of the attributes, geolocations(lat-lon)
  #for air quality stations related to city defined by user.
  #getting Postgres Driver
  drv <- dbDriver("PostgreSQL")
  con <- dbConnect(drv, dbname = "development", host = "development.clgjf7569y1t.us-west-2.rds.amazonaws.com", port = 5432,
                   user = "olgun", password = 'xxx')

}

# airqualitR: An R package on Air Quality Information for Turkey

The issue of monitoring air quality and making predictions related to the air quality indicators has been an
active area of research for many years. The recent developments in IoT technologies facilitated the data
collection and the real-time monitoring of many diverse range of sensors. Today as a result of these
developments, indicators of air pollution and air quality can be monitored in real-time by the air monitoring
stations. These stations are set-up by national and local agencies, and they monitor the existence of several
pollutant gasses and particles in the air. The measurements conducted, are both provided online in
real/near-real time and also archived in databases. The archival of these air quality measurements are
stored and disseminated by national and local agencies for helping researchers to conduct research and
provide predictions/tendencies on the air quality. Many countries are making significant investments to
provide these indicators as open data sources. Today it is possible to acquire near-real time and historical
data for many countries and cities from the local resources and portals such as OpenAQ(Open Air Quality).
Although the data portals such as OpenAQ provide vast amount of air quality information globally, the
timeframe and the width of country specific information(i.e. The number of measurement stations provided)
in some cases is very limited. For instance, many Turkish Air Quality monitoring stations are not available
on the OpenAQ portal, furthermore for most Turkish Air Quality monitoring stations, only information back
to November 2016 can be obtained from the OpenAQ portal.
This study was focused on developing an R package for providing 10 years of historical AQ data for all
cities of Turkey. The package namely airqualitR provides data gathered from 211 AQ monitoring stations
located in all cities of Turkey. The measurements provided by the packages were acquired from the national
Air Quality Open Data Repository http://www.havaizleme.gov.tr which is developed in Turkish language.
The aim of this development was to enable researchers to access historical Turkish Air Quality information
effortlessly by using R, and to provide visualisation of this information on online maps with the help of the
leaflet library and providing support for making predictions of AQ indicator values at a geo location using
spatial statistics, where there is no AQ monitoring information.

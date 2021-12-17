library(ggplot2)
data<- read.csv("hsinchu_109_A1.csv", header = TRUE)
ggplot() +
  geom_point(data = data, aes(x = longitude, y = latitude), alpha = .05)

ggplot() +
  stat_density2d(data = data, aes(x = longitude, y = latitude, fill = ..density..), geom = 'tile', contour = F) 

install.packages("rstudioapi")
install.packages("ggmap")
library(rstudioapi)
library(ggmap)
register_google(key = "AIzaSyDVFnl7zWEaJhnSr8ZIIO3GYIOuQTxVBrI")

map_sf <- ggmap(get_googlemap(center = c(lon=120.9315783, lat=24.7835529),
                                zoom = 16, 
                                maptype = "terrain",
                                color = "color"))+
stat_density2d(aes(x = longitude, y = latitude, fill = ..level..),
               alpha=.1, 
               bins =1, data=data, geom = "polygon")
map_sf


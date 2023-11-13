catch_municipality <- function(pts){
  
  #initialization
  library(dplyr)
  library(parallel)
  library(sf)
  library(utils)
  
  #pts processing
  pts$file_ID<-rep(1:ceiling(nrow(pts)/250000), each=250000, length.out=nrow(pts))
  pts <- pts %>% 
    .[!duplicated(.[ , c("dwcID","decimalLatitude", "decimalLongitude")]), ] %>%
    group_split(file_ID)
  
  #catchlocation function
  catchlocation <- function(x){
    x %>%
      st_as_sf(coords = c("decimalLongitude", "decimalLatitude"), remove=FALSE) %>% # set coordinates
      st_set_crs(4326) %>%  # table transform to polygon
      st_join(., town, join = st_intersects, left = TRUE, largest=TRUE) %>% 
      st_drop_geometry(.)
  }
  
  #download shp file
  download.file(
    "https://github.com/MongMong11/catch_location/blob/main/Taiwanlandsea_TownCounty/Taiwanlandsea_TownCounty.zip?raw=TRUE",
    "boundary.zip",
    mode = "wb"
  )
  unzip(paste0(getwd(),"/boundary.zip"),exdir=getwd())
  
  #parallel
  cpu.cores <- detectCores()
  cl <- makeCluster(cpu.cores-1)
  clusterEvalQ(cl, { # make sure all clusters are ready
    library(tidyverse)
    library(data.table)
    library(sf)
    town <- st_read("Taiwanlandsea_TownCounty.shp")
    town<- as(town, "sf")%>%
      st_set_crs(4326)
    sf_use_s2(FALSE)
  }
  )
  
  system.time(
    municipality_table<- parLapply(cl, pts, catchlocation)%>% 
      do.call(rbind,.)
  )
  stopCluster(cl)
  names(municipality_table)[names(municipality_table) == 'COUNTYNAME'] <- "county"
  names(municipality_table)[names(municipality_table) == 'TOWNNAME'] <- "municipality"
}


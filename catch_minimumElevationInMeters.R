catch_minimumElevationInMeters <- function(pts, ele_raster){
  #initialization
  library(data.table)
  library(raster)
  
  # add minimumElevationInMeters
  pts$decimalLongitude <- as.numeric(pts$decimalLongitude)
  pts$decimalLatitude <- as.numeric(pts$decimalLatitude)
  pts$minimumElevationInMeters<- extract(ele_raster, pts[,c("decimalLongitude", "decimalLatitude")])
  pts<-as.data.table(pts)
}

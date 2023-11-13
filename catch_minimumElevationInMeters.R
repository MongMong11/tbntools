catch_minimumElevationInMeters <- function(pts){
  #initialization
  library(data.table)
  library(raster)
  library(utils)
  
  #downlaod raster file
  download.file("https://github.com/MongMong11/tbntools/blob/main/twdtm_asterV3_30m/twdtm_asterV3_30m.zip?raw=TRUE",
                "twdtm_asterV3_30m.zip",
                mode = "wb")
  unzip(paste0(getwd(),"/twdtm_asterV3_30m.zip"),exdir=getwd())
  ele_raster <- raster("twdtm_asterV3_30m.tif")
  
  # add minimumElevationInMeters
  pts$decimalLongitude <- as.numeric(pts$decimalLongitude)
  pts$decimalLatitude <- as.numeric(pts$decimalLatitude)
  pts$minimumElevationInMeters<- extract(ele_raster, pts[,c("decimalLongitude", "decimalLatitude")])
  pts<-as.data.table(pts)
}


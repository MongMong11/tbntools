# tbntools

### 介紹
此空間儲存在處理和分析tbn資料時，極為頻繁使用到的一系列Functions，以解決我懶惰不想寫太多code的需求。

### 使用資料
#### [Taiwanlandsea_TownCounty](https://github.com/MongMong11/tbntools/tree/main/Taiwanlandsea_TownCounty)
使用政府資料開放平台「臺灣縣市和鄉鎮區界線圖層」（原始資料來源：[直轄市、縣市界線](https://data.gov.tw/dataset/32158)、[鄉鎮市區界線](https://data.gov.tw/dataset/32157)），與海洋保育署「海洋行政區範圍圖層」（原始資料來源:[海洋保育地理資訊圖台](https://iocean.oca.gov.tw/iOceanMap/map.aspx)）進行套疊所得shp圖層。
#### [twdtm_asterV3_30m](https://github.com/MongMong11/tbntools/tree/main/twdtm_asterV3_30m)
使用美國國家航空暨太空總署(National Aeronautics and Space Administration, NASA)「30米數值地形模型資料(DEM)第三版」擷取臺灣地區之tif圖層（原始資料來源：[ASTER GDEM V3](https://asterweb.jpl.nasa.gov/gdem.asp?fbclid=IwAR1TdjOyhS-fNUav-CQHQdMz4Ad7GkqGY5ZY2Lq_CqpFNZ5c6ogS0DxI-aY)）

### 需先安裝 package
##### catch_manucipality.R
```R
install.packages("dplyr")
install.packages("parallel")
install.packages("sf")
install.packages("utils")
```

#### catch_minimumElevationInMeters.R 
```R
install.packages("data.table")
install.packages("raster")
install.packages("utils")
```

### 使用方法

#### [catch_manucipality.R](https://github.com/MongMong11/tbntools/blob/main/catch_municipality.R)
載入含 "dwcID","decimalLatitude", "decimalLongitude" 欄位的dataset.csv (pts)，並載入相關package，自動從github下載"台灣縣市鄉鎮區界線圖層"於相對路徑，平行運算抓取點位行政區資訊。
```R
#載入dataset.csv
file.name <- list.files(getwd(), full.names = TRUE)
pts <- 
  lapply(1:length(file.name), function(i)
    fread(file.path(getwd(), 
                    sprintf("TBN_table__%s.csv", i)), encoding = "UTF-8"
    )
  )
pts <- do.call(rbind,pts)

#function
catch_manucipality(pts)
```

#### [catch_minimumElevationInMeters.R](https://github.com/MongMong11/tbntools/blob/main/catch_minimumElevationInMeters.R)
輸入含 "dwcID","decimalLatitude", "decimalLongitude" 欄位的dataset.csv (pts)，並載入相關package，自動從github下載"twdtm_asterV3_30m"於相對路徑，抓取點位最低海拔資訊。
```R
#載入dataset.csv
file.name <- list.files(getwd(), full.names = TRUE)
pts <- 
  lapply(1:length(file.name), function(i)
    fread(file.path(getwd(), 
                    sprintf("TBN_table__%s.csv", i)), encoding = "UTF-8"
    )
  )
pts <- do.call(rbind,pts)

#function
catch_minimumElevationInMeters(pts)
```

# tbntools

### 說明
##### catch_manucipality.R
輸入含 "dwcID","decimalLatitude", "decimalLongitude" 的dataset.csv，並載入相關package，自動從github下載"台灣縣市鄉鎮區界線圖層"，平行運算抓取點位行政區資訊。

#### catch_minimumElevationInMeters.R 
輸入含 "dwcID","decimalLatitude", "decimalLongitude" 的dataset.csv，並載入相關package，自動從github下載"twdtm_asterV3_30m"，抓取點位最低海拔資訊。

### 需安裝 package
##### catch_manucipality.R
```
install.packages("dplyr")
install.packages("parallel")
install.packages("sf")
install.packages("utils")
```

#### catch_minimumElevationInMeters.R 
```
install.packages("data.table")
install.packages("raster")
install.packages("utils")
```

### Usage
```
catch_manucipality(pts)
```
```
catch_minimumElevationInMeters(pts)
```

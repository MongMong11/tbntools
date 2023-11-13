# tbntools

### 介紹
此空間儲存一系列處理和分析資料點位時，極為頻繁使用到的一系列 Functions，以解決我懶惰不想寫太多code的需求。

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

### 使用方法

##### [catch_manucipality.R](https://github.com/MongMong11/tbntools/blob/main/catch_municipality.R)
載入含 "dwcID","decimalLatitude", "decimalLongitude" 的dataset.csv(pts)，並載入相關package，自動從github下載"台灣縣市鄉鎮區界線圖層"，平行運算抓取點位行政區資訊。
```
catch_manucipality(pts)
```

#### [catch_minimumElevationInMeters.R](https://github.com/MongMong11/tbntools/blob/main/catch_minimumElevationInMeters.R)
輸入含 "dwcID","decimalLatitude", "decimalLongitude" 的dataset.csv(pts)，並載入相關package，自動從github下載"twdtm_asterV3_30m"，抓取點位最低海拔資訊。
```
catch_minimumElevationInMeters(pts)
```

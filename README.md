## CBMS Library
###### An Implementation of CBMS Report Generation

Installation:
```
install.packages("devtools")
library(devtools)
install_github('rickrick100/cbms')
```

Import library so you can use following functions.
```
library(cbms)
```
readCBMS(): This function reads all file in a directory from .can files
```
readCBMS('fread') #for larger .can file > 100 MB
readCBMS('read.csv') for smaller .can file
```
popSum(): This function allows you to generate a summary of Population and Household in cbms
```
popSum('main.csv')
```
cbmsUtils(): This function allows you to generate/segregate: duplicate files, unfiltered files and distinct files.
```
cbmsUtils('main.csv')
```
fusTab(): This function allows you to create a geopoint and lite version of main.csv suitable for fast mapping in qgis or google earth
```
fusTab('main.csv')
```

- Frederick Cuario

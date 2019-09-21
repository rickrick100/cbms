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

popSum(): This function allows you to generate a summary of Population and Household in cbms
```
popSum('main.csv')
```
cbmsUtils(): This function allows you to generate/segregate: duplicate files, unfiltered files and distinct files.
```
cbmsUtils('main.csv')
```
fusTab(): This function you to create a geopoint and lite version of main.csv
```
fusTab('main.csv')
```

- Frederick Cuario

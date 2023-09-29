# Batch-transform
Batch transform dwgs from Danish System 34 to UTM

Simple scripts that takes in take input and output directories and iterate through all the files.  

First use dwg2dxf.ps1 to transform the dwg to dxf format which is needed for GDAL.  
  - make sure that the QCAD dwg2dwg path is correct for your installation
  - set your own input and output directory

Secondly, use sys34UTM.ps1 to transform the projection.  
  - make sure that GDAL path is correct for your installation
  - set the PROJ_LIB environment variable to match your path
  - set your own input and output directory

Third step is to convert the map from UTM32N (EPSG:25832) to EPSG:3857. Use mapconvert.ps1
  - set your own input and output directory
  - make sure the crs codes are correctly written

Finally, create maptiles with maptiles.ps1.
  - set your own input and output directory
  - settings od dwg2maptiles can be modified normally

Transformations are based on [this repository](https://github.com/NordicGeodesy/NordicTransformations/tree/master)
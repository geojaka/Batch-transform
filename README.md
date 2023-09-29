# Batch-transform
Batch transform dwgs from Danish System 34 to UTM

Simple scripts that takes in take input and output directories and iterate through all the files.  

First use dwg2dxf.ps1 to transform the dwg to dxf format which is needed for GDAL.  
  - make sure that the QCAD dwg2dwg path is correct for your installation

Secondly, use sys34UTM.ps1 to transform the projection.  
  - make sure that GDAL path is correct for your installation
  - set the PROJ_LIB environment variable to match your path  

This scripts are based on transformations from [this repository](https://github.com/NordicGeodesy/NordicTransformations/tree/master)
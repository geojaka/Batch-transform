# Set GDAL_DATA environment variable
$env:GDAL_DATA = "C:\Program Files\QGIS 3.22.11\apps\gdal\share\gdal"

# Specify input and output directories
$inputDir = "C:\Users\JakaCosic\Documents\data\koge\interim\Vejbelysning-redo\Vejbelysning-dxf_old"
$outputDir = "C:\Users\JakaCosic\Documents\data\koge\interim\Vejbelysning-redo\Vejbelysning-dxf_UTM"

# Get a list of all DXF files in the input directory
$dxfFiles = Get-ChildItem -Path $inputDir -Filter *.dxf

# Transformation parameters
$transformation = "+proj=pipeline +step +proj=affine +s11=-1 +step +init=DK:S34S +inv +step +init=DK:UTM32N"

# Iterate through each DXF file
foreach ($file in $dxfFiles) {
    # Construct the output file path
    $outputFile = Join-Path $outputDir $file.Name

    # Execute ogr2ogr with the transformation
    & "ogr2ogr" -ct $transformation -f DXF $outputFile $file.FullName
}

Write-Host "Transformation completed. Output files are located in: $outputDir"
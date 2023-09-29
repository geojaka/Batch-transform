# Specify input and output directories
$inputDir = "C:\path\to\input"
$outputDir = "C:\path\to\output"

# Get a list of all DXF files in the input directory
$dxfFiles = Get-ChildItem -Path $inputDir -Filter *.dxf

# Iterate through each DXF file
foreach ($file in $dxfFiles) {
    # Construct the output file path
    $outputFile = Join-Path $outputDir $file.Name

    # Execute dwgmapconvert
    & "C:\Program Files\QCAD\dwgmapconvert.bat" -segment-length=0.5 -retain-texts -crs-in EPSG:25832 -crs-out EPSG:3857 -f -o $outputFile $file.FullName
}

Write-Host "Batch processing completed. Output files are located in: $outputDir"
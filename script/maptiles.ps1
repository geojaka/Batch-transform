# Specify input and output directories
$inputDir = "C:\path\to\input"
$outputDir = "C:\path\to\output"

# Get a list of all DXF files in the input directory
$dxfFiles = Get-ChildItem -Path $inputDir -Filter *.dxf

# Iterate through each DXF file
foreach ($file in $dxfFiles) {
    # Construct the output file path
    $outputDirectory = Join-Path $outputDir $file.BaseName

    # Execute dwgmapconvert
    & "C:\Program Files\QCAD\dwg2maptiles.bat" -a -flat -tms -web-mercator -t png -unit m -z 10-21 -skip-empty -b transparent -c -o $outputDirectory $file.FullName
}

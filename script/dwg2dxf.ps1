# Specify input and output directories
$inputDir = "input_directory_path"
$outputDir = "output_directory_path"

# Get a list of all DWG files in the input directory
$dwgFiles = Get-ChildItem -Path $inputDir -Filter *.dwg

# Iterate through each DWG file
foreach ($file in $dwgFiles) {
    # Construct the output file path with a .dxf extension
    $outputFile = Join-Path $outputDir ($file.BaseName + ".dxf")

    # Execute the dwg2dwg
    & "C:\Program Files\QCAD\dwg2dwg.bat" -o $outputFile $file.FullName
}

Write-Host "Input Directory: $inputDir"
Write-Host "Output Directory: $outputDir"
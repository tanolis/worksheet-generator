# Fix Homepage Links
$content = Get-Content "layouts/index.html" -Raw

# Map old data-types to new folder names
$linkMap = @{
    'numbers1-10' = 'numbers-1-10'
    'numbers10-100' = 'numbers-10-100'
    'skip2' = 'counting-skip-2'
    'skip5' = 'counting-skip-5'
    'skip10' = 'counting-skip-10'
    'backward' = 'counting-backward'
    # Add more as needed
}

# Update each link
foreach ($key in $linkMap.Keys) {
    $newLink = $linkMap[$key]
    $content = $content -replace "data-type=`"$key`"", ""
    $content = $content -replace "href=`"#`"", "href=`"/$newLink/`""
    $content = $content -replace "window\.location\.href='#?'", "window.location.href='/$newLink/'"
}

$content | Out-File "layouts/index.html" -Encoding UTF8
Write-Host "✅ Homepage links updated!" -ForegroundColor Green

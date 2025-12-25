# Update Homepage Links Script
$indexFile = "layouts/index.html"
$content = Get-Content $indexFile -Raw

# Update all links - just remove data-type and add proper href
$content = $content -replace 'href="#" class="subcategory-link" data-type="([^"]+)"', 'href="/$1/" class="subcategory-link"'
$content = $content -replace '<button class="generate-btn-small" data-type="([^"]+)">', '<button class="generate-btn-small" onclick="window.location.href=''/$1/''">'

# Special cases (with hyphens)
$patterns = @{
    'numbers1-10' = 'numbers-1-10'
    'numbers10-100' = 'counting-numbers-10-100'
    'skip2' = 'counting-skip-2'
    'skip5' = 'counting-skip-5'
    'skip10' = 'counting-skip-10'
    'backward' = 'counting-backward'
}

foreach ($key in $patterns.Keys) {
    $value = $patterns[$key]
    $content = $content -replace "/$key/", "/$value/"
    $content = $content -replace "'/$key/'", "'/$value/'"
}

# Save updated file
$content | Out-File $indexFile -Encoding UTF8
Write-Host "✅ Homepage links updated!" -ForegroundColor Green

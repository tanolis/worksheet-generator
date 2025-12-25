# Generate content for all pages
$pages = @(
    # Counting
    @("counting-numbers-10-100", "Numbers 10-100 Worksheet"),
    @("counting-skip-2", "Skip Counting by 2s Worksheet"),
    @("counting-skip-5", "Skip Counting by 5s Worksheet"),
    @("counting-skip-10", "Skip Counting by 10s Worksheet"),
    @("counting-backward", "Backward Counting Worksheet"),
    
    # Addition
    @("addition-single-digit", "Single Digit Addition Worksheet"),
    @("addition-two-digit", "Two Digit Addition Worksheet"),
    @("addition-three-digit", "Three Digit Addition Worksheet"),
    @("addition-regrouping", "Addition with Regrouping Worksheet"),
    @("addition-word-problems", "Addition Word Problems Worksheet"),
    @("addition-missing-addends", "Missing Addends Worksheet"),
    
    # Subtraction
    @("subtraction-single-digit", "Single Digit Subtraction Worksheet"),
    @("subtraction-two-digit", "Two Digit Subtraction Worksheet"),
    @("subtraction-three-digit", "Three Digit Subtraction Worksheet"),
    @("subtraction-borrowing", "Subtraction with Borrowing Worksheet"),
    @("subtraction-word-problems", "Subtraction Word Problems Worksheet"),
    @("subtraction-missing-numbers", "Missing Numbers Subtraction Worksheet")
)

foreach ($page in $pages) {
    $folder = $page[0]
    $title = $page[1]
    
    # Create folder if not exists
    mkdir -Force "content/$folder" | Out-Null
    
    # Create index.md with title
    @"
---
title: "$title"
type: "page"
---
"@ | Out-File "content/$folder/index.md" -Encoding UTF8
    
    Write-Host "✅ Created: $title" -ForegroundColor Green
}

Write-Host "`n🎉 Created content for all pages!" -ForegroundColor Cyan
Write-Host "Total pages created: $($pages.Count)" -ForegroundColor Yellow

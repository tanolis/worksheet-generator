---
title: "Single Digit Addition Worksheet"
type: "addition-single-digit"
layout: "single"
---

# Single Digit Addition Worksheet Generator

<div id="worksheet-container">
    <div id="worksheet"></div>
    <button onclick="generateWorksheet()">Generate New Worksheet</button>
    <button onclick="printWorksheet()">Print Worksheet</button>
</div>

<script>
function generateWorksheet() {
    const container = document.getElementById('worksheet');
    let html = '<h2>Single Digit Addition Practice</h2>';
    html += '<table>';
    
    // Generate 20 addition problems
    for(let i = 0; i < 20; i++) {
        const num1 = Math.floor(Math.random() * 10);
        const num2 = Math.floor(Math.random() * 10);
        const sum = num1 + num2;
        
        if(i % 4 === 0) html += '<tr>';
        html += `<td style="padding: 20px; font-size: 24px;">
                    ${num1} + ${num2} = ______
                 </td>`;
        if(i % 4 === 3) html += '</tr>';
    }
    html += '</table>';
    
    container.innerHTML = html;
}

function printWorksheet() {
    window.print();
}

// Generate worksheet on page load
window.onload = generateWorksheet;
</script>

<style>
#worksheet-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

#worksheet {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

td {
    border: 1px solid #ddd;
    text-align: center;
    vertical-align: middle;
}

button {
    padding: 12px 24px;
    font-size: 16px;
    margin: 10px;
    background: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background: #45a049;
}
</style>

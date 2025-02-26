#link count

<#$scrapedpage = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.11/ToBeScraped.html

$scrapedpage.links.Count#>

#Get links as HTML Element

<#$scrapedpage = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.11/ToBeScraped.html

$scrapedpage.links #>

#Get link display only url and text

<# $scrapedpage = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.11/ToBeScraped.html

$scrapedpage.links | Select-Object href , outerText #>

#Outer text of every element with the h2 tag
<# clear
$scrapedpage = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.11/ToBeScraped.html

$h2 = $scrapedpage.ParsedHtml.body.getElementsByTagName("h2") | select outerText
$h2 #>

#Print innerText of every div element that has the class div-1

clear
$scrapedpage = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.11/ToBeScraped.html

$div1 = $scrapedpage.ParsedHtml.body.getElementsByTagName("div") | `
where { ` $_.getAttributeNode("class").value -ilike "div-1"} | select innerText
$div1
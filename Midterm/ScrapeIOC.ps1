    $page = Invoke-WebRequest -TimeoutSec 5 http://10.0.17.6/IOC.html
    
    # Get th elements within the doc
    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    # Empty Array
    $FullTable = @()

    for ($i = 1; $i -lt $trs.length; $i++) {
        # Get every table column
        $tds = $trs[$i].getElementsByTagName("td")


        # Add the row to the FullTable array
        $FullTable += [pscustomobject]@{
            "Description"  = $tds[0].innertext
            "Explanation"       = $tds[1].innertext
          
        }
    }

    return $FullTable


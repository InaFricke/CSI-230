function gatherClasses() {

    $page = Invoke-WebRequest -TimeoutSec 5 http://10.0.17.11/Courses.html

    # Get tr elements within the doc
    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    # Empty Array
    $FullTable = @()

    for ($i = 1; $i -lt $trs.length; $i++) {
        # Get every table column
        $tds = $trs[$i].getElementsByTagName("td")

        # Ensure that the time field exists and then split it
        $Times = if ($tds[5].innerText) { $tds[5].innerText.Split("-") }

        # Add the row to the FullTable array
        $FullTable += [pscustomobject]@{
            "Class Code"  = $tds[0].innertext
            "Title"       = $tds[1].innertext
            "Days"        = $tds[4].innertext
            "Start Time"  = $Times[0]
            "End Time"    = $Times[1]
            "Instructor"  = $tds[6].innertext
            "Location"    = $tds[9].innertext
        }
    }

    return $FullTable
}




 

#!/bin/bash

input="report.txt"
output="report.html"
dest="/var/www/html/report.html"

cat > "$output" << EOL
<html>
<head>
	<title> Access Logs with IOC Indicators Report </title>
	<style>
		table {
		boreder-collapse: colapse;
		width: 100%;
		}
		th, td {
		border: 1px solid black;
		}
	</style>
</head>
<body>
<h1> Access Logs with Indicatiors </h1>
<table>
<tr>
<th>IP Address</th>
<th> Date and Time </th>
<th> Request</th>
</tr>
EOL

while  IFS= read -r line; do
IP=$(echo "$line" | awk '{print $1}')
DateTime=$(echo "$line" | awk '{print $2}')
Req=$(echo "$line" | awk '{$1=""; $2=""; print $0}' | sed 's/^ //')

echo "<tr><td>$IP</td><td>$DateTime</td><td>$Req</td></tr>" >> "$output"

done < "$input"

cat >> "$output" << EOL
</table>
</body>
</html>
EOL
sudo mv "$output" "$dest"
echo "Report sucsessfully moved and created in $dest"
echo "View at http://10.0.17.18/report.html"


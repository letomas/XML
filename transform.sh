#!/bin/bash
mkdir -p html

java -jar saxon/saxon9he.jar countries.xml xslt/transformIndex.xsl -o:"html/index.html"

for country in data/*.xml; do
	country_name=${country%.xml} # remove suffix
	country_name=${country_name#*/} # remove prefix
	java -jar saxon/saxon9he.jar $country xslt/transformCountries.xsl -o:"html/${country_name}.html"
done

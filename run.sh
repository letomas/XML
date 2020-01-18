#!/bin/bash

arg=$1

case $arg in
	join)
		xmllint --noent countries-template.xml > "countries.xml" #Join countries into one XML file
		;;
	html)
		./scripts/transform.sh #Transform XML to HTML
		;;
	validate)
		./scripts/validate.sh #Validate XML
		;;
	pdf)
		./scripts/generatePdf.sh #Transform XML to PDF
		;;
	*)
		#Do everything
		xmllint --noent countries-template.xml > "countries.xml"
		./scripts/transform.sh
		./scripts/validate.sh
		./scripts/generatePdf.sh
		;;
esac
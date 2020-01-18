java -jar saxon/saxon9he.jar countries.xml xslt/transformPdf.xsl -o:"pdf.fo"
fop -fo pdf.fo -pdf countries.pdf 2>/dev/null

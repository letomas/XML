# BI-XML Semestral Work

## Instructions
See `BI-XML-PROJEKT-INSTRUKCE.txt` for details.

## Chosen countries
- Armenia
- Canada
- Iceland
- Madagaskar

## Prerequisites
- saxon
- java
- xmllint
- fop
- jing

## Project structure
`data`: Contains generated XML for each country.

`data/img`: Contains flag, map and locator map image for every country.

`html` Generated HTML and CSS styles.

`validation` Contains files for DTD and RNC validation.

`xslt` Contains files to tranformate XML of countries into HTML and PDF.

`scripts` Scripts to execute transformation and validation tasks. *Don't* use these manually, use *run&#46;sh* in root folder instead.

`countries-template.xml` File for joining countries into single XML.

`countries.xml` Result of countries XML join.

`countries.pdf` Generated PDF file for countries.

`run.sh` Script to run the project, more [here](#run-the-project)

## Run the project
Make sure you have all the necessary tools (check [prerequisites](#prerequisites)).
Use the `run.sh` script in root folder. Running the script without arguments will execute all tasks (joining XML files, transformations and validation). To execute desired task add argument to the script.

### Allowed arguments
`join` Join XML files of countries into `countries.xml`

`html` Generate html sites for countries and index into `html` folder.

`pdf` Generate PDF file `countries.pdf` into the root folder.

`validate` Execute DTD and RelaxNG validation.




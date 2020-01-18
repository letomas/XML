#!/bin/bash

echo "DTD validation..."
xmllint --noout --dtdvalid validation/validation.dtd countries.xml
result=$?
if [ $result -eq 1 ]; then
  echo failed
fi

echo "RelaxNG validation..."
jing -c validation/validation.rnc countries.xml
result=$?
if [ $result -eq 1 ]; then
  echo failed
fi

jing validation/validation.rng countries.xml
result=$?
if [ $result -eq 1 ]; then
  echo failed
fi

echo "Done"
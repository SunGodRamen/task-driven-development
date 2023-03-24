#!/bin/zsh

# Read the draw.io XML file
xml_file=$1

# Extract the base64-encoded diagram content
encoded_diagram_content=$(grep -oP '(?<=&quot;xml&quot;:&quot;).*?(?=&quot;})' $xml_file)

# Decode the base64 content and format it with xmllint
decoded_diagram_content=$(echo $encoded_diagram_content | base64 --decode | xmllint --format -)

# Parse the formatted XML to get the names of all elements
element_names=$(echo $decoded_diagram_content | xmllint --xpath "//*[local-name()='mxCell' and @value!='']/@value" - 2>/dev/null | sed 's/ value="/\n/g' | sed 's/"//g' | tail -n +2)

# Print the element names
echo "Element Names:"
echo "$element_names"

#!/bin/bash

# Get the list of new files with code filetypes
new_files=$(git diff --cached --name-status --diff-filter=A | grep -E '\.(py|js|java|c|cpp|cs|rb|php|html|css|scss|less|xml|yaml|yml|json|sh|bash|ps1|psm1|pl|pm|tcl|go|swift|h|m|mm|scala|groovy|kt|kts|rs|rust|lua|coffee|dart|rs)$')

# If no new files are added, allow the push
if [ -z "$new_files" ]; then
  exit 0
fi

# Extract diagram elements from the drawio.html file
diagram_elements=$(grep -oP '(?<=&quot;xml&quot;:&quot;).*?(?=&quot;}' .drawio/drawio.html | sed 's/&quot;/"/g' | sed 's/&lt;/</g' | sed 's/&gt;/>/g' | awk -F'[<>]' '{for (i=1; i<=NF; i++) if ($i ~ /^mxCell/ && $(i+1) ~ /^$/) print $(i-1)}')

# Check if the new filenames are in the diagram elements
for new_file in $new_files; do
  if [[ ! $diagram_elements == *"$new_file"* ]]; then
    echo "Error: The diagram must be updated with the new file: $new_file"
    exit 1
  fi
done

# If everything is fine, allow the push
exit 0

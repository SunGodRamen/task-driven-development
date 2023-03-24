#!/usr/bin/env zsh

# Configuration
git_repo_path=$1
drawio_diagram_path=$2

get_element_names () {
   # Read the draw.io XML file
  xml_file=$1

  # Extract the base64-encoded diagram content
  encoded_diagram_content=$(grep -oP '(?<=&quot;xml&quot;:&quot;).*?(?=&quot;})' $xml_file)

  # Decode the base64 content and format it with xmllint
  decoded_diagram_content=$(echo $encoded_diagram_content | base64 --decode | xmllint --format -)

  # Parse the formatted XML to get the names of all elements
  element_names=$(echo $decoded_diagram_content | xmllint --xpath "//*[local-name()='mxCell' and @value!='']/@value" - 2>/dev/null | sed 's/ value="/\n/g' | sed 's/"//g' | tail -n +2)

  # Print the element names
  echo "$element_names"
}

# Get the list of added files
added_files=$(git diff --name-status --diff-filter=A @{upstream} HEAD | cut -f2)

# Check if any new files have been added
if [[ -z "$added_files" ]]; then
  echo "No new files added. Exiting."
  exit 0
fi

# Get the current element names in the draw.io diagram
current_elements=$(get_element_names $2)

# Iterate through the added files
updated_diagram=false
for file in ${(f)added_files}; do
  # Get the class name from the file name
  class_name="${file:t:r}"

  # Check if the class name is in the draw.io diagram
  if [[ $current_elements == *"$class_name"* ]]; then
    echo "Found $class_name in the draw.io diagram."
  else
    echo "Class $class_name not found in the draw.io diagram."
    updated_diagram=true
  fi
done

# If the diagram needs an update, exit with a non-zero status
if $updated_diagram; then
  echo "Please update the draw.io diagram to include the new classes."
  exit 1
else
  echo "The draw.io diagram is up to date."
fi

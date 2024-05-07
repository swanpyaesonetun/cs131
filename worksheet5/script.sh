#!/bin/bash

# Define an array with the categories
categories=("Music" "Entertainment" "Gaming" "Comedy")

# Loop through each category
for category in "${categories[@]}"
do
  # Create the output file path
  output_file="United States/${category}.txt"
  
  # Write (redirect) the entries to the output file
  grep "United States" "Global YouTube Statistics.csv" | grep "$category" > "$output_file"
done

# Create or empty ws5.txt
> ws5.txt

# Loop through each category again
for category in "${categories[@]}"
do
  # Create the file path
  file="United States/${category}.txt"
  
  # Count the number of entries and append it to ws5.txt
  echo "$category: $(wc -l < "$file")" >> ws5.txt
done

#Display the script
cat script.sh

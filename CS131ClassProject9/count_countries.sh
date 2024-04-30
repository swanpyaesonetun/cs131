#!/bin/bash
# Path to your CSV file
csv_path="netflix_titles.csv"
# Path to the country list
country_list="all_countries.txt"

# Prepare output file
output_file="country_counts.txt"
echo "Country counts:" > "$output_file"

# Check each country
while IFS= read -r country; do
  # Prepare the grep pattern to include possible quotes and handle comma separation
  pattern="$country"
  # Use grep to count occurrences, considering the country could be part of a list in a single field
  count=$(grep -o "$pattern" "$csv_path" | wc -l)
  echo "$country: $count" >> "$output_file"
done < "$country_list"

echo "Results saved to $output_file"

#!/bin/bash
csv_path="netflix_titles.csv"
rating_list="all_ratings.txt"
output_file="rating_distribution.txt"

# Clear the output file to start fresh
> "$output_file"

echo "Starting the rating count..."

while IFS= read -r rating; do
  # Prepare the grep pattern to match any occurrence of the rating
  pattern=",$rating,"
  # Use grep to count occurrences, considering the rating could appear anywhere in a line
  count=$(grep -c "$pattern" "$csv_path")
  echo "$rating: $count" >> "$output_file"
  echo "Processed $rating: $count occurrences"  # Debugging line to monitor progress
done < "$rating_list"

echo "Rating counting completed."

# Load packages 
library('tidyverse')
library('stringr')
library('dplyr')
library('ggplot2')
library('scales')

# Load the data set
SPL_checkouts <- read.csv('/Users/cathy/OneDrive/Documents/Info201/2017-2023-10-Checkouts-SPL-Data.csv/2017-2023-10-Checkouts-SPL-Data.csv', stringsAsFactors = FALSE)

# Calculate the average number of checkouts for each item
avg_checkouts_each_item <- SPL_checkouts %>%
  group_by(Checkouts) %>%
  summarize(avg_checkouts = mean(Checkouts)) %>%
  pull(avg_checkouts)

# Calculate the month with the most checkouts for Catching Fire by Suzanne Collins
most_checkouts_catching_fire <- SPL_checkouts %>%
  group_by(CheckoutMonth) %>%
  summarize(Checkouts = max(Checkouts)) %>%
  pull(Checkouts)

# Calculate the month with the least checkouts for Catching Fire by Suzanne Collins
least_checkouts_catching_fire <- SPL_checkouts %>%
  group_by(CheckoutMonth) %>%
  summarize(Checkouts = min(Checkouts)) %>%
  pull(Checkouts)

# Calculate the year with the most checkouts for ebooks
most_checkouts_ebook <- SPL_checkouts %>%
  group_by(CheckoutYear) %>%
  filter(MaterialType == 'EBOOK') %>%
  summarize(Checkouts = max(Checkouts)) %>%
  pull(Checkouts)

# Calculate the year with the least checkouts for ebooks
least_checkouts_ebook <- SPL_checkouts %>%
  group_by(CheckoutYear) %>%
  filter(MaterialType == 'EBOOK') %>%
  summarize(Checkouts = min(Checkouts)) %>%
  pull(Checkouts)

# Chart codes

# Calculate the average number of checkouts for each year
checkout_per_year <- SPL_checkouts %>%
  group_by(CheckoutYear) %>%
  summarize(avg_checkouts = mean(Checkouts))

# Calculate the total checkouts by book for the Hunger Games series
checkouts_by_book <- SPL_checkouts %>%
  filter(Title == 'The Hunger Games: The Hunger Games Series, Book 1' | Title == 'Catching Fire: The Hunger Games Series, Book 2' | Title == 'Mockingjay: The Hunger Games Series, Book 3') %>%
  group_by(CheckoutYear, Title) %>%
  summarize(total_checkouts = sum(Checkouts), .groups = 'drop')

# Filter the data for different material types of books
material_type_books <- SPL_checkouts %>%
  filter(MaterialType == 'BOOK' | MaterialType == 'EBOOK' | MaterialType == 'AUDIOBOOK')
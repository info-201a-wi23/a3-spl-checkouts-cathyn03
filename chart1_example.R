# Load packages
library('dplyr')
library('ggplot2')
library('scales')

# Load in the data set
SPL_checkouts <- read.csv('/Users/cathy/OneDrive/Documents/Info201/2017-2023-10-Checkouts-SPL-Data.csv/2017-2023-10-Checkouts-SPL-Data.csv', stringsAsFactors = FALSE)

# Calculate the average number of checkouts for each year
checkout_per_year <- SPL_checkouts %>%
  group_by(CheckoutYear) %>%
  summarize(avg_checkouts = round(mean(Checkouts)))

# Create scatterplot
ggplot(data = checkout_per_year) +
  geom_point(mapping = aes(x = CheckoutYear, y = avg_checkouts, fill = CheckoutYear)) +
  labs(title = 'Average Book Checkouts over Time',
       x = 'Year',
       y = 'Number of Library Checkouts') +
  facet_wrap(~ CheckoutYear)
  

# Chart 1

library('tidyverse')
library('dplyr')
library('ggplot2')

SPL_checkouts <- read.csv('/Users/cathy/OneDrive/Documents/Info201/2017-2023-10-Checkouts-SPL-Data.csv/2017-2023-10-Checkouts-SPL-Data.csv', stringsAsFactors = FALSE)


checkout_per_year <- SPL_checkouts %>%
  group_by(CheckoutYear) %>%
  summarize(avg_checkouts = mean(Checkouts))

chart_1 <- ggplot(data = checkout_per_year, aes(x = CheckoutYear, y = avg_checkouts)) +
  geom_line()+
  geom_point(mapping = aes(x = CheckoutYear, y = avg_checkouts, color = CheckoutYear)) +
  labs(title = 'Average Book Checkouts over Time',
       x = 'Year',
       y = 'Number of Library Checkouts',
       color = 'Year')

View(chart_1)


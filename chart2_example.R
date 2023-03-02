# Load packages
library('dplyr')
library('ggplot2')

# Load in the data set
SPL_checkouts <- read.csv('/Users/cathy/OneDrive/Documents/Info201/2017-2023-10-Checkouts-SPL-Data.csv/2017-2023-10-Checkouts-SPL-Data.csv', stringsAsFactors = FALSE)

# Calculate the total checkouts for the Hunger Games Books
checkouts_by_book <- SPL_checkouts %>%
  filter(Title == 'The Hunger Games: The Hunger Games Series, Book 1' | Title == 'Catching Fire: The Hunger Games Series, Book 2' | Title == 'Mockingjay: The Hunger Games Series, Book 3') %>%
  group_by(CheckoutYear, Title) %>%
  summarize(total_checkouts = sum(Checkouts), .groups = 'drop') 

# Create line plot
ggplot(data = checkouts_by_book) +
  geom_line(mapping = aes(x = CheckoutYear, y = total_checkouts, color = Title)) +
  labs(title = 'Total Checkouts by Books of the Same Series over Time', 
       x = 'Year',
       y = 'Total Number of Checkouts',
       color = 'Book') +
  scale_x_continuous(limits = c(2017, 2023)) +
  facet_wrap(~ Title)

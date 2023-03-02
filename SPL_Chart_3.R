# Chart 3

library('tidyverse')
library('dplyr')
library('ggplot2')
library('scales')

SPL_checkouts <- read.csv('/Users/cathy/OneDrive/Documents/Info201/2017-2023-10-Checkouts-SPL-Data.csv/2017-2023-10-Checkouts-SPL-Data.csv', stringsAsFactors = FALSE)

material_type_books <- SPL_checkouts %>%
  filter(MaterialType == 'BOOK' | MaterialType == 'EBOOK' | MaterialType == 'AUDIOBOOK')

chart_3 <- ggplot(data = material_type_books) +
  geom_bar(mapping = aes(x = MaterialType , fill = MaterialType )) +
  labs(title = 'Distribution of Book Forms in SPL Checkouts',
       x = 'Type of Book Format',
       y = 'Frequency of Checkouts') +
  scale_y_continuous(labels = label_number_si()) +

View(chart_3)


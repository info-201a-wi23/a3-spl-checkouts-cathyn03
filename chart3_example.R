# Load packages
library('dplyr')
library('ggplot2')
library('scales')

# Load in the data set
SPL_checkouts <- read.csv('/Users/cathy/OneDrive/Documents/Info201/2017-2023-10-Checkouts-SPL-Data.csv/2017-2023-10-Checkouts-SPL-Data.csv', stringsAsFactors = FALSE)

# Filter the data for different material types of books
material_type_books <- SPL_checkouts %>%
  filter(MaterialType == 'BOOK' | MaterialType == 'EBOOK' | MaterialType == 'AUDIOBOOK')

# Create bar graph
ggplot(data = material_type_books) +
  geom_bar(mapping = aes(x = MaterialType , fill = MaterialType )) +
  labs(title = 'Distribution of Book Forms in SPL Checkouts',
       x = 'Type of Book Format',
       y = 'Frequency of Checkouts') +
  scale_y_continuous(labels = label_number_si())

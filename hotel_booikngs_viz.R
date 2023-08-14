# Step 1: Import your data
hotel_bookings <- read.csv("hotel_bookings.csv")

# Step 2: Refresh Your Memory
head(hotel_bookings)
colnames(hotel_bookings)

# Step 3: Install and load the 'ggplot2' package (optional)
install.packages('ggplot2')
library(ggplot2)

# Step 4: Making many different charts

# Scatter plot
ggplot(data = hotel_bookings) +
        geom_point(mapping = aes(x = lead_time, y = children))

# Bar chart
ggplot(data = hotel_bookings) +
        geom_bar(mapping = aes(x = hotel, fill = market_segment))

# Faceted plot
ggplot(data = hotel_bookings) +
        geom_bar(mapping = aes(x = hotel)) +
        facet_wrap(~market_segment)

# Step 5: Filtering

# Install and load the 'tidyverse' package
install.packages('tidyverse')
library(tidyverse)

# Filter data
onlineta_city_hotels <- filter(hotel_bookings, 
                               (hotel=="City Hotel" & 
                                        hotel_bookings$market_segment=="Online TA"))

# View filtered data frame
View(onlineta_city_hotels)

# Filter using pipe operator
onlineta_city_hotels_v2 <- hotel_bookings %>%
        filter(hotel=="City Hotel") %>%
        filter(market_segment=="Online TA")

# View second filtered data frame
View(onlineta_city_hotels_v2)

# Step 6: Use your new dataframe

# Create a plot using filtered data
ggplot(data = onlineta_city_hotels) +
        geom_point(mapping = aes(x = lead_time, y = children))

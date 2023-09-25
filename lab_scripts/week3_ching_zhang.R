## Question 1
# 1a) The first graph communicates the information better as there is a greater
# contrast in colour difference, making it easier to visually interpret what 
# the data show.

# 1b) The second graph communicates the information better as the plotted points
# in the scatter plot are more obvious and larger, making it easier to visually
# interpret what the data show.

## Question 2
# 2a)
countries <- read.csv("DataForLabs/countries.csv")

# 2b)
library(ggplot2) # This is necessary as we are calling non-native functions

# 2c) There is a positive relationship with % vaccination and frequency,
# the frequency increases as % vaccination also increases.
ggplot(countries,
       aes(x = measles_immunization_oneyearolds)) +
  geom_histogram() +
  xlab("1 year olds vaccinated against measles (%)") +
  ylab("Count")

# 2d)
ggplot(countries,
       aes(x = continent)) +
  geom_bar(stat = "count") +
  xlab("Continent") +
  ylab("Number of countries in continent")

# 2e)
ggplot(countries,
       aes(x = life_expectancy_at_birth_male,
           y = life_expectancy_at_birth_female)) +
  geom_point() +
  xlab("Life expectancy at birth of males (years)") +
  ylab("Life expectancy at birth of females (years)")
  
## Question 3
# 3a)
ggplot(countries,
       aes(x = ecological_footprint_2000,
           y = ecological_footprint_2012)) +
  geom_point() +
  xlab("Ecological footprint in 2000 (hectares)") +
  ylab("Ecological footprint in 2012 (hectares)")

# 3b) There is a moderately strong positive and increasing relationship between 
# the two years in terms of ecological footprint. As ecological footprint in  
# either year increases, the ecological footprint of the other year also 
# increases.

# 3c)







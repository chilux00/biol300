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
  ylab("Ecological footprint in 2012 (hectares)") +
  geom_abline(intercept = 0, slope = 1) 

# 3b) There is a moderately strong positive and increasing relationship between 
# the two years in terms of ecological footprint. As ecological footprint in  
# either year increases, the ecological footprint of the other year also 
# increases.

# 3c) The ecological footprint tends to go up. Countries with high ecological 
# footprint in 2000 changed and increased the most in 2012.

## Question 4
# Life expectancy varies greatly with continent. Africa has the greatest range
# of data points, while the Americas have the least. Outliers can be seen in 
# the boxplots for Africa, North America and South America.
ggplot(countries,
       aes(x = continent,
           y = life_expectancy_at_birth_female)) +
  geom_boxplot() +
  xlab("Continent") +
  ylab("Female life expectancy at birth (years)") 

## Question 5
# 5a)
bat_tongues <- read.csv("DataForLabs/BatTongues.csv")
summary(bat_tongues)

# 5b) The association is weak and positive.
ggplot(bat_tongues,
       aes(x = palate_length,
           y = tongue_length)) +
  geom_point() +
  xlab("Palate Length (mm)") +
  ylab("Tongue Length (mm)") 

# 5c) The outlier must be from a different species or an individual with very 
# long measurements.

# 5d)
library(dplyr)

# 5e) The flower that this species feeds on must have a very long stigma.
filter(bat_tongues,tongue_length>80)

## Question 6
# 6a)
lab1 <- read.csv("DataForLabs/collecteddata_lab1.csv")
summary(lab1)
ggplot(lab1,
       aes(x = Sex,
           y = Height)) +
  geom_boxplot() +
  xlab("Sex") +
  ylab("Height (cm)") 

# 6b)
ggplot(lab1,
       aes(x = circumference_head_cm)) +
  geom_histogram() +
  xlab("Head circumference (cm)") 

## Question 7
# The plot made in question 4 could be better represented as a hybrid scatter 
# and box plot combination graph to better show the distribution of data
# within the boxes themselves, and not just the outliers
  
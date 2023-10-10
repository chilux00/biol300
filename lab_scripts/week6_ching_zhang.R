# Ching Zhang | 68167998
library(binom)

## Question 1
# 1a)

## Question 2
# 2a)
stockings <- read.csv("DataForLabs/stockings.csv")

## Question 3
# 3a) The most frequent birth quarter is from August-October, followed by 
# November-January, then February-April and finally May-July
soccer_birth <- read.csv("DataForLabs/soccer_birth_quarter.csv")

soccer_plot <- soccer_birth %>%
  ggplot(aes(x = birth_quarter)) +
  geom_bar() +
  xlab("Birth Quarter") +
  ylab("Frequency")
soccer_plot

# 3b) 
canadian_births <- read.csv("DataForLabs/Canadian_births.csv")


## Question 4
# 4a)
cardiac_events <- read.csv("DataForLabs/cardiac events.csv")

# Ching Zhang | 68167998
library(binom)

## Question 1
# 1a) The 95% CI for this data is 0.004762806 to 0.02606666.
binom.confint(x = 6, n = 510, method = "ac")

# 1b)
binom.test(x = 0, n = 300, p = 0)
# what p-value to use? 

## Question 2
# 2a) The expected frequencies are 13 choices for each.
stockings <- read.csv("DataForLabs/stockings.csv", 
                      stringsAsFactors = TRUE)
stockings_table <- table(stockings$choice)
stockings_table
sum(stockings_table)  # 52  

stockings_expected <- c(0.25, 0.25, 0.25, 0.25)
52 * stockings_expected 

# 2b) The p-value is 0.014, and we can reject the null hypothesis. Stocking
# selection is independent of position.
chisq.test(stockings_table, p = stockings_expected)

# 2c)
chisq.test(x = c(6,9,16,21), p = c(0.25,0.25,0.25,0.25)) # gives same output

## Question 3
# 3a) The most frequent birth quarter is from August-October, followed by 
# November-January, then February-April and finally May-July
soccer_birth <- read.csv("DataForLabs/soccer_birth_quarter.csv", 
                         stringsAsFactors = TRUE)
soccer_table <- table(soccer_birth$birth_quarter)
soccer_table

soccer_plot <- soccer_birth %>%
  ggplot(aes(x = birth_quarter)) +
  geom_bar() +
  xlab("Birth Quarter") +
  ylab("Frequency")
soccer_plot

# 3b) 
canadian_births <- read.csv("DataForLabs/Canadian_births.csv",
                            stringsAsFactors = TRUE)
#### how to create fq table with these expected proportions?


## Question 4
# 4a)
cardiac_events <- read.csv("DataForLabs/cardiac events.csv",
                           stringsAsFactors = FALSE)
cardiac_events <- cardiac_events %>%
  mutate(frequency = frequency_out_of_hospital_cardiac_arrests +
           frequency_in_hospital_cardiac_events) %>%
  select(number_events_per_week, frequency)
cardiac_events
Scardiac_table

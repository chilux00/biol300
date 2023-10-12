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
canadian_births
canadian_birth_proportion <- canadian_births$canada_births_proportion

chisq.test(soccer_table, p = canadian_birth_proportion)


## Question 4
# 4a)
cardiac_arrests <- read.csv("DataForLabs/cardiac arrests out of hospital.csv")
cardiac_table <- table(cardiac_arrests$out_of_hospital_cardiac_arrests)
cardiac_table

# 4b) Mean = 2.015326 cardiac arrests.
mean(cardiac_arrests$out_of_hospital_cardiac_arrests)

# 4c)
dpois(x = 0, lambda = 2.015326) * sum(cardiac_table)

# 4d) One expected frequency is less than 5, but this is still less than 
# 25% of the total, and no expected frequencies are less than 1. This means
# that the frequencies are acceptable for use in a chi squared goodness of 
# fit test.

# 4e)
cardiac_expected <- c(34.785295, 70.103698, 70.640891, 47.454800, 23.909219,
                      9.636973, 4.469124) / 261
cardiac_observed <- c(cardiac_table)

# 4f) Chi squared: 5.799068 
chisq.test(cardiac_observed, p = cardiac_expected)$statistic

# 4g) There are 6 degrees of freedom.

# 4h) 0.446071
pchisq(q = 5.799068, df = 6, lower.tail = FALSE)


# Ching Zhang | 68167998
library(binom)

## Question 1
# 1a) The 95% CI for this data is 0.004762806 to 0.02606666.
binom.confint(x = 6, n = 510, method = "ac")

# 1b) The 95% CI for this data is -0.002590143 to 0.01523311. (Note, negative
# doesn't make sense, but just input it anyways). The expected proportion is 0.
binom.confint(x = 0, n = 300, method = "ac") 

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
# selection is not independent of position.
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

# 3b) The chi-squared value is 114.82, the degrees of freedom is 3, and the 
# p-value is 2.2e-16. With these data, we can reject the null hypothesis and
# conclude that the birth month does indeed have an effect on athlete 
# performance.
canadian_births <- read.csv("DataForLabs/Canadian_births.csv",
                            stringsAsFactors = TRUE)
canadian_births
# create vectors for each month group
Aug_Oct <- 0.0865 + 0.0863 + 0.0833
Feb_Apr <- 0.0757 + 0.0860 + 0.0847
May_July <- 0.0880 + 0.0854 + 0.0881
Nov_Jan <- 0.0780 + 0.0776 + 0.0804

canadian_expected <- c(Aug_Oct, Feb_Apr, May_July, Nov_Jan)
sum(canadian_expected) # check that probabilities sum to 1 - yes

chisq.test(soccer_table, p = canadian_expected)


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
sum(cardiac_expected) # check that sums to 1 - yes
cardiac_observed <- c(36, 79, 60, 41, 28, 10, 7)

# 4f) Chi squared: 5.799068 
chisq.test(cardiac_observed, p = cardiac_expected)$statistic

# 4g) Number of categories (7) - number parameters estimated (1) - 1 = 5
# The degrees of freedom = 5

# 4h) The p-value for this test is 0.3262641.
pchisq(q = 5.799068, df = 5, lower.tail = FALSE)

# 4i) Given the data, the P-value for this test fitted to a Poisson distribution
# is approximately 0.3262641. With this value, we cannot reject the null
# hypothesis that these data follow a Poisson distribution.


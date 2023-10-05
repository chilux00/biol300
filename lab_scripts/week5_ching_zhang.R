# Ching Zhang | 68167998
## Question 1
# 1a) The data is slightly skewed to the left. It is slightly symmetric, and
# it is also unimodal.
data <- read.csv("DataForLabs/collecteddata_lab1.csv")
data_plot <- data %>%
  ggplot(aes(x = Height)) +
  geom_histogram(bins=50) +
  xlab("Height (cm)") +
  ylab("Frequency")
data_plot

# 1b) There seems to be an outlier of 240 cm, which is unlikely for a height
# measurement. However, this doesn't seem like it would be a measurement error
# in inches. There is additionally also a data point of 1.73, which seems like
# the student has inputted an answer in meters instead of cm.
data_filtered <- data %>%
  filter(Height > 10, Height < 200)
data_filtered

# 1c) Mean = 168.9992 cm
mean(data_filtered$Height, na.rm = TRUE)

# 1d) SD = 8.58075 cm
sd(data_filtered$Height, na.rm = TRUE)

## Question 2
# 2a) Mean = 188.0643 mg
caffeine <- read.csv("DataForLabs/caffeine.csv")
mean(caffeine$caffeine_mg_16oz, na.rm = TRUE)

# 2b) 95% CI = 167.5237 mg to 208.6049 mg
t.test(caffeine$caffeine_mg_16oz)$conf.int

# 2c) The amount of caffeine in a cup is not consistent from one vendor to
# another. There is a large variation with no clear mode. The standard deviation
# is 35.57535 mg, and the coefficient of variation is 0.1891659.
caffeine_plot <- caffeine %>%
  ggplot(aes(x = caffeine_mg_16oz)) +
  geom_histogram() +
  xlab("Amount of caffeine (mg)") +
  ylab("Frequency")
caffeine_plot

stdv_caffeine <- sd(caffeine$caffeine_mg_16oz, na.rm = TRUE)
stdv_caffeine

mean_caffeine <- mean(caffeine$caffeine_mg_16oz, na.rm = TRUE)

stdv_caffeine / mean_caffeine

# 2d) Mean = 371.9667 mg, 95% CI: 239.3527 mg to 504.5806 mg. The overall 
# average caffeine content is much higher in Starbucks caffeine, and the 
# standard deviation is also much larger.
caffeine_starbucks <- read.csv("DataForLabs/caffeineStarbucks.csv")
mean(caffeine_starbucks$caffeine_mg_16oz, na.rm = TRUE)
t.test(caffeine_starbucks$caffeine_mg_16oz, na.rm = TRUE)$conf.int

## Question 3
# 3a) 99% CI: 159.4238 mg to 216.7047 mg.
t.test(caffeine$caffeine_mg_16oz, conf.level = 0.99)$conf.int

# 3b) The 99% CI spans a wider range, as it is more likely to contain the true 
# value, given that there is a wider range of potential values.

# 3c) The 2.5% to 97.5% quantiles of the distribution are 144.765 mg to 254.685 
# mg. This should still give us 95% of the data values as the difference 
# between the quantiles is still 95%, meaning that our range of interest
# for our data values has just shifted but remains the same width. These are not
# the same boundaries as the 95% confidence interval however, since we are
# looking at values from 2.5% to 97.5%. Probability decreases towards the tail
# ends of data, therefore the 95% confidence interval should be less wide in 
# range.
quantile(caffeine$caffeine_mg_16oz, c(0.025, 0.975), na.rm =TRUE)

## Question 4
mean(data$SiblingNumber) + 1

# 4a) The value for this class is similar, but greater. An increase in number
# of siblings just means that families on average are having more children.
# This could be due to positive growth in the economy that allows families
# to support more children at a time, or an overall increase in birth rate.

# 4b) The families represented in this class may be different, or show a 
# sampling bias dependent on factors such as the wealth of the school, the type
# of school, the location, etc.

# 4c) No families with zero children are represented as the survey was taken 
# from a school population - each family has minimum one child as that was the
# child taking the survey. This skews the data towards a higher sample mean 
# compared to the true mean of the population. This would give the data a 
# left tailed type of histogram. 

## Question 5
# 5a) For ecological footprint, the variable is skewed to the right.
# For cellphone subscriptions, the variable is relatively normally distributed,
# slightly skewed to the left.
# For female life expectancy, the variable is skewed to the left.
countries <- read.csv("DataForLabs/countries.csv")

footprint_plot <- countries %>%
  ggplot(aes(x = ecological_footprint_2000)) +
  geom_histogram() +
  xlab("Ecological footprint in 2000 (hectares)") +
  ylab("Frequency")

cellphone_plot <- countries %>%
  ggplot(aes(x = cell_phone_subscriptions_per_100_people_2012)) +
  geom_histogram() +
  xlab("Cellphone subscriptions per 100 people in 2012") +
  ylab("Frequency")

expectancy_plot <- countries %>%
  ggplot(aes(x = life_expectancy_at_birth_female)) +
  geom_histogram() +
  xlab("Female life expectancy at birth (years)") +
  ylab("Frequency")

footprint_plot
cellphone_plot
expectancy_plot

# 5b) For ecological footprint, mean = 3.147391 hectares, median = 2.14 hectares
# For cellphone subscriptions, mean = 99.90419, median = 103.25
# For female life expectancy, mean = 73.4153 years, median = 75.9 years
#
mean(countries$ecological_footprint_2000, na.rm = TRUE)
median(countries$ecological_footprint_2000, na.rm = TRUE)

mean(countries$cell_phone_subscriptions_per_100_people_2012, na.rm = TRUE)
median(countries$cell_phone_subscriptions_per_100_people_2012, na.rm = TRUE)

mean(countries$life_expectancy_at_birth_female, na.rm = TRUE)
median(countries$life_expectancy_at_birth_female, na.rm = TRUE)



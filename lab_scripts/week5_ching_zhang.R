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

# 2d) Mean = 371.9667 mg, SD = 126.3669 mg. The overall average caffeine 
# content is much higher in Starbucks caffeine, and the standard deviation is
# also much larger.
caffeine_starbucks <- read.csv("DataForLabs/caffeineStarbucks.csv")
mean(caffeine_starbucks$caffeine_mg_16oz, na.rm = TRUE)
sd(caffeine_starbucks$caffeine_mg_16oz, na.rm = TRUE)

## Question 3
# 3a) 99% CI: 159.4238 mg to 216.7047 mg.
t.test(caffeine$caffeine_mg_16oz, conf.level = 0.99)$conf.int

# 3b) The 99% CI spans a wider range, as it is more likely to contain the true 
# value, given that there is a wider range of potential values.

# 3c) 
quantile(caffeine$caffeine_mg_16oz, c(0.025, 0.975), na.rm =TRUE)



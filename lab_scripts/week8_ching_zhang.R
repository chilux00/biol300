# Ching Zhang | 68167998
## Question 1
# 1a)
normal_vector <- rnorm(n = 10, mean = 15, sd = 3)

# 1b)
hist(normal_vector)

# 1c)
qqnorm(normal_vector)

## Question 2
# 2a) These vector plots look more like the normal expectations than those from
# Question 1. This is because with a larger n size, the sample size increases
# and follows the Central Limit Theorem, which states that as the sample size 
# increases, the distribution of the sample means will approach a normal 
# distribution regardless of the shape of the population distribution
normal_vector2 <- rnorm(n = 250, mean = 15, sd = 3)
hist(normal_vector2)
qqnorm(normal_vector2)

## Question 3
# 3a) The data looks as though it comes from a distribution that is 
# approximately normal.
bumpus <- read.csv("DataForLabs/bumpus.csv")
bumpus_plot <- bumpus %>%
  ggplot(aes(x = total_length_mm)) +
  geom_histogram() +
  xlab("Total length of bird, beak to tail (mm)") +
  ylab("Frequency")
bumpus_plot

# 3b)
qqnorm(bumpus$total_length_mm)

# 3c) Mean = 159.5441mm, 95% confidence interval: 158.9403mm to 160.1480mm.
mean(bumpus$total_length_mm, na.rm = TRUE)
t.test(bumpus$total_length_mm, na.rm = TRUE)$conf.int

## Question 4
# 4a) The right 2d:4d ratio fits a normal distribution relatively well 
# according to the qqnorm plot. It is relatively linear along the theoretical
# and sample quantiles.
finger <- read.csv("DataForLabs/fingerLengths-1.csv")
right_2d_4d_ratio <- c(finger$Right.2D / finger$Right.4D)
qqnorm(right_2d_4d_ratio)

# 4b) The 95% confidence interval is from 0.9715953 to 0.9935528.
t.test(right_2d_4d_ratio, na.rm = TRUE)$conf.int

## Question 5
# 5a) The histogram does not look like a normal distribution. It is skewed 
# to the left.
mammals <- read.csv("DataForLabs/mammals.csv")
hist(mammals$body_mass_kg) 

# 5b) This new distribution fits the normal distribution much more than the 
# non-transformed body mass distribution. This is because taking the log of 
# the values stabilizes the variance and linearizes the relationship between
# the range of values - by compressing the range.
log_mammal <- log(mammals$body_mass_kg)
hist(log_mammal)

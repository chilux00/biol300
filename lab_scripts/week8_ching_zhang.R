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
# 4a)


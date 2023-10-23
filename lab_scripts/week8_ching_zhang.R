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

# Ching Zhang | 68167998
library(ggplot2)
library(car)
## Question 1
# 1a) The surviving group has a much less normal distributed graph than the 
# group that died. The variances do not look approximately normal.
bumpus <- read.csv("DataForLabs/bumpus.csv")
bumpus_survived <- filter(bumpus, survival == "survived")
bumpus_died <- filter(bumpus, survival == "died")

hist_surviving <- bumpus_survived %>%
  ggplot(aes(x = weight_g)) +
  geom_histogram() +
  labs(title = "Surviving Group") +
  xlab("Weight (g)") +
  ylab("Frequency")

hist_died <- bumpus_died %>%
  ggplot(aes(x = weight_g)) +
  geom_histogram() +
  labs(title = "Dead Group") +
  xlab("Weight (g)") +
  ylab("Frequency")

hist_surviving
hist_died

# 1b) The difference is 25.86094g - 25.22639g = 0.63455g.
t.test(weight_g ~ survival, data = bumpus, var.equal = FALSE)
25.86094 - 25.22639 

# 1c) The 95% confidence interval is from 0.1351376g to 1.1339597g.
t.test(weight_g ~ survival, data = bumpus, var.equal = FALSE)$conf.int

# 1d) For these data, the P-value in Levene's Test is 0.3729. We would not 
# reject the null hypothesis that the surviving and dying birds had the same
# variance in weight. 
leveneTest(data = bumpus, weight_g ~ survival, center = mean)


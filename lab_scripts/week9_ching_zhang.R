# Ching Zhang | 68167998
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

# 1b) The difference is 25.86094 - 
t.test(weight_g ~ survival, data = bumpus, var.equal = FALSE)


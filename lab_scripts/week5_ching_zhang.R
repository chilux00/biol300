# Ching Zhang | 68167998
## Question 1
# 1a) The data is slightly skewed to the left. It is slightly symmetric, and
# it is also unimodal.
data <- read.csv("DataForLabs/collecteddata_lab1.csv")
data_plot <- data %>%
  ggplot(aes(x=Height)) +
  geom_histogram(bins=50)
data_plot

# 1b) There seems to be a 
# Ching Zhang | 68167998
## Question 1
# 1a) The data is slightly skewed to the left. It is slightly symmetric, and
# it is also unimodal.
data <- read.csv("DataForLabs/collecteddata_lab1.csv")
data_plot <- data %>%
  ggplot(aes(x=Height)) +
  geom_histogram(bins=50)
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




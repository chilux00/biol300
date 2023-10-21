# Ching Zhang | 68167998
## Question 1
# 1a)
oswego <- read.csv("DataForLabs/oswego.csv", stringsAsFactors = TRUE)

# 1b)
levels(oswego$ill)
oswego$ill <- factor(oswego$ill, levels = c("Sick", "Healthy"))
oswego$spinach <- factor(oswego$spinach, levels = c("Y","N"))
oswego$baked_ham <- factor(oswego$baked_ham, levels = c("Y","N"))
oswego$mashed_potato <- factor(oswego$mashed_potato, levels = c("Y","N"))
oswego$brown_bread <- factor(oswego$brown_bread, levels = c("Y","N"))
oswego$milk <- factor(oswego$milk, levels = c("Y","N"))
oswego$coffee <- factor(oswego$coffee, levels = c("Y","N"))
oswego$fruit_salad <- factor(oswego$fruit_salad, levels = c("Y","N"))
oswego$cabbage_salad <- factor(oswego$cabbage_salad, levels = c("Y","N"))
oswego$jello <- factor(oswego$jello, levels = c("Y","N"))
oswego$rolls <- factor(oswego$rolls, levels = c("Y","N"))


# 1c) The chi-squared value for the relationship between fruit salad and 
# illness is 3.68. It would not be legitimate to use a chi-squared test on this
# data as there are expected values below 5. A better test to use would be
# Fisher's exact test as there are no set minimum thresholds for expected size.
oswego_table <- table(oswego$fruit_salad, oswego$ill)
oswego_table
chisq.test(oswego_table)$expected

# 1d) For spinach the odds ratio is 0.9186994. For baked ham the odds ratio is
# 0.8325381. For vanilla ice cream the odds ratio is 0.04513438. For chocolate
# ice cream the odds ratio is 2.483418. The most likely vehicle of the disease
# is vanilla ice cream.
oswego_spinach <- table(oswego$spinach, oswego$ill)
oswego_ham <- table(oswego$baked_ham, oswego$ill)
oswego_vanilla <- table(oswego$vanilla_ice_cream, oswego$ill)
oswego_chocolate <- table(oswego$chocolate_ice_cream, oswego$ill)

fisher.test(oswego_spinach)$estimate
fisher.test(oswego_ham)$estimate
fisher.test(oswego_vanilla)$estimate
fisher.test(oswego_chocolate)$estimate

# 1e) The 95% confidence interval is from 0.007201237 to 0.191715457.
fisher.test(oswego_vanilla)$conf.int

# 1f)
mosaicplot(oswego_vanilla, 
           color = c("darkred", "gold"), 
           xlab ="Food eaten?", ylab = "Healthy or Sick")

## Question 2
# 2a) The p-value is 1.132e-05, so we reject the null hypothesis that there is 
# no association.
week1 <- read.csv("DataForLabs/collecteddata_lab1.csv")
dominant_table <- table(week1$Hand, week1$Foot)
fisher.test(dominant_table)

## Question 3
# 3a) The odds ratio is 1.061703 for association between name and mode of
# movement, and the 95% confidence interval is from 0.3269777 to 3.4491262.
shufflebottom <- read.csv("DataForLabs/shufflebottoms.csv")
shuffletable <-  table(shufflebottom$name, shufflebottom$movement_type)

shuffletable

fisher.test(shuffletable)

# 3b) Based on the odds ratio and confidence interval, I would expect that a 
# hypothesis test would not find a significant association between name and 
# movement type. The point estimate odds ratio is very close to 1, suggesting
# that the data is not providing strong evidence to reject the null hypothesis.

# 3c) The output shows that the chi squared value is 0.012994 with 1 degree of
# freedom and a p-value of 0.9092. We do not reject the null hypothesis of 
# no association for a significant difference between the name groups for mode
# of movement.
chisq.test(shuffletable, correct = FALSE)

## Question 4
# 4a)
falls <- read.csv("DataForLabs/stopping_falls.csv")
fallstable <- table(falls$stopped_to_talk, falls$fall)
mosaicplot(fallstable, 
           color = c("darkred", "gold"), 
           xlab ="Stopped to talk or not", ylab = "Fall or not")

# 4b) The chi-squared value is 12.09 with 1 degree of freedom and a p-value of
# 0.0005071. We reject the null hypothesis that there is no relationship between
# stopping to talk and falls.
chisq.test(fallstable)

# 4c) The p-value of is 0.0002784, with an odds ratio of 0.06667354 and a 95%
# confidence interval of 0.006210446 to 0.377823677. There is an association
# between the two independent categorical variables.
fisher.test(fallstable)

## Question 5
# 5a) The odds ratio is 0.676663 and then 95% confidence interval is from
# 0.1736193 to 2.9086672.
tCountTable <- data.frame(Common = c (24, 5), Uncommon = c(57, 8), 
                          row.names = c("Found", "Not found"))
fisher.test(tCountTable)

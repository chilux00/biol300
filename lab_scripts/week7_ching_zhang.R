# Ching Zhang | 68167998
## Question 1
# 1a)
oswego <- read.csv("DataForLabs/oswego.csv", stringsAsFactors = TRUE)

# 1b)
levels(oswego$ill)
oswego$ill <- factor(oswego$ill, levels = c("Sick", "Healthy"))

# 1c) The chi-squared value for the relationship between fruit salad and 
# illness is 3.68. It would not be legitimate to use a chi-squared test on this
# data as there are expected values below 5. A better test to use would be
# Fisher's exact test as there are no set minimum thresholds for expected size.
oswego_table <- table(oswego$fruit_salad, oswego$ill)
oswego_table
chisq.test(oswego_table)$expected

# 1d) For spinach the odds ratio is 1.088495. For baked ham the odds ratio is
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
# movement type

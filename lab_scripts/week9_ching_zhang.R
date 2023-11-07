# Ching Zhang | 68167998
library(ggplot2)
library(car)
## Question 1
# 1a) The surviving group has a much less normal distributed graph than the 
# group that died. The variances do not look approximately normal.
bumpus <- read.csv("DataForLabs/bumpus.csv")
ggplot(bumpus, aes(x = weight_g)) +   
  geom_histogram() + 
  facet_wrap(~ survival, ncol = 1)

# 1b) The difference is 25.86094g - 25.22639g = 0.63455g.
t.test(weight_g ~ survival, data = bumpus, var.equal = FALSE)
25.86094 - 25.22639 

# 1c) The 95% confidence interval is from 0.1351376g to 1.1339597g.
t.test(weight_g ~ survival, data = bumpus, var.equal = FALSE)$conf.int

# 1d) For these data, the P-value in Levene's Test is 0.3729. We would not 
# reject the null hypothesis that the surviving and dying birds had the same
# variance in weight. 
leveneTest(data = bumpus, weight_g ~ survival, center = mean)

## Question 2
# 2a) 
countries <- read.csv("DataForLabs/countries.csv")
ecodiff <- c(ecodiff = countries$ecological_footprint_2000 - 
             countries$ecological_footprint_2012)

hist(ecodiff)

# 2b) The P-value for this test is 0.008434. We would reject the null 
# hypothesis that the ecological footprint did not change significantly between
# 2000 and 2012. 
t.test(countries$ecological_footprint_2000, 
       countries$ecological_footprint_2012,
       paired = TRUE)

# 2c) There is evidence that the ecological footprint changed over time from 
# 2000 to 2012. From the histogram, it shows that the difference from 2000 to 
# 2012 was more often positive than not, so that would indicate a decrease in 
# ecological footprint between the two years.

## Question 3
# 3a)
leg <- read.csv("DataForLabs/leg shaving.csv")

# 3b) 

## Question 4
# 4a) 
finger <- read.csv("DataForLabs/fingerLengths-1.csv")
finger <- finger %>%
  filter(Handedness == "R") %>%
  mutate(ratio = Right.2D / Right.4D)

ggplot(finger, aes(x = Sex, y = ratio, fill = Sex)) + 
  geom_violin() +
  xlab("Sex") + ylab("Ratio of 2D:4D in the right hand") + 
  theme_classic()+scale_fill_manual(values=c("#FFB531","#BC211A"))+ 
  stat_summary(fun.y=mean,  geom="point", color="black")+ 
  theme(legend.position="none")+ 
  theme(aspect.ratio=1)

# 4b)


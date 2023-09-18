# Ching Zhang | Student #: 68167998

# read in csv file for titanic data
titanicData <- read.csv("DataForLabs/titanic.csv", stringsAsFactors = TRUE)

summary(titanicData) # display titanic data frame
titanicData$age # get ages of all passengers
titanicData$log_age = log(titanicData$age) # add new column: log of age
head(titanicData)

# filter females
titanicDataFemalesOnly <- filter(titanicData, sex == "female")

## Question 1
# 1a)
ace_ng_pool <- c(640, 1070, 780, 70, 160, 130, 60, 50, 2110, 70, 350, 30, 
                       210, 90, 470, 580, 250, 310, 460, 430, 140, 1070, 130)
ace_ng_pool
# 1b) The mean ACE concentration is 420 ng/L
mean(ace_ng_pool)

# 1c)
urine_L_pool <- ace_ng_pool/ 4000
urine_L_pool

# 1d) The mean concentration of urine/L is 0.105 mL urine/L. 
# This is ng/ACE/L divided by 4000.
avg_urine_pool <- mean(urine_L_pool)

# 1e) Yes, it returned the same answer as with mean().
sum(urine_L_pool) / length(urine_L_pool)

# 1f) The average amount of urine (mL) in a 500 000L pool is 52 500 mL.
avg_urine_pool * 500000

## Question 2
# 2a)
o2_consume_feed <- c(71.0, 77.3, 82.6, 96.1, 106.6, 112.8, 121.2, 126.4, 
                     127.5, 143.1)
o2_consume_nonfeed <- c(42.2, 51.7, 59.8, 66.5, 81.9, 82.0, 81.3, 81.3, 96.0, 
                        104.1)

# 2b)
length(o2_consume_feed)
length(o2_consume_nonfeed)

# 2c)
MetabolismDifference <- o2_consume_feed - o2_consume_nonfeed
MetabolismDifference

# 2d) The average difference in O2 consumption was 31.78 ml O2/kg
mean(MetabolismDifference)

# 2e)
MetabolismRatio <- o2_consume_feed / o2_consume_nonfeed
MetabolismRatio

# 2f) The mean of this log ratio is 0.363873
logMetabolismRatio <- log(MetabolismRatio)
mean(logMetabolismRatio)

## Question 3
# 3a)
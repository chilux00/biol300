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

# 1f) The average amount of urine (mL) in a 500 000L pool is 52 500mL.
avg_urine_pool * 500000



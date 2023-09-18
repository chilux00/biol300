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
ace_ng_concentration <- c(640, 1070, 780, 70, 160, 130, 60, 50, 2110, 70, 350, 30, 
                       210, 90, 470, 580, 250, 310, 460, 430, 140, 1070, 130)
ace_ng_concentration
# 1b) the mean ACE concentration is 420 ng/L
mean(ace_ng_concentration)

# 1c)
urine_per_L <- ace_ng_concentration / 4000
urine_per_L

# 1d) the mean concentration of urine/L is 0.105mL urine/L
mean(urine_per_L)

# 1e)





# Ching Zhang | 68167998
library(dplyr)
## Question 1
# 1a)
cuckoo <- read.csv("DataForLabs/cuckooeggs.csv")
cuckoo

ggplot(cuckoo, aes(x = egg_length)) +   
  geom_histogram() + 
  facet_wrap(~ host_species, ncol = 1) +
  theme(text = element_text(size=10)) +
  xlab("Egg Length (mm)") +
  ylab("Frequency")

# 1b) 
cuckoo_sd_mean <- cuckoo %>%
  group_by(host_species) %>%
  summarize(group_mean = mean(egg_length, na.rm = TRUE),
            group_sd = sd(egg_length, na.rm = TRUE))

cuckoo_sd_mean

# 1c) In order to perform ANOVA analysis on these data we must evaluate whether
# or not they fit the equal variance assumption of the ANOVA test. Looking
# at the table of standard deviation and means, we see that the standard
# deviations are relatively similar, meaning this assumption can be made and 
# the ANOVA test would be a valid method to test for differences between host 
# species in the lengths of cuckoo eggs in their nests. 

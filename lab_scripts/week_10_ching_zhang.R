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

# 1d) The P value is very small, at 3.152e-08, so we reject the null hypothesis
# that there is no difference between host species and the lengths of cuckoo
# eggs in their nests.
cuckooANOVA <- lm(egg_length ~ host_species, data = cuckoo)
anova(cuckooANOVA)

# 1e) In these data, the p-value is only less than 0.05 in the pairs of 
# Meadow Pipit-Hedge Sparrow, Wren-Hedge Sparrow, Tree Pipit-Meadow Pipit,
# Wren-Meadow Pipit, Wren-Pied Wagtail, Wren-Robin and Wren-Tree Pipit. We 
# cannot reject null hypotheses for all other pairings, and can only reject
# the null hypothesis for these pairings. 
TukeyHSD(aov(cuckooANOVA))

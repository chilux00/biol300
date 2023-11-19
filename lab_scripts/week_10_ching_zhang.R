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


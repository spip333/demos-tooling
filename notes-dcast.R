# dcast
# cf https://www.r-bloggers.com/reshape-and-aggregate-data-with-the-r-package-reshape2/
library(reshape2) # für melt()/dcast()

x = data.frame(subject = c("John", "Mary"), 
               time = c(1,1),
               age = c(33,NA),
               weight = c(90, NA),
               height = c(2,2))
x

molten <- melt(x, id.vars = c("subject", "time"))
molten

dcast(molten, formula = time + subject ~ variable)
dcast(molten, formula = subject + time  ~ variable)
dcast(molten, formula = subject  ~ variable)
dcast(molten, formula = ...  ~ variable)

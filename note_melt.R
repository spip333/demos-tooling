# melt
library(reshape2) # für melt()/dcast()
loc <- c("fribourg", "bern", "basel", "zuerich")
v1 <- c("yes", "no", "no", "yes")
v2 <- c(25, 23, 22, 25)
v3 <- c(12, 13,12, 15)
df <- data.frame(loc, v1, v2, v3)
df
melt(df, id.vars = "loc", measure.vars = c("v1", "v2", "v3"))
df

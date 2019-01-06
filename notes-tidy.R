# Notes de cours Tooling and Datenmanagement - 2018-11-15

getwd()
setwd("c:/ieu/workspace/R")

# Tools um Daten zu säubern (kleine Auswahl): 
#– str_replace(), str_sub() aus dem Package stringr 
#– tolower() 
#– melt() dcast() aus dplyr 
#– einige weitere in Paket tidyr 
#– auch nützlich: recode() von John Fox (Package car)
# Wetterdaten 
weather <- read.table("https://raw.githubusercontent.com/justmarkham/tidy-data/master/data/weather.txt", header=T)
head(weather)  # hier sind Variablen in Zeilen und Spalten
class(weather)
colnames(weather)
rownames(weather)
summary(weather)
weather[1,]
weather[,1]
weather[1,1:10]
weather[2,1:20]

# Daten reshapen (melt) und Missings löschen
library(reshape2) # für melt()/dcast()
weather1 <- melt(weather, id=c("id", "year", "month", "element"), na.rm=TRUE)
head(weather1)

# saubere Spalte für "day"
library(stringr)    # für str_replace(), str_sub()
weather1$day <- as.integer(str_replace(weather1$variable, "d", ""))

# saubere Spalte für "element"
weather1$element <- tolower(str_replace(weather1$element, "T", ""))
head(weather1)

# drop column "variable"
weather1$variable <- NULL
head(weather1)

# die Spalte element beherbergt zwei unterschiedliche Variablen min und max. 
# Diese sollen in zwei Spalten:
weather.tidy <- dcast(weather1, ... ~ element) # reshapen auf zwei Spalten
head(weather.tidy)

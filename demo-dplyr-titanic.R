##########################################################
# Demo dplyr from script chap. 16.3
# 
#
##########################################################

# install.packages("dplyr")
library(dplyr)

# load data
titanic <- read.dta("http://www.stata-press.com/data/kkd/titanic2.dta")

head(titanic)

# filter
filter(titanic, class == "1st class", age2 < 18)

# alos ok
titanic %>%
  filter(age2 < 18) %>%
  filter(class == "1st class") %>%
  nrow

# konventionell wäre das komplizierter:
titanic[titanic$class == "1st class" & titanic$age2 < 18, ]

# zusätzlich Spalten selektieren:
titanic %>%
  filter(class == "1st class", age2 < 18) %>%
  dplyr::select(age2) %>%
  head()

# zusätzlich Spalten selektieren:
titanic %>%
  filter(class == "1st class", age2 < 18) %>%
  dplyr::select(age2, sex, class) %>%
  head()

# neue Variable "child" bauen
titanic %>%
  mutate(child = age2 < 18) %>%
  head()

# Auszählen wer gestorben ist nach Geschlecht und Kind (ja/nein)
titanic %>%
  mutate(child = ifelse(age2 < 18, "yes", "no")) %>%
  group_by(sex, child, survived) %>%
  summarise(n=n()) %>%
  arrange(sex, child, survived)

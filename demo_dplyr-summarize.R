### #######################################################
# Demo Data dplyr
### #######################################################
# cf. 16.3.2 dplyr
# group by, summarize

# load libraries and titanic data
library(foreign)
library(dplyr)
library(data.table)
titanic <- read.dta("http://www.stata-press.com/data/kkd/titanic2.dta")

# case_when example with dplyr
df <- titanic %>% 
  mutate(category = case_when((age2 > 60) == TRUE ~ "Grosseltern",
                              (age2 <= 60 & age2 > 30) == TRUE ~ "Erwachsener",
                              (age2 <= 30 & age2 > 20) == TRUE ~ "Juge Erwachsene",
                              (age2 <= 20 & age2 > 12) == TRUE ~ "Teenager", 
                              (age2 <= 12) == TRUE ~ "Kind"))
head(df)

# Load a file with data.table 
# 1. Get a List of all files named with a key word, say all `.csv` files
filenames <- list.files("C:/ieu/files", pattern="employee_list.csv", full.names=TRUE)

# 2. Load and bind all data sets (into single object)
data <- rbindlist(lapply(filenames,fread))

summary(data)

max(data$Salary)

# mutate example
titanic %>% 
  mutate(child = age2 < 18)  %>% 
  head()

# mutate example
data %>% mutate(Ranking = Salary > 9000)

# mutate + case_when example
salaries <- data %>% mutate(ranking = case_when(
  (Salary > 8000) ~ "HIGH",
  (Salary < 4000) ~ "Low",
  (Salary <= 8000) ~ "middle"))

salaries

# group_by : death / survivors vs sex vs is child or not:
titanic %>%
  mutate(child = ifelse(age2 < 18, "yes", "no")) %>%
  group_by(sex, child, survived) %>%
  summarise(n=n()) %>%
  arrange(sex, child, survived)



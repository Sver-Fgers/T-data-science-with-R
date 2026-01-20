# -------------------------------
# Load packages and datasets
# -------------------------------

pacman::p_load(outbreaks, dplyr, gt, readr)

# Built-in earthquake dataset
quakes


# -------------------------------
# Sorting and viewing quakes data
# -------------------------------

# Sort earthquakes by magnitude (descending)
magnitude <- arrange(quakes, -mag)

# Top 5 strongest earthquakes
head(magnitude, n = 5)

# Bottom 5 weakest earthquakes
tail(magnitude, n = 5)

# Same operation in one line
head(arrange(quakes, -mag), n = 5)

# Pipe version with gt table
quakes %>% 
  arrange(-mag) %>% 
  head(n = 5) %>% 
  gt()

# Sort by depth and show top 4 deepest earthquakes
quakes %>% 
  arrange(-depth) %>% 
  head(n = 4) %>% 
  gt()


# -------------------------------
# Vectors and basic operations
# -------------------------------

# Numeric vector
age <- c(13, 36, 43, 57)

# Character vector
sex <- c("M", "F", "M", "F")

# Logical vector
positive_test <- c(TRUE, FALSE, TRUE, FALSE)

# ID vector
id <- 1:4

# Check object types
class(age)
is.vector(sex)

# Vectorized operations
age * 2
sqrt(age)
age + id


# -------------------------------
# Create and inspect data frame
# -------------------------------

data <- data.frame(age, sex, positive_test, id)

# View data frame
data

# Check column types
class(data$id)
is.vector(data$sex)


# -------------------------------
# Built-in infert dataset
# -------------------------------

infert
dplyr::as_tibble(infert)


# -------------------------------
# (Intentional error example)
# -------------------------------

# This will ERROR because columns have unequal lengths
# data <- data.frame(age = c(14,35,57,78), sex = c("F","M"))


# -------------------------------
# Reading Ebola CSV data
# -------------------------------

# Base R CSV import (data.frame)
ebola_df <- read.csv("https://tinyurl.com/ebola-data-sample")
class(ebola_df)

# Tidyverse CSV import (tibble)
ebola_df2 <- read_csv("https://tinyurl.com/ebola-data-sample")
class(ebola_df2)
ebola_df2


# -------------------------------
# Varicella simulation dataset
# -------------------------------

# Convert to tibble
as_tibble(varicella_sim_berlin)

# Youngest 5 individuals
varicella_sim_berlin %>% 
  as_tibble() %>% 
  arrange(age) %>% 
  head(n = 5) %>% 
  select(firstname, lastname, age) %>% 
  gt()

# Oldest 5 individuals
varicella_sim_berlin %>% 
  as_tibble() %>% 
  arrange(-age) %>% 
  head(n = 5) %>% 
  select(firstname, lastname, age) %>% 
  gt()


# -------------------------------
# Step-by-step version (same result)
# -------------------------------

oldest_people <- arrange(as_tibble(varicella_sim_berlin), -age)
head_old <- head(oldest_people, n = 5)
selection <- select(head_old, firstname, lastname, age)
gt(selection)


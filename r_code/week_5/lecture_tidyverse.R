#
## Lecture Tidyverse
#

library(tidyverse)  # contains 8 more packages
library(dplyr)

# Example for data wrangling with dplyr
mtcars |> 
  select(mpg) |>   
  slice_sample(n = 2) |> 
  summarize(mean(mpg)) |> 
  unlist()

# Read in data as data frame and tibble
library(readr)
df_animals = read_csv("https://raw.githubusercontent.com/hannesrosenbusch/PIPS_DATA/master/animals.csv")

# Building a pet recommendation system
cuddle_imp = 4
dead_imp = 6
low_agg_imp = 5
price_imp = 100

df_animals |> 
  as.data.frame() |>   # Change class to data frame instead of tibble
  select(c(Animal, Cuddleability, Deadly, Aggression, Price)) |>   # Select col
  mutate(aggression_num = case_when(Aggression %in% c("Medium", "High") ~ 0,
                   Aggression %in% "Low" ~ 3)) |>
  mutate(price_num = as.numeric(gsub(",", "", sub("-.*", "", Price)))) |> 
  mutate(our_score =   # Create new variable
           Cuddleability * cuddle_imp + 
           -Deadly * dead_imp +
           aggression_num * low_agg_imp -
           price_num * price_imp) |> 
  group_by(Deadly) |>  # Group by values of a variable 
  summarize(mean(price_num, na.rm = TRUE)) |> 
  ungroup()  # Lift the grouping specified previously





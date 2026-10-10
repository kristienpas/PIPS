

## If functions

# If functions only take logicals

# Example of red flags in online dating
ai_picture = TRUE
sus_age = TRUE


if(ai_picture || sus_age){  
  print("swipe no")
  print("ewww")
}
print("next")

# two || for inclusive "or" (one is bad style in if statements)

# xor() for exclusive or
xor(ai_picture, sus_age)

# or any of these for exclusive or
(ai_picture || sus_age) && !(ai_picture && sus_age)
(!ai_picture && sus_age) || (ai_picture && !sus_age)
ai_picture != sus_age 

# two && for "and"

ai_picture + sus_age  # is equal to 2 which gets converted to TRUE in an if statement

# If statement for whether we should swipe right or left
if(ai_picture){  
  print("swipe no")
  print("ewww")
} else if(sus_age){
  print("swipe no")
  print("Looks suspicious")
} else{
  print("swipe yes")
}

# What about vector of booleans?
ai_pics = c(T, T, F, F, T, F, T)

ifelse(ai_pics, "swipe no", "swipe yes")

# in python: np.where()


# Betting game example
wallet = 10
dice = sample(1:6, 3, replace = TRUE)

# Winning: all three dice are different -> + 1€
# Losing -> - 2€
if((dice[1] != dice[2]) && (dice[2] != dice[3]) && (dice[1] != dice[3])){
  wallet = wallet + 1
} else{
  wallet = wallet -2
}

# Other options for coding winning
(dice[1] != dice[2]) && (dice[2] != dice[3])
length(unique(dice)) == length(dice)  # probably the best way



## Loops

# While loop: Runs the loop until condition is true
con = TRUE
while(con){
  print("hi")
  con = FALSE
}

# Example of casino: Dice game
budget = 25

# Play until I lose everything
while(budget >= 2){
  dice = sample(1:6, 3, replace = TRUE)
  if(length(unique(dice)) == length(dice)){
    budget = budget + 1
  } else{
    budget = budget -2
  }
}

# Play 3 rounds and then stop
budget = 25
round_counter = 1
while(round_counter <3){
  dice = sample(1:6, 3, replace = TRUE)
  if(length(unique(dice)) == length(dice)){
    budget = budget + 1
  } else{
    budget = budget - 2
  }
  round_counter = round_counter + 1
}

# or use a for loop
for(round_counter in 1:3){
  dice = sample(1:6, 3, replace = TRUE)
  if(length(unique(dice)) == length(dice)){
    budget = budget + 1
  } else{
    budget = budget - 2
  }
  print(round_counter)
}

# Syntax of the for loop
for(l in letters){
  print(l)
}

for(ind in 1:length(letters)){
  print(letters[ind])
}

# for loops can be expressed as while loops

# Change all even numbers in a vector to 0
set.seed(123)
numbers = sample(1:100, 10, replace = TRUE)

for(ind in 1:length(numbers)){
  if(numbers[ind] %% 2 == 0){
    numbers[ind] = 0
  }
}

# Other options
ifelse(numbers %% 2 == 0, 0, numbers)
numbers[numbers %% 2 == 0] = 0


# Iterate over elements
for (literal_element in 1:6) {
  print(literal_element)
}

# Iterate over position
vec = 10:15
vec2 = 20:25
for (pos in 1:6) {
  print(vec[pos])
  print(vec2[pos])
}

# Ex. in research for for loop
# Make up data
m = matrix(sample(1:7, 100, replace = TRUE), nrow = 25, ncol = 4)
colnames(m) = c("racism", "drift_rate", "attitude_toward_outgroup", "insincerity_of_smile")
df = as.data.frame(m)

# for loop over the rows; add racism and attitude
for (row in 1:nrow(df)) {
  df$racism_score[row] = df$racism[row] + df$attitude_toward_outgroup[row]
}


# In which order are things printed?
for(number in 1:3) {
  for(letter in c("A", "B", "C")) {
    print(c(number, letter))
  }
}

# Implicit loops
# Sum over all variables for each participant
for (i in 1:nrow(df)) {
  print(sum(df[i,]))
}

# Same: implicit loop
apply(df, 1, sum)

# Over columns
for (col in 1:ncol(df)) {
  print(mean(df[,col]))
}

# And with apply()
apply(df, 2, mean)

# simple apply for one dimensional data types
sapply(df$racism, sqrt)


# Next and break in loops
df$racism_score = NA
for (row in 1:nrow(df)) {
  df$racism_score[row] = df$racism[row] + df$attitude_toward_outgroup[row]
  print(df$racism_score[row])
  if (df$racism_score[row] > 13) {
    print("OH NO, RACISM")
    break
  }
}

for (row in 1:nrow(df)) {
  if ((df$racism_score[row] = df$racism[row] + df$attitude_toward_outgroup[row]) > 13) {
    print("OH NO, RACISM")
    next
  }
  df$racism_score[row] = df$racism[row] + df$attitude_toward_outgroup[row]
  print(df$racism_score[row])
}

# switch function
# Example: Red flag online dating
red_flag = "ai_picture"  # sus_age, smoking

# if ai picture, print swipe no
switch(red_flag,
       ai_picture = "swipe no",
       real_picture = "swipe yes")

# OR:
red_flag = 1  # sus_age, smoking

# if ai picture, print swipe no
switch(red_flag,
       "swipe no",
       "swipe yes")


## Functions

# Addition
add = function(inp1, inp2) {
  my_sum = inp1 + inp2
  return(my_sum)
}

add(inp1 = 18, inp2 = 37)


# Online Dating
judge_person = function(ai_picture = TRUE){  # Setting a default value
  
  # Input check
  if (!is.logical(ai_picture)) {
    stop("OH NO. ai_picture should be a logical")  # stop() -> error message
  }
  
  # warning() for warnings
  
  if (ai_picture) {
    return("swipe no")
  } else {
    return("swipe yes")
  }
}

# Wrong input
judge_person(ai_picture = "YES")

# This works
judge_person(ai_picture = TRUE)

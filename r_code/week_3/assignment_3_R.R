#
## Assignment Week 3
#
## Kristien Paschold
#


#R1

meryls_oscars = 3
meryls_losses = 18
best_actress = "Meryl Streep"
if (best_actress == "Meryl Streep") {
  meryls_oscars = meryls_oscars + 1
} else {
  meryls_losses = meryls_losses + 1
}



#R2

# Function to randomly choose boxplot or histogram
box_hist = function(num_vec){
  random_plot = sample(c("boxplot", "histogram"), 1, replace = TRUE)
  if(random_plot == "boxplot"){
    boxplot(num_vec)
  } else{
    hist(num_vec)
  }
}



#R3

predicted <- "rain"
actual <- "rain"
employee_salary <- 54000

# As soon as one condition is TRUE, the other else if statements are skipped

# Fixed code
if (actual == "sun"){
  print("Yay! Birthday moved outside!")
  employee_salary <- employee_salary + 500
} else if (actual == "high wind") {
  print("Boss blew off her bike into a canal.")
  employee_salary <- employee_salary
} else if (predicted != actual) {
  employee_salary <- employee_salary - 500
} else if (predicted == actual) {
  employee_salary <- employee_salary + 500
}



#R4

## Potential research topics
# Modeling attention processes with the drift diffusion model
# Modeling non-linear relationships
# Comparing machine learning to human learning

# Julia's interest on the respective topics
interest_DDM = 50
interest_non_lin =  70
interest_ML = 70

# Combining all values to one vector
interests = c(interest_DDM, interest_non_lin, interest_ML)

# Changed code to test logic  for all values in the vector
interest_detected <- c(FALSE, FALSE, FALSE)  # Vector of FALSE values

for (i in 1:length(interests)) {
  if (interests[i] > 85) {
    interest_detected[i] = TRUE  # If interest is > 85, then change value to TRUE
  }
}



#R5

# Print message if its earlier than 5 am
if (as.numeric(format(Sys.time(), "%H")) < 5) {
  print("Go to sleep")
}



#R6

# Load library
library(dplyr)

# Read in clinical data
mental_dis = read.csv(url("https://raw.githubusercontent.com/hannesrosenbusch/schiphol_class/master/Kaggle_Dataset_Mental_Disorders.csv"), sep = ",")

# Recode variables so that 1 represents an undesirable behaviour
never_to_blame = recode_values(mental_dis$Admit.Mistakes, "YES" ~ 0, "NO" ~ 1)
disrespectful = recode_values(mental_dis$Authority.Respect, "YES" ~ 0, "NO" ~ 1)
aggressive = recode_values(mental_dis$Aggressive.Response, "YES" ~ 1, "NO" ~ 0)

# "Difficult patient" variable on a scale from 0 (not difficult at all) to 3 (very difficult)
dif_pat = never_to_blame + disrespectful + aggressive

# Outliers are classified as very difficult patients (values of 3 on dif_pat)
Outlying = ifelse(dif_pat == 3, TRUE, FALSE)



#R7

# Print datatype of each column
for (col in colnames(mental_dis)) {
  if (col != "Sexual.Activity") {  # all rows except sexual activity
    print(class(mental_dis[[col]]))
  } else{  # skip sexual activity column
    print("Private information")
  }
}

# Print successfully assessed patients
for (row in 1:length(mental_dis$Patient.Number)) {
  if (!(mental_dis$Authority.Respect[row] == "NO" &&
        mental_dis$Aggressive.Response[row] == "YES")) {
    print(paste(
      as.character(mental_dis$Patient.Number[row]),
      "assessed successfully"
    ))
  } else {  # Disrespectful and aggressive patients
    print("Assessment postponed")
    break  # Exit loop immediately
  }
}



#R8

# Load library
library(ggplot2)

# Empty vector of people that survive
remaining = c()

# Loop until there are 1000 people left
while(length(remaining) < 1000) {
  CO2_footprint = rnorm(1, mean = 100, sd = 15)  # One person's CO2 footprint from population
  if (CO2_footprint <= 120) {
    remaining = c(remaining, CO2_footprint)  # Person remains if CO2 <= 120
  }
}

# Plot CO2 footprints of survivors
ggplot(data.frame(remaining = remaining), aes(remaining)) +
  geom_histogram() +
  labs(title = "1000 survivors") +
  xlab("co2_values") +
  ylab("count")



#R9

# Starting vector
weird_fibonacci = c(0, 3)

# Iterate 8 times: first element times 3 + second element
for (ind in 1:8) {
  new_number = weird_fibonacci[ind] * 3 + weird_fibonacci[(ind + 1)]
  weird_fibonacci = c(weird_fibonacci, new_number)
}


#R10

# Name of the game: 3 wins 4

# If at least 3 out of 4 die are smaller than 3, player wins 4€
# If round is lost, player loses 1€

# Seed for reproducibility
set.seed(123)

# Start with 1000€ budget
wallet = 1000

# Simulate 1000 rounds
for (game in 1:1000) {
  throw = sample(1:6, 4, replace = TRUE)
  winning_die = sum(throw < 3)
  if (winning_die >= 3){
    wallet = wallet + 4
  } else {
    wallet = wallet - 1
  }
}



#R11

these_numbers <- c(1, 3.1, 5.2, -1, 5.2)
maximum <- numeric()
for (i in 1:length(these_numbers) ) {
  if (sum(these_numbers > these_numbers[i]) == 0) {  # To access element: these_numbers[i]
    maximum <- c(maximum, these_numbers[i])
  }
}



#R12

# Tells time every half hour until 2040
while (Sys.Date() < as.Date("2040-01-01")) {  # Until 2040
  if (format(Sys.time(), "%M:%S") %in% c("30:00", "00:00")) {  # If half or full hour
    print(paste0("It is currently ", format(Sys.time(), "%H:%M:%S"), "."))  # Report time
  }
  Sys.sleep(1)  # Run loop every second, so that time only gets printed once!
}



#R13

# Rewriting function and loop with {} and indentations
verhulst <- function (x, rate_in, cap) {
  rate_in * x * (cap - x) / cap
}

rabbits <- c(.001)
rate <- 2
capacity <- 1000


for (time in 2:50) {
  rabbits[time] <- verhulst(rabbits[time - 1], rate, capacity)
}

plot(rabbits, type='l', xlab='time', bty='n')



#R14

# Empty array with correct dimensions
my_array = array(data = NA, dim = c(4, 50, 3))

# For each index in second dimension fill the 2D slices with norm. distr. values
for (i in 1:dim(my_array)[2]) {
  my_array[,i,] = rnorm((dim(my_array)[1] * dim(my_array)[3]), mean = i, sd = 1)
}



#R15

what_do <- switch(caught_fish,
                  large_trout = "eat",
                  small_trout = "return",
                  carp = ,
                  perch = "sell")
print(what_do)

# a) if caught_fish is "shoe", then what_do is NULL since there is no behaviour specified for "shoe"
# b) if caught_fish is either "carp" or "perch" or 4, what_do will be "sell"



#R16

mcfly <- function(my_list) {
  print("Great Scott! Erased from existence!")
  rm(list = my_list, pos = 1)
}
mcfly('mcfly')

# rm() removes the object from the global environment (specified with pos = 1)
# since my_list = "mcfly", mcfly("mcfly") removed the function from the global environment
# running the code again would give an error, since the function doesn't exist anymore



#R17

# List of t-tests
t_tests <- replicate(100, t.test(rbeta(10, shape1=2, shape2=2), mu=.5), simplify = FALSE)

# Vector with all 100 p-values
p_values = sapply(t_tests, function(test) test$p.value)



#R18

# Some function to find minimum
find_min = function(vec) {

  # Error: Wrong input
  if (!is.vector(vec)) {
    stop("Only vectors!")
  }

  # Find minimum
  minimum = vec[1]
  for (i in 1:length(vec)) {
    if (vec[i] < minimum) {
      minimum = vec[i]
    }
  }
  return(minimum)
}

# To enter debug mode, call debug() and pass the function as argument
debug(find_min)

# Call your function to enter debug mode
find_min(c(1, -4, 5, 6))
# In debug mode, you can run code line by line to see until which point the function works

# To exit debug mode, call undebug() and pass the function as argument
undebug(find_min)



#R19

assess_patient = function(week_ratings) {
  if (is.numeric(week_ratings) == FALSE) {
    warning("Input is not numeric!")
    week_ratings = as.numeric(week_ratings)
  }
  if (length(week_ratings) != 7) {
    stop("**error** Vector does not have seven elements!")
  }
  if ((sum(week_ratings) > 30 && (any(week_ratings > 3)))) {
    print("Patient is doing great!")
  } else if ((sum(week_ratings) > 30 || (any(week_ratings > 3)))) {
    print("Patient is not doing so great.")
  } else {
    print("Patient is doing awful!!")
  }
}



#R20

alert = function(sender, content) {

  # Define important words that warrant an alert
  imp_content = c("Emergency", "Urgent", "Planning")

  # Create vector with TRUE and FALSE values if important words are in message
  any_imp_content = c()
  for (i in 1:length(imp_content)) {
    any_imp_content = c(any_imp_content, grepl(imp_content[i], content, ignore.case = TRUE))
  }

  # If there is at least one important word in the message -> alert!
  if (any(any_imp_content == TRUE)) {
    return(TRUE)

  # Regardless of content, if the sender is Mother or Father -> alert!
  } else if (sender %in% c("Mother", "Father")) {
    return(TRUE)

  # Do not alert if none of the conditions are met
  } else {
    return(FALSE)
  }
}



#Radv1

# List of 5 letter words in English as vector
word_list = read.csv(
  file = url("https://www-cs-faculty.stanford.edu/~knuth/sgb-words.txt"),
  header = F)[[1]]

monkey_typing = function(word_list) {

  # Set up variables word and sequence of words
  word = ""
  word_seq = ""

  # Loop until a word is in the word list
  while (!(word %in% word_list)){

    # Take 5 random letters and merge them into a word
    letters_in_word = sample(letters, 5, replace = TRUE)
    for (i in 1:5) {
      word = paste0(word, letters_in_word[i])
    }

    # Copy that word to the sequence list
    word_seq = paste(word_seq, word)

    # If the word is not in the word list, empty variable word for new iteration
    if (!(word %in% word_list)) {
      word = ""
    }
  }

  # Count of the number of words until a "real" word is created
  number_words = length(strsplit(word_seq, " ")[[1]])

  # Return the "real" word and the number of words
  return(c(word, number_words))
}

# Collect 100 times how many words are needed until a "real" word is created
number_words = c()
for (i in 1:100) {
  number_words = c(number_words, as.numeric(monkey_typing(word_list)[2]))
}

# Mean amount of words needed
mean_num_words = mean(number_words)

# Plot the number of words in a histogram
hist(number_words,
     main = "Number of Words Until Real Word is Created",
     xlab = "Number of Words",
     ylab = "Frequency")

# Add vertical line for mean
abline(v = mean_num_words, col = "red", lwd = 2)



#Radv2

# Install package from my github repository
devtools::install_github("kristienpas/kristiensFunctions")

# Load package
library(kristiensFunctions)

# Examples for how functions work
initial_data_check(sleep)
row_col_sum_mean(sleep)

# View help files for functions
?initial_data_check
?row_col_sum_mean

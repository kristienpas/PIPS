# Class 2

# Working with vectors
ids = 1:6
stimulus_name = rep(c("gun", "spider"), 3)
spectrum = sample(x = 1:10, size = 6)
extr = abs(5.5 - spectrum)

extr2 = c(extr, NA)

threat_sens = rnorm(n = 6, mean = 0.5, sd = 0.1)
hist(threat_sens)
cor.test(threat_sens, extr)
length(threat_sens)

# How to deal with NAs
mean(extr2, na.rm = TRUE)

# Indexing
extr2[1:3]
extr2[-2] # exclude 2nd value

# Logical indexing
mean(extr[stimulus_name == "gun"])

# Paste
paste(ids, "_ID")

# Patterns
q1 = "I eat"
q2 = "We run"
q3 = "You eat"

# Search for patterns, get position
grep(pattern = "eat", c(q1, q2, q3))

# Get logical
grepl(pattern = "eat", c(q1, q2, q3))

# Substitute pattern for another
gsub("run", "fly", c(q1, q2, q3))

# Matrices and arrays
m = matrix(LETTERS[1:9], 3, 3)
m[1:2, c(T, T, F)] # Indexing

# Lists
name = "FnF"
cast = c("Walker, Rodriguez", "Diesel")
movie = list(title = name, cast = cast, imdb = 3)
str(movie) # Returns structure of list
thesis_result = cor.test(threat_sens, extr)
thesis_result[["statistic"]]    
movie[[2]]
movie[2]
thesis_result[["new"]] = list(nothing = 0)
thesis_result[["new"]]
movie[[2]]
thesis_result$p.value
thesis_result$new$nothing

# Data frames
df = data.frame(
  ids = as.character(ids),
  extr = extr,
  threat_sens = threat_sens)
df[1:3,c("ids", "extr")]

# Working directory
getwd()
# setwd()

sleep = sleep
# write.csv(sleep, file = "sleep.csv")
# sleep = read.csv("sleep.csv")
hist(sleep$extra)
t.test(sleep$extra[sleep$group == 1], sleep$extra[sleep$group == 2])

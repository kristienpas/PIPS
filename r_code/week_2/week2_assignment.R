## Week 2 assignment
#
# Kristien Paschold
#
# Deadline: 18-09-2026



# Set working directory
setwd(
  "C:/Users/Kristien/OneDrive - UvA/Documents/ResMas Psych/PiPS/PiPS Github/PIPS/r_code/week_2"
)



#R1

# Read in dataset
schiphol <- read.csv2(
  file = url(
    "https://raw.githubusercontent.com/hannesrosenbusch/PIPS_DATA/master/schiphol.csv"
  )
)

# Scatterplot of temp. by year at Schiphol
plot(schiphol$DATE, schiphol$TAVG, xlab = "Date", ylab = "Average Temp.")



#R2

# Load libraries
library(titanic)
library(ggplot2)

# Create plot of count of survivors by sex
survivors_by_sex = ggplot(
  data = titanic_train, 
  aes(fill = factor(Survived), x= Sex)) +
  geom_bar(stat = "count") +    # Bar plot
  scale_fill_discrete(  # Legend as in task
    name = "How did it go?", 
    labels = c("dead", "alive")
    ) +
  scale_x_discrete(name = "Sex") +  # x-axis label as in task
  scale_y_continuous(
    name = "count",  # y-axis label as in task
    breaks = c(0, 200, 400, 600))  # Line breaks as in task

# Show the final plot
print(survivors_by_sex)
  


#R3

# Trying out different themes:
survivors_by_sex +
  theme_dark()

survivors_by_sex + 
  theme_minimal()

survivors_by_sex + 
  theme_classic()

# My favourite is theme_minimal because it is light and shows the grid for orientation.



#R4

# Original plot + changes
plot(
  cars$speed,
  cars$dist,
  xlab = "Speed (mph)",  # Informative label for the x-axis
  ylab = "Stopping distance (ft)",  #  Informative label for the y-axis
  main = "Stopping Distance by Average Speed"   # Title
) 



#R5

# Compute max weight of the chicks in question and save it in new dataframe
max_weight = aggregate(weight ~ Chick,
                       data = ChickWeight,
                       max,
                       subset = Chick %in% c(1, 20, 5, 40, 19))

# Plot max_weight by chick
ggplot(data = max_weight, 
       aes(x = factor(  # Chick as factor to change order of chicks in plot
         Chick, 
         levels = c(1, 20, 5, 40, 19)),  # Specify order of chicks
         y = weight)) +
  geom_bar(stat = "identity") +  # Barplot
  scale_x_discrete(name = "chick") +  # Axis label as in task
  scale_y_continuous(
    name = "max_weight",  # Axis label as in task
    breaks = c(0, 100, 200, 300)  # Breaks as in task
    )



#R6

# Plot dist as function of speed
ggplot(data = cars, aes(x = speed, y = dist)) +
  geom_point() +  # Scatterplot
  geom_smooth() +  # Regression line
  
  # Ensure breaks are the same ones as in the task
  scale_x_continuous(breaks = c(5, 10, 15, 20, 25)) +
  scale_y_continuous(breaks = c(0, 40, 80, 120))



#R7

# Load library
library(ggstatsplot)

# Parametric test to see whether OJ or meds group has longer teeth
ggbetweenstats(ToothGrowth, supp, len)

# OJ group has longer teeth, but the difference is not significant 
# (Welch test, p = .06)



#R8

# Load library
library(plotly)

# Load in data set as a dataframe
body = read.csv2(
  file = url(
    "https://raw.githubusercontent.com/hannesrosenbusch/PIPS_DATA/master/body.csv"
  ),
  sep = ","
)

# 3D-plot of Height * Head Circumference * Shoulder to Waist Length
plot_ly(
  data = body,
  x =  ~ TotalHeight,
  y = ~ HeadCircumference,
  z = ~ ShoulderToWaist,
  mode = "markers",
  marker = list(opacity = 0.5)  # Change opacity of dots
)



#R9

# Load libraries
library(gganimate)
library(curl)  # apparently needed for cranlogs to work
library(cranlogs)
library(gifski)

# Dates from the last 30 days and daily downloads per day
downloads = cran_downloads(
  packages = c("ggplot2", "plotly"),
  from = "2013-09-15",
  to = "2025-09-15"
)

# Plot of downloads by dates
plot_downloads = ggplot(
  data = downloads_gganimate, 
  aes(x = date, y = count, colour = package)
  ) +
  geom_line() +
  labs(title = "Package popularity over time") +  # Title
  scale_y_continuous(  
    name = "Package Downloads",  # Axis label as in task
    breaks = c(0, 50000, 100000, 150000)  # Breaks as in task
    ) +
  theme_light() +  # Theme as in task
  transition_reveal(along = date)  # Reveal line in animation per date

# Animate pngs together
animate(plot_downloads, nframes = 50, fps = 10, renderer = gifski_renderer())

# Save as gif
anim_save("package_downloads.gif")



#R10

# Changed variable assignment in R1 from = to <-
# in R9 not all arguments for ggplot fit into one line, so one argument per line



#R11

a <- "dog"
b = "cat"
v = function(x){
  xx <- strsplit(x, "", )[[1]]
  yy <- strsplit(b, "", )[[1]]
  lxx = length(xx)
  lyy = length(yy)
  v <- lxx == lyy
  if(v) return(T)
}
v(a)

# The function v checks whether a string (in this case "dog", element a) has the same amount of characters as the string "cat" (element b), which in this case is true.

# No explanatory comments
# Variables are randomly named, not informative
# Inconsistent usage of style by mixing = and <- to assign variables
# No space before and after (v) in the if statement
# No space after (x) in the function argument



#R12

matrix(1:9, ncol = 3, nrow = 3, byrow = TRUE) * 1:3



#R13

# Cntrl + Shift + A



#R14

# Load libraries 
library(devtools)
library(memer)
library(tidyverse)

# You can post the meme anonymously :)

# American Chopper meme about error messages
meme_get("AmericanChopper") |>
  meme_text_chopper(
    "THAT'S IT I'M DONE",
    "IT'S JUST AN ERROR MESSAGE",
    "IT'S THE THIRD ONE IN A ROW I DON'T WANNA DO THIS ANYMORE",
    "YOU ARE ONLY MISSING A COMMA",
    "THEN THE ERROR MESSAGE SHOULD FLIPPIN' SAY SO"
  )



#Radv1

# Set seed for reducible art
set.seed(123)

# Dataset with randomized values
df = data.frame(
  x0 = runif(100),
  y0 = runif(100),
  x1 = runif(100),
  y1 = runif(100),
  shade = runif(100),
  width = runif(100, 0.5, 4)
)

# Art plot
art_plot = ggplot(df,
                  aes(  # Specifying layers (axes, colours, line width)
                    x = x0,
                    y = y0,
                    xend = x1,
                    yend = y1,
                    colour = shade,
                    linewidth = width
                  )) +
  geom_segment(  # Line segments instead of dots (overlapping) + remove legend
    show.legend = FALSE,
    lineend = "round",
    alpha = 0.6
  ) +
  coord_polar() +  # Swirl effect
  scale_colour_gradientn(colours = c(  # Specifying colours (shades of blue)
    "#0d1b2a",
    "#1b263b",
    "#415a77",
    "#778da9",
    "#e0e1dd"
  )) +
  scale_linewidth(range = c(0.3, 3)) +  # Differing line widths
  theme_void()  # Remove grid, labels, scales, etc.

# Save art as .png file in working directory
ggsave(
  "r_art.png",
  plot = art_plot,
  width = 6,
  height = 6,
  dpi = 150,
  bg = "#0d1b2a"  # Dark background colour
)

# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
# install.packages("nycflights13")
install.packages('nycflights13')
library(nycflights13)
library(dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)

# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights <- mutate(flights, gain = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, -gain)

# Try doing the last 2 steps in a single operation using the pipe operator
flights<- mutate(flights, gain = arr_delay - dep_delay) %>% arrange(-gain)

# Make a histogram of the amount of gain using the `hist` command
hist(flights$gain)

# On average, did flights gain or lose time?
mean(flights$gain, na.rm = T) #-5.66 LOSE

# Create a data.frame that is of flights headed to seatac ('SEA'), 
to.SEA <- filter(flights, dest == 'SEA')

# On average, did flights to seatac gain or loose time?
mean(to.SEA$gain, na.rm = T) #-11.70 LOSEs

### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see chapter 11 section on standard evaluation
OriginDestInterest <- function(my.origin, my.dest, column) {
  result  <- filter(flights, origin == my.origin, dest == my.dest) %>% select(column)
  return(result)
}

# Retireve the air_time column for flights from JFK to SEA
JFK.to.SEA <- OriginDestInterest('JFK', 'SEA', 'air_time')

# What was the average air time of those flights (in hours)?  
avg.air.time <- mean(JFK.to.SEA$air_time, na.rm = T)/60

# What was the min/max average air time for the JFK to SEA flights?
max.air.time <- max(JFK.to.SEA$air_time, na.rm = T)/60
min.air.time <- min(JFK.to.SEA$air_time, na.rm = T)/60
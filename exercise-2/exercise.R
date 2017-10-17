# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package

# Install (if you haven't already) and load the `dplyr`package
install.packages('dplyr')
library('dplyr')

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
cars.1997 <- filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
length(unique(select(cars.1997, year))) == 1

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.20 <- filter(vehicles, 
                       drive == '2-Wheel Drive', 
                       cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.hwy <- select(filter(two.wheel.20, hwy == min(hwy)), id)

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MostHwy <- function(year1, make1) {
  of.year.and.make <- filter(vehicles, 
                             year == year1, 
                             make == make1)
  return (filter(of.year.and.make, hwy == max(hwy)))
}


# What was the most efficient honda model of 1995?
most.hwy <- MostHwy(1995, 'Honda')


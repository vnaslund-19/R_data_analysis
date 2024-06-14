#####-----Title------####
# Introduction to R - Assignment 1


#####-----Q1------####
mtcars <- get(data("mtcars"))

car_countries <- c("Japan", "Japan", "Japan", "USA", "USA",
                   "USA", "USA", "Germany", "Germany", "Germany", "Germany",
                   "Germany", "Germany", "Germany", "USA",
                   "USA", "USA", "Italy", "Japan",
                   "Japan", "Japan", "USA", "USA",
                   "USA", "USA", "Italy", "Germany", "UK",
                   "USA", "Italy", "Italy", "Sweden")


mtcars$car_countries <- car_countries

average_mpg <- mean(mtcars$mpg)

# Initialize vectors for below_average and above_average
below_average <- c()
above_average <- c()

# Loop through the rows of the mtcars dataset
for (i in 1:nrow(mtcars))
{
  if (mtcars$mpg[i] < average_mpg)
    below_average <- c(below_average, rownames(mtcars)[i])
  else
    above_average <- c(above_average, rownames(mtcars)[i])
}


#####-----Q2------####

car_countries <- c("Japan", "Japan", "Japan", "USA", "USA",
"USA", "USA", "Germany", "Germany", "Germany", "Germany",
"Germany", "Germany", "Germany", "USA",
"USA", "USA", "Italy", "Japan",
"Japan", "Japan", "USA", "USA",
"USA", "USA", "Italy", "Germany", "UK",
"USA", "Italy", "Italy", "Sweden")

# We add car_countries variable as a column to the data set (mtcars)
mtcars$car_countries <- car_countries


USA_cars <- subset(mtcars, car_countries == "USA")
Japan_cars <- subset(mtcars, car_countries == "Japan")
  

#####-----Q3------####


mpg_per_cyl_USA <- mean(USA_cars$mpg / USA_cars$cyl)
mpg_per_cyl_Japan <- mean(Japan_cars$mpg / Japan_cars$cyl)

#####-----Q4------####


#install.packages('billboard') 

#You need to run the install only once.
# Comment it out by removing the #, then comment it out again 

library(billboard)
spotify_track_data <-  get(data("spotify_track_data"))

my_playlist <- subset(spotify_track_data, artist_name %in% c("Rihanna", "Michael Jackson", "Elvis Presley", "Eminem"))  

#####-----Q5------####

median_danceability_in_my_playlist <- median(my_playlist$danceability)

dance_tracks <- subset(my_playlist, danceability > median_danceability_in_my_playlist)


#####-----Q6------####


Rihanna_dance_tracks <- nrow(subset(dance_tracks, artist_name == "Rihanna")) / nrow(my_playlist)

#####-----Q7------####

# Note: Do not alter the original spotify_track_data dataset!
# You should alter only the corrected_playlist dataset.

corrected_playlist <- spotify_track_data

corrected_playlist$danceability[corrected_playlist$artist_name == "Michael Jackson"] <- 
  corrected_playlist$danceability[corrected_playlist$artist_name == "Michael Jackson"] - 0.05


# read the file into a data frame
food_df <- read.csv("Food.csv", header = TRUE)

# print the first few rows of the data frame to check if the data has been read properly
head(food_df)

#Check the dimensions 
dim(food_df)

#Print the names of all the columns
names(food_df)

# summary of the data frame
summary(food_df)

# Load the 'dplyr' package for data manipulation
library(dplyr)

# Rename the "Location.1" column to "LatLong"
food_df <- rename(food_df, LatLong = Location.1)

# Print the names of the columns in the data frame to confirm the renaming
names(food_df)

# Filter the rows that contain missing values in the "Location" column
missing_location <- food_df %>% 
  filter(is.na(Location))

# Print the number of rows that contain missing values in the "Location" column
nrow(missing_location)

# Load the 'tidyverse' library for data manipulation and visualization
library(tidyverse)

# Remove any rows that contain missing values
food_df <- food_df %>% 
  drop_na()

# Check the dimensions of the data frame
dim(food_df)

# Print the names of all the columns
names(food_df)

# Print a summary of the data frame
summary(food_df)

# Check the structure of the data frame
str(food_df)

# Load the 'tidyr' library for data manipulation
library(tidyr)

# Split the "Location" column into separate "Latitude" and "Longitude" columns
food_df <- separate(food_df, col = LatLong, into = c("Latitude", "Longitude"), sep = " ,")

# Check the structure of the data frame
str(food_df)

#Remove the "$" symbol from the "Price" column
food_df$Price <- gsub("\\$", "", food_df$Price)
food_df$Price <- as.numeric(food_df$Price)


# Create a histogram of the "Price" variable
ggplot(food_df, aes(x = Price)) +
  geom_histogram()

# Create a scatter plot of "Price" vs. "Mins"
ggplot(food_df, aes(x = Price, y = Mins)) +
  geom_point()



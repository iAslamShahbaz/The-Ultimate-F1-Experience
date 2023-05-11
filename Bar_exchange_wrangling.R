# load the readr package
library(readr)

# read the CSV file without column names and skip the first row
exchange_df <- read_csv("BarExchange.csv", col_names = FALSE, skip = 1)

# set the second row as the column headers
colnames(exchange_df) <- as.character(exchange_df[1,])

# remove the first row
exchange_df <- exchange_df[-1,]

head(exchange_df) # display the first 6 rows of the data frame
tail(exchange_df) # display the last 6 rows of the data frame

str(exchange_df) # display the structure of the data frame

dim(exchange_df)

summary(exchange_df)

# convert columns to numeric
exchange_df <- exchange_df %>%
  mutate(across(c('T', 'T+5mins','T+10mins','T+15mins', 'T+20mins'), as.numeric))

summary(exchange_df)

# count the number of missing values in each column of the data frame
colSums(is.na(exchange_df))

# Remove any rows that contain missing values
exchange_df <- exchange_df %>% 
  drop_na()

# count the number of missing values in each column of the data frame
colSums(is.na(exchange_df))

# create a boxplot of the data
boxplot(exchange_df)

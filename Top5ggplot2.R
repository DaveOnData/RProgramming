#============================================================================================================
#
# File: Top5ggplot2.R
#
# Description: R code for Dave Langer's YouTube video "Top 5 ggplot2 Data Visualizations."
#              YouTube video available at: https://youtu.be/KRsor3G8Gf4
#
#============================================================================================================

library(dplyr)
library(ggplot2)


# NOTE - Load up the "TitanicFeatures.csv" file before running the following code
# Set up factors
titanic_features <- TitanicFeatures %>%
  mutate(Survived = as.factor(Survived),
         Pclass = as.factor(Pclass),
         Sex = as.factor(Sex),
         Embarked = as.factor(Embarked),
         Title = as.factor(Title))



# Number 5 - Faceted proportion bar charts 
ggplot(titanic_features, aes(x = Title, fill = Survived)) +
  theme_bw() +
  facet_grid(~ Pclass) +
  geom_bar(position = "fill") +
  labs(x = "Passenger Title",
       y = "Passenger Count",
       title = "Proportion Bar Chart of Survived by Pclass and Title")



# Number 4 - Faceted and Color-coded scatter plots 
ggplot(titanic_features, aes(x = Age, y = Fare, color = Survived)) +
  theme_bw() +
  facet_grid(Sex ~ Pclass) +
  geom_point(position = "jitter", size = 2) +
  labs(x = "Passenger Age",
       y = "Passenger Fare",
       title = "Scatter Plot of Age & Fare, Color-coded by Survived, & Faceted by Sex & Pclass")



# Number 3 - Faceted and filled histrograms
ggplot(titanic_features, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_grid(Sex ~ Pclass) +
  geom_histogram(binwidth = 5) +
  labs(x = "Passenger Age",
       y = "Passenger Count",
       title = "Histogram of Age Filled By Survived, Faceted by Sex & Pclass")



# Number 2 - Faceted box plots 
ggplot(titanic_features, aes(x = Survived, y = Age)) +
  theme_bw() +
  facet_grid(Sex ~ Pclass) +
  geom_boxplot() +
  labs(x = "Survived",
       y = "Passenger Age",
       title = "Box Plot of Survived by Age, Faceted by Sex & Pclass")



# Number 1 - Faceted bar charts 
ggplot(titanic_features, aes(x = Title, fill = Survived)) +
  theme_bw() +
  facet_grid(~ Pclass) +
  geom_bar() +
  labs(x = "Passenger Title",
       y = "Passenger Count",
       title = "Bar Chart of Survival by Pclass and Title")


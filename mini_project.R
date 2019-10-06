# This data has information on several hundred passengers of the Titanic passenger ship that sunk in 1912
# the information includes survival status, their gender, their fare, their age, and which port they boarded the ship on (embark). There are other fields as well, but we'll focus only on these 5.

# Goal - to get an idea of how the columns interact with each other; in particular we'd like to know which columns are useful for predicting whether a passenger survived.

# 1. Import titanic.csv into your workspace
setwd("/home/lgutierr/Dropbox/SciProg/R2DA/Mini-Project/")
titanic_data = read_csv("titanic.csv")

# Once the data is imported, take a moment to look it over (hint; use View, head, or tail)
# Make sure you know the column names (hint; use colnames)
colnames(titanic_data)

# 2. Make a 2-dimensional table showing both survival status and gender
tb1 <- with(titanic_data,table(Survived,Sex))

# Comment on it; does being one gender seem to help your chance of survival?
# (Optional if you have time - run a chi-square test to see if the effect of gender is statistically significant)
chisq.test(tb1) 

# 3. Make a boxplot of age by survival status. 
# Make sure to properly label and title your plot.
# Does the plot show a clear relationship between passenger age and surviving?
boxplot(
  titanic_data$Age~titanic_data$Survived,
  main="Relationship between passenger age and survival",
  xlab="Surival status (0 = died, 1=survived)",
  ylab="Passenger age")

# 4. Make a boxplot of fare by survival status.
# Make sure to properly label and title your plot.
# Does the plot show a clear relationship between the cost of a ticket and surviving?
boxplot(
  titanic_data$Fare~titanic_data$Survived,
  main="Relationship between passenger fare and survival",
  xlab="Surival status (0 = died, 1=survived)",
  ylab="Passenger Fare"
)

# 5. Make a boxplot of fare by embark location.
# Make sure to properly label and title your plot.
# Does the plot show a clear relationship between the cost of a ticket and embark location?
boxplot(
  titanic_data$Fare~titanic_data$Embarked,
  main="Relationship between passenger fare and Embark liocation",
  xlab="Embark Location",
  ylab="Passenger Fare
  "
)

# 6. Run a logistic regression to predict survival status using fare, age, gender, and embark location. 
# Use the summary function to see if the coefficients are statistically significant
# Which coefficients are statistically significant? Are any of them not significant?

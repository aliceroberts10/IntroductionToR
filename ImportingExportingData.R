##### Importing and Exporting Data

# Recall how we created a data.frame

grades <- data.frame(
  average.hours.slept = c(8,7,9,7,8,9,6,5), 
  major = as.factor(c("Biology", "Biology", "Math", "Math", "Chemistry", "Chemistry", "Physics", "Physics")),
  gpa = c(4.0, 3.9, 3.8, 3.8, 3.9, 4.1, 4.2, 3.6)
)

# While this works, it's not practical to have to type everything in manually. What if our dataset has over 1000 rows!
# Thankfully R has functions that can read different data files into a data.frame for us so that we don't have to manually
#   type out all of the data. 

# We also have functions that can write out data, which is useful for when we want to move data from R to another computer or another program
# Let's test this now.

# One function we can use is called the write.csv function
# Make sure you set your working directory first to where you want to save the file.

# FORMAT: write.csv(data.frame.to.save, file="filename.csv", row.names=FALSE)
# We set row.names = FALSE because if it's TRUE then every CSV we write ends up with a blank starting column of 1 to the end row number.

# Let's first see for ourselves what we get if we don't specify row.names=FALSE
write.csv(grades, file="grades.csv")

# If the function correctly worked, there should be no output displayed on screen. Load up the created csv file by clicking on it in RStudio
#  and take a look; you should see something like this:

# "","average.hours.slept","major","gpa"
# "1",8,"Biology",4
# "2",7,"Biology",3.9
# "3",9,"Math",3.8
# ....

# The first line in the file denotes the header values; each one is separated by a comma to indicate a new column
# Each new line after the header represents a new row. We again separate columns by commas
# Since this file format uses commas to separate values, we say that this file has Comma Separated Values (CSV).
# In this file our first column is missing a name ("") and every row starts with a row number
# When we try to load up this CSV in other programs (R included) it will include these numbers as a new column with no meaningful name - annoying!

# Run write.csv again with row.names=FALSE
write.csv(grades, file="grades.csv", row.names=FALSE)

# It should now look like this:

# "average.hours.slept","major","gpa"
# 8,"Biology",4
# 7,"Biology",3.9
# 9,"Math",3.8
# 7,"Math",3.8
#  ....

# Much better! 

# Most programs can read CSV files, but sometimes we need to customize it a little bit. Another format often seen
# is very similar, but a tab or a space is used in place of commas.
# We can customize these different options by using the write.table() function (see help page for it)
write.table(grades, file="grades.tsv", row.names=FALSE, sep=" ")

# Again view the file that appeared.

# "average.hours.slept" "major" "gpa"
# 8 "Biology" 4
# 7 "Biology" 3.9
# 9 "Math" 3.8
# 7 "Math" 3.8
#  ....

# Spaces now separate different values instead of commas. Some programs are picky about the format, but R is flexible and can read all these variants.

# Let's remove grades from our Environment and import it back through the files we saved.
rm(grades)

# RStudio provides a useful user interface to help us import data - under Environment click Import Dataset, then click From Text (base).
# Select either grades.csv or grades.tsv and play with the Separator parameter; make sure you choose the one that produces multiple columns in the preview window
# grades <- read.csv("grades.tsv", sep=" ")

# Our data is back again! 
grades

# Some packages can help with loading other file formats. For example, we can also load up Excel files, or files from
# other software such as SAS or SPSS. These are just the ones that RStudio is ready to load up; you can usually find a package to
#   load any file format although the steps can vary greatly between file formats.
read.csv()

#### Sourcing Files

# Sometimes when a project gets complicated enough it's useful to split out different pieces of functionality into different scripts. These scripts can then be run in another script by 'sourcing' them.

# For an example; delete the 4 data files you created in the previous practice_with_exporting.R exercise. Make sure you don't delete bigGrades.csv!

# Now run this (you may have to adjust your working directory first):
source("practice_with_exporting.R")

# If the code you saved in that script worked you should have no error on your screen and those 4 data files should have reappeared! Now when the school gives you next year's grades you can trivially recreate those files for the departments.

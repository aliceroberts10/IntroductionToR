# Extra Useful Functions

#### Sorting

# Sometimes we'd like to sort data
# Here x is out of order
x <- c(1,6,8,3,1)

# There is a sort() function
sort(x) # ascending order by default
sort(x, decreasing=TRUE) # descending order can be specified

# Note that sort creates a new vector; if I look at x right now it's still out of order
x

# Now x will be sorted and replaced with the sorted version
x <- sort(x)
x

# sort() is useful when you're working with individual vectors, but how would you sort a data.frame? Replacing the 
# column with the sorted version would only sort that one column, not affecting the other columns, ruining the row by row 
# relationship each column has where every row is a set of measurements on a single observation.

# What we need is to reorder the indexes of the vector based on the sorting, and use those new indexes to sort the entire data.frame

# Remember the preferences data.frame from yesterday?
# Tester    Food        Tastiness
#
#  Joel     Apple           8
#  Joel     Chocolate       4
#  Joel     Bubblegum       7
#  Bob      Apple           3
#  Bob      Chocolate       10
#  Bob      Bubblegum       8 
#  Jane     Apple           6
#  Jane     Chocolate       6
#  Jane     Bubblegum       7

preferences <- data.frame(Tester=rep(c("Joel", "Bob", "Jane"), each=3),
                          Food=rep(c("Apple", "Chocolate", "Bubblegum"), times=3),
                          Tastiness=c(8,4,7,3,10,8,6,6,7))

# What if we'd like to order the entire data.frame according to Tastiness?
# We can use the order function

newOrder <- order(preferences$Tastiness)
newOrder
preferences$Tastiness[newOrder]

# We can reorder all of preferences using newOrder
preferences[newOrder,]

# Here we ordered it in ascending order; we can make it descending order too
newOrder <- order(preferences$Tastiness, decreasing = TRUE)
preferences[newOrder,]


#### Easier Subsetting

# In the exercise with data.frames one of the tasks was to access the rows where Bob was the tester
# The answer was: 
preferences[preferences$Tester=="Bob",]

# This worked, but the code is a little bulky; preferences shows up twice and if we had more conditions it's show up even more
# Enter the subset() function:

subset(preferences, Tester=="Bob")

# For the second parameter of subset, R knows that you're looking for columns in the preferences data.frame
# Thus we can skip saying "preferences$" in front of every column

# One important thing to note though is that with subset you can't modify values in the original dataset

# This won't work; subset only makes copies of datasets
subset(preferences, Tester=="Bob" & Food=="Apple")$Tastiness <- 3


#### Aggregating

# So far we've only looked at viewing and writing data, but we could use a program like Excel for that.
# What about actually summarizing data? What if we want to see the average Tastiness score for each Food item?
# We can use the aggregate function

aggregate(Tastiness ~ Food, preferences, mean)

# In the above code we use something called a formula; you'll see them often when writing linear models or in some plot commands
# The basic idea is that Tastiness is on the left side and is being explained by every variable on the right side
# If we had additional variables we wanted to also group by we could write "Tastiness ~ Food + OtherVariable"
# The second parameter has to be the data.frame so that R knows where to look for 'Tastiness' and 'Food'
# The third parameter is the function we want to apply to the Tastiness values in each group; in this case we want the mean

# aggregate() isn't actually used that much because it's kind of limited; we can only aggregate one response column at a time and 
#   one function at a time. 
# What if we wanted an aggregation where we wanted the minimum, maximum, and average Tastiness for each Food item in one response? 
#   aggregate() can't do that and we'd have to manually stich together the output of 3 calls to aggregate(); more advanced users use other
#   packages to help with this.
# One popular package for this is called "dplyr" and makes working with data.frames much easier; but unfortunately it can't be covered in
#   this workshop.


#### Conditions on Vectors (ifelse)

# Often we want to create a vector based on an existing one through some condition.
# For example, suppose we have the Tastiness values from before
preferences$Tastiness

# And we'd like a character vector saying "Yummy" if tastiness is >=8, and "Yucky" otherwise
# It's possible to create such a vector using the skills you've been seen, but it's messy.
# There's an easier way; just use the ifelse() function
# ifelse(condtiion, yes, no)

ifelse(preferences$Tastiness >= 8, "Yummy", "Yucky")

# We can then save this as a new column if we want to
preferences$Sound <- ifelse(preferences$Tastiness >= 8, "Yummy", "Yucky")
preferences

# What if we want to have 3 options? It gets a little messier, but we can put a second ifelse in the 'no' spot
preferences$Sound <- ifelse(preferences$Tastiness >= 8, "Yummy", ifelse(preferences$Tastiness < 5, "Yucky", "Meh"))
preferences

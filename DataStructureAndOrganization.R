# This script file introduces common data structures used all throughout R, and how to manipulate and work with them

######## Vectors

# In the previous module you were generally working with individual numbers
x <- 3
y <- 5
z <- x + y
z

# This is useful only if you want R as a simple calculator, but it's capable of so much more

# Here we assign several numbers into one vector
x <- c(1,3,5)
y <- c(7,3,-3)
z <- x + y
z

# z has the values 8, 6, 2
# 8 = 1 + 7
# 6 = 3 + 3
# 2 = 5 + -3

# Most operations like addition & subtraction are done pairwise, which means each number in the vector is added / subtracted / etc. to the corresponding number in the other vector

x + y # Addition; x added to y
x - y # Subtraction; y subtracted from x
x * y # Multiplication; x multiplied by y
x / y # Division; x dividied by y
x ^ y # Power; x to the power of y
x > y # is x greater than y?
x < y # is x less than y?
x == y # is x equal to y?

# Note that the length needs to match up. If they don't R tries to repeat the smaller vector
length.three.vector <- x
length.two.vector <- c(1,2)

length.three.vector + length.two.vector # effectively adds x to c(1,2,1); gives warning message since length 2 and 3 don't align up well

length.four.vector <- c(4,3,2,1)

length.four.vector + length.two.vector # will work; effectively adds length.four.vector to c(1,2,1,2)

# While this behaviour of R automatically extending vectors to try to fit others exists, it's bad practice
  # to rely on it because often bugs in our code can be introduced. It's also not clear to someone reading the code what you're trying to do.

# One one exception to this rule is when one of the vectors is an individual number
# i.e. 
x * c(3) # x * c(3,3,3)

# In this case it's clear what's going on
# Technically c(3) was redundant
x*3

# You've actually been already working with vectors
# Individual numbers in R are treated as a vector of length 1

# Just use the single number; R will expand it for you
x + 4
x - 4
x < 4
# etc..

# Often we want to extract particular values from a vector
longer.vector <- c(6,3,9,4,2,6,8)

longer.vector[3] # gives the third number in the vector; 9

# Can use a vector of indices to get several numbers back
longer.vector[c(1,3,5,7)] # give back the first, third, fifth, and seventh number

# Order doesn't matter with indexes, which means we could change the order
longer.vector[c(7,5,3,1)]

# We can repeat indexes to get a number back several times
longer.vector[c(1,1,2)]

# We now know how to use indexing to get back particular items in a vector; but what if we want to get back items that match a condition?

# Instead of providing indexes, we can provide another vector of TRUE/FALSE items. 
# If it's TRUE, it gives that item to us in the returned vector
# If it's FALSE, it doesn't give it us in the returned vector

# Note; TRUE and FALSE are case-sensitive; 'true' will give an error!
longer.vector[c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,TRUE)]

# Since it can accept a vector of TRUE/FALSE items, we can easily generate one for our condition
# Suppose we want only the elements that are greater than 5

# Long Way (just to make clear what's going on)
condition <- longer.vector > 5
condition
longer.vector[condition] # see that every number is greater than 5, as we required


# Short Way
longer.vector[longer.vector > 5]

# In R we can nest different operations and not create new variables



# In these examples above we only accessed the values, but we can easily change them. Just treat them like a variable!


# Let's change the first three values of longer.vector to 7
longer.vector # before
longer.vector[c(1,2,3)] <- 7
longer.vector # after


# Vectors are only one of several different data structures in R
# Vectors are one-dimensional and only support one basic data type at a time

vector.with.numbers <- c(1,2,3) # storing numbers
vector.with.text <- c("Bob", "Jill", "Carl") # storing text
vector.with.logicals <- c(TRUE, FALSE, TRUE) # storing logicals
vector.with.factors <- as.factor(c("Blue", "Blue", "Green")) # storing factors; will cover later. Just note that it's like text, but where the options are restricted to only specific options (here Blue and Green)

vector.with.numbers
vector.with.text
vector.with.logicals
vector.with.factors

# Operations involving vectors of different types won't work
vector.with.numbers - vector.with.text # This doesn't make sense. What does "1 - Bob" even mean?

# Similarily, vectors can't contain multiple data types together. R will try to convert the types to match
c(1,2,"Bob") # Contains three text items; there are no numbers in here

# Again, it's bad practice to rely on R automatically converting items. If you really want a vector of c("1", "2", "Bob") you should be explicit about it.

# Sometimes it's not clear what data-type a vector stores; there's a function called class() which can tell us
class(vector.with.numbers) # numeric
class(vector.with.text) # character
class(vector.with.logicals) # logical
class(vector.with.factors) # factor

# We also have some useful functions that can help identify and (try to) convert items
is.numeric(vector.with.numbers) # TRUE
is.numeric(vector.with.text) # FALSE

as.character(vector.with.numbers)
as.numeric(vector.with.text) # will fail; can't convert 'Bob' into a number
as.numeric(c("1", "2", "3")) # will work

# etc.

# With vectors, it's very very common we want something simple ranging from "a to b"; like a vector of the numbers 1 to 5
# Instead of writing c(1,2,3,4,5) we can just write 1:5

1:5 # c(1,2,3,4,5)
11:15 # c(11,12,13,14,15)

# Negative numbers can be slightly more tricky; we need to use parenthesis
(-3):3

# Can go backward too
5:1

# We can name the elements of a vector using the names() command; this affects what is displayed but it also gives us another option when using indexes!

grades <- c(95,80,97)
names(grades) <- c("Joel", "Bob", "Jane")
grades

# We can access Bob's grade easily by using his name
grades["Bob"]
grades[c("Bob", "Jane")] # can use a vector of names

# names() can also be used to show the current names
names(grades)



#### Useful functions for vectors


# length() gives us the length of the vector
length(longer.vector)
length(x)

# Some simple summary stats exists as well
mean(longer.vector)
median(longer.vector)
table(longer.vector)


# What if we want a simple vector that increments by something other than 1, 
# like, 2 to 20, but only every even number?
# Use the seq() function
seq(from=2, to=20, by=2)


# Sometimes we also just want to repeat a vector many times over. 
# Use the rep() function
rep(5, times=10)
rep(c(1,2), times=10)
rep(c(1,2), each=10)


######## Matrices


# Now you know vectors. What if you have data that's two-dimensional?
# Example - rows are students, columns are classes, values are grades

#        Math   Physics   Biology
#  Joel   95      92        76
#  Bob    80      81        84
#  Jane   97      93        92

# We can save this data into a matrix object. Matrices are just like vectors and obey the same rules, except they have a second dimension to them
# Like vectors they are restricted to a single data type

# We can create a matrix by using the matrix() function

# matrix() expects a vector inputted into it; there are two ways to add data into a new matrix

# 1. Input data as a large vector, columns first
grades <- matrix(data=c(95, 80, 97, 92, 81, 93, 76, 84, 92), nrow=3, ncol=3)
grades

# 2. Input data as a large vector, rows first
grades <- matrix(nrow=3, ncol=3, byrow = TRUE, data=c(
  95, 92, 76,
  80, 81, 84,
  97, 93, 92
))
grades

# We can perform similar operations with matrices as we did with vectors; they will be pairwise
other.grades <- matrix(nrow=3, ncol=3, byrow = TRUE, data=c(
  82, 96, 88,
  67, 81, 89,
  74, 53, 82
))

grades + other.grades # pairwise addition
grades - other.grades # pairwise subtraction
grades * other.grades # pairwise multiplication
grades / other.grades # pairwise division
# etc.

# But wait! You might have taken a linear algebra course before and know that matrix multiplication is not pairwise
# That's true - if you want to do actual matrix multiplication you can use the %*% operator
grades %*% other.grades


grades

# We can use indexing to get different sections of the matrix, like we did with vectors
# This time we need to specify both dimensions though

# Format:
# matrixName[rows, columns]

grades[1,2] # get the value in the first row, second column
grades[1:3,2] # get all the values in the second column
grades[1:2,2:3] # get the 'sub-matrix' for the lower right of the matrix

# Often we want all of one dimension; like we want the first two rows of all the columns
# In that case, leave that dimension blank in the indexing
grades[1:2, ] # first two rows; all columns
grades[,1] # all rows; first columns

# One thing; notice how if R can return a vector, such as with grades[,1], it does?
# This isn't always ideal; what if I want a matrix returned with 3 rows and 1 column?
# Include drop=FALSE as an additional last argument and R won't try turning it onto a vector for you
grades[, 1, drop=FALSE] # now we have a matrix returned to us

# Now that we know how to use indexes with matrices, we actually have a third way to define a matrix
# 3. Don't input data initially; do it in latter steps
grades <- matrix(nrow=3, ncol=3)
grades # currently blank

grades[1,] <- c(82, 96, 88)
grades
grades[2,] <- c(67, 81, 89)
grades
grades[3,] <- c(74, 53, 82)
grades # now it's filled



# Just like with vectors we can attach names to the dimensions of our matrix
# But we have to specify whether we are setting column names or row names

rownames(grades) <- c("Joel", "Bob", "Jane")
grades

colnames(grades) <- c("Math", "Physics", "Biology")
grades

# We can again index by using names

grades["Bob","Physics"] # get Bob's grade in Physics

# Just like with vectors, matrices can only hold data types of one type
matrix.with.text <- matrix(c("a", "b", "c", "d"), nrow=2, ncol=2)
matrix.with.text

# If we try putting a number in there it will change it to text
matrix.with.text[1,1] <- 1
matrix.with.text


#### Useful functions for Matrices


# A common operation with matrices is to flip the columns and rows; called taking the transpose of the matrix
two.courses <- grades[,1:2]
two.courses

# We use t() function to take transpose
t(two.courses)


# Often we want to know how many rows or columns are in a matrix
ncol(two.courses)
nrow(two.courses)
dim(two.courses)


######## Data Frames

# What if we have data that contains different types? Matrices and vectors are too limiting then, and it would be a pain 
# to keep different vectors & matrices for every data type we had

# Enter data frames - think of them as a table of data. Every row represents an observation, and every column is another data type.
# Tomorrow you'll learn how to import a data.frame from a CSV file, but today we'll just manually enter them

# Format: data.frame(columnA=valuesA, columnB=valuesB, ...)

grades <- data.frame(
   average.hours.slept = c(8,7,9,7,8,9,6,5), 
   major = as.factor(c("Biology", "Biology", "Math", "Math", "Chemistry", "Chemistry", "Physics", "Physics")),
   gpa = c(4.0, 3.9, 3.8, 3.8, 3.9, 4.1, 4.2, 3.6)
   )

grades

# Notice that the columns have different types and that each column has a name
# Like with matrices, we can access specific values using either the position or column name

# get the major of the first student
grades[1,2] 
grades[1,"major"]
grades$major[1]

# Here we saw three ways to access values; the last one is new. When we use the '$' symbol we are asking R to give us that column as a vector

grades$gpa

# We can rename columns if necessary. Usually with data.frames we just use the names() function like with vectors, but colnames works too

names(grades)
colnames(grades)
colnames(grades) <- c("HoursSlept", "Major", "GPA") # rename column names
grades

# We can easily add new columns too
grades$GPA.With.Bonus <- grades$GPA + 0.1
grades

# One thing to note; you probably noticed that when we looked at the major column we saw something called "Levels: Biology Chemistry Math Physics"
# This is because it's a factor, which means that it's like text but it can only contain values for those particular levels. 
# If we try to change a major to a type that isn't among the levels, it will fail
grades$Major[1] <- "Statistics" # note we use 'Major' now since we renamed the columns
grades

# It can be important to note the levels in a factor. The levels command lets us know (and lets us rename them)
levels(grades$Major)
levels(grades$Major) <- c("BIO", "CHEM", "MATH", "PHYS")
grades

# What if we really want to add STAT as a major?

# Two choices - 
# 1. Redefine the levels to include the new one
levels(grades$Major) <- c(levels(grades$Major), "STAT")
grades$Major[1] <- "STAT" # note we use 'Major' now since we renamed the columns
grades

# 2. Convert column to text, then convert it back (easier)
grades$Major <- as.character(grades$Major)
grades$Major[3] <- "CS"
grades # appears good; but it's technically character type
class(grades$Major)

grades$Major <- as.factor(grades$Major)
class(grades$Major)

# In practice; factors are a bother and many R users prefer to just use character wherever possible
# R will usually automatically treat character as a factor when relevant, so you aren't missing out by not using factor

#### Useful functions for Data Frames

# Sometimes data.frames are very large and is too large to practically view in the terminal. We have a few options then -
long.data.frame <- data.frame(x=1:1000,y=1001:2000,z=1000:1)

head(long.data.frame) # displays first 6 rows; useful when you just want to see a short sample of the dataset together
tail(long.data.frame) # displays last 6 rows

View(long.data.frame) # RStudio brings up an interface you can scroll through

# We also have ncol, nrow, and dim from matrix that apply here as well
ncol(long.data.frame)
nrow(long.data.frame)
dim(long.data.frame)


######## Lists


# Vectors and matrices restrict us only to one data type. Data frames relax that by letting each column be a different type; but Data frames are two dimensional like matrices. What if we want something flexible that can hold anything, in any shape?
# Enter Lists
# With lists you can either refer to items by their index (like with vectors) or by their name (like with data.frame's columns)

# Named list
backpack.info <- list(textbooks=c("Intro to Stats", "Intro to Bio"), laptop="ASUS", age=3)
backpack.info

# Notice that 'backpack.info' contains a vector of two character items, another character item, and a numeric item;
# Neither lengths nor types need to match

# We can use the $ notation we used with data.frames
backpack.info$textbooks

# Or we can use the index notation with vectors (slight difference though)
backpack.info[[1]] # note the double square brackets
backpack.info[["laptop"]]

# We can easily add or replace new items too
backpack.info$colour <- "Gray"
backpack.info

# Using the names() function we can get or change the names
names(backpack.info)

# We don't have to specify names for the items; we could just use use the indices

# Unnamed list
backpack.info <- list(c("Intro to Stats", "Intro to Bio"), "ASUS", 3)
backpack.info

names(backpack.info) # nothing to list

backpack.info[[4]] <- "Gray"
backpack.info

# Can still run
backpack.info$colour <- "Gray"
backpack.info

# We can have a mix of named and unnamed parameters
# In this case we have 'Gray' defined twice; how might we remove the first occurrence under [[4]]?
# Just need to set a NULL value for that spot; same applies to data.frames as well to delete columns
backpack.info[[4]] <- NULL
backpack.info

# Turning it into a named list
names(backpack.info) <- c("textbooks", "laptop", "age", "colour")
backpack.info


#### Useful functions for lists
# We can use length() like we did with vectors
length(backpack.info)


######## Arrays

# Arrays aren't used that often, but are useful when you want a matrix with more than two dimensions
testArray <- array(data=1:20, dim=c(5,2,2)) # creates an array of dimension 5, 2, and 2. 
testArray

testArray[1:3,,1] # subscript it for as many dimensions there are

# ncol and nrow lose their meaning for arrays of dimension more than 2; just use dim() at this point
dim(testArray)



######## NAs in Data

# A few times so far you might have seen an NA in the datasets when we did something wrong, like adding a new major that the factor didn't have a level for, or converting "Bob" into a number. NAs are generally stand ins for missing data, and depending on your problem you'll want to handle them differently

x <- c(1,6,3,NA,4)


# What is the mean of x?
mean(x)

# Mean isn't sure what to do with that NA value. Should it just remove it and compute the mean with the remaining values? What's right depends on why the NA is there; if the NA is there because we we measured something so big it went off our measurement scale, then ignoring the NA in the mean would give us a value too low. On the other hand, if it's just because we forgot to measure it, then it isn't a big deal.

# Removes NAs first
mean(x, na.rm=TRUE)

# NAs are contagious
y <- 1:5
x+y

# Although we know the fourth element of y, adding it to the NA in x generates a new NA

# Sometimes we want to detect NAs; maybe to replace it with something sensible
# Can use the is.na() command

is.na(x) # fourth element is TRUE
x[is.na(x)] <- 0 # easy way to replace NAs with 0 or some other value
x

x[4] <- NA
x
x[!is.na(x)] # x without any NA values. ` ! ` is an operator that turns TRUE into FALSE, and FALSE into TRUE

# To reemphasize; how you treat NAs depends on your problem. 
# DO NOT JUST REPLACE NAS WITH 0 IF THAT DOESN'T MAKE SENSE IN YOUR PROBLEM
# This was just an example of using is.na

# Some useful functions to know:
# na.omit() - removes NA values from vectors; deletes rows in data.frames where NAs occur
# anyNA() - returns TRUE if there's an NA anywhere in the vector; FALSE otherwise

# End of data structure and organization; next we'll cover importing & exporting data
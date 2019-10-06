
#### This script introduces how to write basic commands in R, R variables and objects, data types, and some common built-in functions in R ###

## R can perform simple math computations like a calculator

5+9
4*3
21/7
(8-3)^2

# Common arithmetic operators are +, -, *, /, ^
# Order of operations applies as usual

# In order to progress in R beyond using it as a calculator, we can assign values to variables known as objects

x <- 5

# To assign an object a value, use <- 
# The arrow can be read as 5 goes into x
# After this assignment, the object x contains the number 5
# We can see what an object contains by typing it into the console

x

# We can also see in the upper right window, the object x now appears, and it is shown to contain the value 5

y <- 10+5
z <- 13-4

# We can perform calculations on these objects rather than on raw numbers

y-z # 15-9
x*y # 5*15

# We can save these compuations into new objects so we can use them later

xy <- x*y

# You'll notice that if the computation is saved to another object, the result isn't printed on the console
# If the computation isn't saved, the result is printed

a <- y/x # not printed
y/x # printed


## Notes on naming objects
# - objects names are case sensitive

x

X #Error this object has not been defined, therefore R cannot find it

# - A syntactically valid name consists of letters, numbers and the dot or underscore characters 
# - Can start with a letter or the dot not followed by a number. Names such as  "2x" or ".2x" are not valid, but x2 or x.2 are
# - Names should be explicit but not too long
# - Shouldn't use words that are already defined in R, example print <- 14 should not be used because print() is already defined in R

num_students_workshop <- 11
num_facilitators <- 2
students_per_facilitator <- num_students_workshop/num_facilitators
students_per_facilitator


# One final note on the <- assignment operator
# Assigning x <- 5 does not mean that x equals 5 in the math sense, it means the object x contains the value 5
# We can reassign the value of the object x

x <- 10
x # Now x equals 10

# We can also use the value stored in the object x to create a new object also named x

x <- x + 2
x # Now x equals 12

# This doesn't make sense in math notation, but is perfectly fine to do in R


## Practice with Objects ##

# Create an object called my_age with a value of your age, create another object called months_per_year with a 
# value of the number of months in a year.
# Multiply these objects together to calculate your age in months (your age in months at your last birthday), 
# and save this to another object called my_age_months.
# Print the result
# Type answers in the space below, note you can use the enter/return key to create new lines







# Now reassign your my_age object to the age in years you'll be 3 years from now
# Recalculate your age in months using this new age, save the result in a new object called my_age_months_3
# Print the result











###


# The upper right window contains a list of all objects currently defined in your R environment
# To see a full read-out of all defined objects, use the command ls()

ls()

# To remove any of the objects in your environment, use the rm() command

rm("xy") #the gets rid of the object named xy

ls() #If we look at our defined objects again, xy is no longer there

# To save our workspace of objects, go to Session > Save Workspace As...
# This saves your workspace, note by default it saves it in your working directory
# This is useful if you've done a lot of computation and want to come back to your current R environment later

# To clear our entire workspace, us the command rm(list=ls())

rm(list=ls())

# We can reload the workspace by going to Session > Load Workspace...


###################################################

## Data Types


# So far we've only looked at using numbers (both integers and real numbers) 
# Real numbers are just one of 5 basic data types in R, also known as atomic data types or classes
# By atomic, we mean that each of these objects only hold a single type of data

## Numeric data type 
# Numbers themselves come in three different data types
# The default data type for numbers is the numeric data type (also known as doubles or floating point numbers)
# When we manually enter numbers in R, we are working with numeric data objects
# Can check the class, or data type, of a value or object using the class() command

class(2)

x <- 11.45
y <- 12 

class(x)
class(y) #note even if we assign an integer to an object, by default it is stored as a numeric type


## Integers
# Integers are a second numeric data type that only contains whole numbers
# can use the as.integer() command, or an L suffix to define an integer

a <- as.integer(-4)
b <- 24L
c <- -4

class(a)
class(b)
class(c)

class(a+b)

# In general, arithmetic operators like +, -, etc. take two numbers of the same data type, return one number of that same data type


## Complex numbers are the third data type involving numbers, we will not be looking into complex numbers in this workshop

z <- 2 + 3i
class(z)


## Characters
# Characters are a fourth data type, and the first we've seen not involving numbers
# Characters, or strings, are a sequence character text, denoted by quotation marks " "

"This is a string"
class("This is a string")

# If we don't include the text inside quotation marks, R will think we're trying to reference an object and give us an error

# Objects can store character data

my_name <- "Daniel"
my_name
class(my_name)


# This is also a character object

string_number <- "12"  #character, not a numeric or integer
class(string_number)


## Logicals
# The last data type we will look at are logicals
# A logical is a value that is either true or false
# TRUE and FALSE are values defined in R as logical data types, note these must be capitalized

class(TRUE)

d <- FALSE
class(d)


# Logical data types are often created when comparing values or objects using relational operators
# Relational operators in R are things like:
# > greater than
# < less than
# >= greater than or equal to
# <= less than or equal to
# == equal to
# != not equal to

5 > 3
-4 < -8

x <- 21

y <- 15
z <- x != y
z #we create a logical data type using the relational operator !=
class(z)


## We saw previously that arithmetic operators like +, -, *, and / take two atomic data values of the same type
#  and return a single data value of that type. These values can be given to operators as objects and the results
#  can also be stored as objects

x
y
class(x)
class(y)
z <- x*y  #the * operator takes two numeric data objects, produces a single numeric data object
class(z)

## Similar operators exist with logical data types, and these are called logical operators
#  These include the logical AND, and the logical OR
#  Like arithmetic operators, these operators take two logical data values as inputs, produce one logical as an output
#  The logical NOT is another logical operator that takes a single logical values as an input, produces an output

# The logical AND, denoted & in R, takes two logical values, produces the logical value TRUE if both inputs are TRUE
# produces FALSE if one or both of the inputs is FALSE

TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

# We can combine these logical operators with relational operators that produce logical values

x <- 4
y <- 6
z <- 8

x < y & y < z  # both these two relational operators produce a true logical data type, so the & produces TRUE
y < x & x < z  # The first of these two relational operators, y < x, produces a FALSE, so & produces FALSE


# The logical OR, denoted | in R, takes two logical values, produces the logical value TRUE if at least one of the inputs are TRUE
# produces FALSE if both of the inputs is FALSE

TRUE | TRUE
FALSE | TRUE
FALSE | FALSE

x < y | x == z  # produces TRUE since x < y is TRUE, even though x == z is FALSE


# The logical NOT, denoted ! in R, takes one logical value, produces TRUE if the value is FALSE, and FALSE if the value is TRUE

!TRUE

x
y

!x >= y


## Practice with Data Types ##

# Create three objects x, y, and z
# Assign x to be product of 5 and 4
# Assign y to be the sum of 5 and 5
# Assign z to be the difference between 40 and 15




# Test to see if x is greater than y, test to see if y and z are equal




# Multiply x and z together and save it as an object called xz. What is the class of this object?





# Create a new object int_a, that is an integer with value 20
# Create a new object int_b, that is an integer with value 8



# Add int_a and int_b together and save this as another object int_a_b. What is the class of this object?
# Divide int_a/int_b and save this as another object. What is the class of this object?



# Create objects called first_name and last_name, with first name containing a string of your first name,
# and last name containing a string of your last name.
# Print these objects




# Test to see whether x is less than y and also less than z
# Test to see whether int_a is less than x or int_b is less than x



###

# So far we've only looked at using arithmetic and relational operators on the same data types
# What happens if we try to add or multiply two different data types?

x <- 4L
y <- 5.5


class(x*y)

# R will try to change the data type of one of the objects so the data types of the two objects match
# In this case R changed the data type of x from an integer to a numeric, thus the class of the product was also numeric
# This is called coercion, and this is done by R so operations you give R will work

# Note that R is not capable of coercing all data types so that our operations work
# For example, arithmetic operators require two numbers be given to it, e.g. the + operator needs a number of some type on each side
# If we try to add a string using the + operator we get an error

"cat" + 1

# Also, R cannot coerce strings into numerics when using arithmetic operators

y <- "5.5"
class(y)
x*y  #this also doesn't work and gives us an error

# R gives us errors when computations cannot be completed



###################################################

## Functions in R

# Another key feature about programming in R are functions. 
# Functions are kind of like "canned scripts" that automate something for convenience 
# R has many built-in predefined functions that we can use 
# Functions usually get one or more inputs, called arguments, and often return a value
# We have already seen functions used during this workshop

#E.g. class() is a built-in function in r that takes one argument, and returns a character value corresponding to the class of the argument

class(x) #here x is our argument for the function class, and it returns a character value indicating the class of the argument x

# Built-in functions in R are usually called by their names, followed by brackets inside which you provide the function argument(s)

# Some common math functions used on numeric and integer objects are:
# sqrt(x) - takes a numeric/integer value as an argument x, returns the square root of that value
# abs(x) - the absolute value of x
# log(x) - takes the natural log of an arugment x
# exp(x) - takes e to the power of x

x <- 10
sqrt(x)
log(x)

# We can again save the results of a function in an object

y <- exp(x)
y

# Functions can take multiple arguments
# For example, the round() function allows us to round numeric values

z <- sqrt(x)
z
round(z)

# We can look at the arguments a function takes using another function, args(round)
# Or we can look at the help tab for that function using the help(round) function

args(round)
help(round)

# Based on the help page, we can see that the round function takes a numeric argument that the user must define
# Round also has an argument called "digits". We see from the help page that digits = 0. When an argument is 
# specified a value, this means that the argument has a default value set. If we don't specify our own value for 
# the digits argument, then round uses digits = 0 in its calculation and returns a number with 0 decimal places.
# Notice the x argument doesn't equal anything, thus we need to provide a value for x or the round() function will not run.

# If we want a different number of digits, we can specify the argument digits = 2
round(z, digits = 2)
z_rounded_3 <- round(z, digits = 3)
z_rounded_3


# In addition to functions for numeric objects, there are several built-in functions in R used to work with character strings

# For example, if we want to take certain characters out of a string

my_string <- "abcefg"
substring(my_string, first=2, last=4) # Takes 3 arguments, the string, the number position to start, and the number position to end

# We can also paste strings together

today <- "Monday"
paste("Today is", today, sep=" ") #the sep argument denotes the character string to seperate the 2 pasted strings
paste("Today is", today, sep=": ")
paste("Monday", "Tuesday", "Wednesday", "Thursday", sep=", ")



# Functions in R can also take multiple numbers in as an argument. Multiple numbers assigned to the same object, that object is a vector.
# We will see more details on vectors in Module 2

# For now, we can create a sequence of integers

num_seq <- 1:10 #this object now holds a sequence of integers: 1,2,3,4,5,6,7,8,9,10

# There are many built-in functions that will give us basic statistics on this sequence of numbers
# mean(x) - computes the mean of x
# median(x) - median
# var(x) - computes the variance of x
# sd(x) - the standard deviation
# summary(x) - computes summary statistics for x, including the minimum, maximum, mean, median, and 1st and 3rd quartiles

mean(num_seq)
num_seq_median <- median(num_seq)
num_seq_median
var(num_seq)
num_seq_sd <- sd(num_seq)
sqrt(var(num_seq)) == num_seq_sd #TRUE
summary(num_seq)



## Practice with Functions ##

# Create an object x that equals 100
# Calculate the natural log of x and the square root of x



# Look up the function log10 using the command help(log10). What does it do? What are all the arguments of the log() function?
# Calculate the base 10 log of x using the log10() function.
# Using the log function and the arguments specified in the help page, calculate the base 3 log of x.




# Create a sequence of integers from 1 to 50, save it to an object called num_seq_50
# Calculate the mean, median, and summary statistics for this sequence of numbers.




# Create an object called pi that equals 3.14159
# Look up the function signif using the command help(signif).
# Create a new object pi_rounded that equals 3.14 using the round function
# Create another object called pi_signif that also equals 3.14 using the signif function
# Test that these two objects are equivalent. 







##################################################################
















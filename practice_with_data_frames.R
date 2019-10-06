# Practice with Data.Frames

# Create a data.frame that looks like this

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

# Show only the rows where Bob was the tester (note that Tester is a column, not the row names)
# Show only the rows where the Food was 'Bubblegum'
# Show only the rows where the tastiness score was 7 or greater
# It turns out that Jane's name was mistyped; she's actually Janet! Change the levels on Tester so that 'Jane' becomes 'Janet'
# Calculate the mean (average) tastiness score

### Advanced
# Change Bob's Tastiness score for Apples from 3 to 2
#   Hint - ` & ` is an AND operator that requires both x and y to be TRUE for the result to be TRUE
#   Example: x <- c(TRUE,TRUE,FALSE); y <- c(TRUE,FALSE,FALSE)
#   x & y yields c(TRUE, FALSE, FALSE)
# We want the row where the Tester is Bob *and* the Food is Apple...
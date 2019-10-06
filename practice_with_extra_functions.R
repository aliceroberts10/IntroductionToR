# Practice with Sorting, Subsetting, Aggregation, and ifElse

# Load up the bigGrades.csv dataset

# Use the subset command to restrict the dataset to first year courses only (YearLevel==1)

# On the reduced dataset, use the ifelse command to create a new column called LetterGrade. Suppose the following scale is used:
  # A - GradePercent >= 85
  # B - GradePercent >= 70 & GradePercent < 85
  # C - GradePercent >= 50 & GradePercent < 70
  # F - GradePercent < 50

# On the reduced dataset, use the aggregate function to calculate the average GradePercent for every CourseField. 
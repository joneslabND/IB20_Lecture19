# This code is a companion to "Lecture 19 - Interacting with data using R"
# October 12, 2020

# Go to the Sakaii page for today's class and download two files:
# the "test.dat" file AND "wages.csv" file

# Save the file to your computer - any location will work

# Set your working directory to that location
setwd("/Users/samantharumschlag/Documents/IntroductionBiocomputing/BiocomputingDocs4Samantha/Rstructures_manipulatingdata")

# Load a simple data table using read.table()
data=read.table(file="test.dat",header=FALSE,sep=" ") 
data

# In the Patient Data exercise, we saw how we can use square brackets [] to 
#index or subset data. We can also use results of logic tests to index our data. 
#This can be really useful when we have a large dataset that we want to access a 
#subset of based on characterstics of the data itself.

# We can test for equality using double equal signs
# Which numbers in the first column of my dataset equal 1? 
# == is a logical operator that compares if two things are equal
data[,1]==1

# We can also test for greater than or less than as well
# Describe what this statement is doing in words.
data[,1]>2

# The logical values returned by a logic test can be used 
# just like numbers to index a matrix

# For instance, we can return row values that match the 
# logic test used above

# Return the rows for "data" that have values in the first
# column that are greater than 2
data[data[,1]>2,]

# Remember, dataframes hold mode than one data mode 
# (e.g. numbers and characters), like wages.csv from last week

# Load wages.csv
# Remember: "stringsAsFactors" argument prevents strings from 
# being treated as factors
wages=read.csv(file="wages.csv", header=TRUE, stringsAsFactors=FALSE) 
class(wages)
dim(wages)
head(wages)

# We can use square brackets to index a portion of a dataframe, 
# but we can also use something called dollarsign notation. 
# This is because a dataframe also behaves like a list in R.

# We can extract all of the female wage data using square brackets
# Return the rows for "wages" that have "female" in the first column
# Assign those values to the variable "females"
females=wages[wages[,1]=="female", ] 
# Return the dimensions of "females"
dim(females)
# Return the unique values in the first column of "females"
unique(females[,1]) 

# Alternatively, we can call the first column using "$"

# Return the rows for "wages" that have "female" in the
# column titled "gender" 
# Assign those values to the variable "females2"
females2 = wages[wages$gender == "female", ]
dim(females2) 
unique(females2$gender)

# Alternatively, some R users use subset() to access portions of data

# Return observations in "wages" for which the "gender" column
# is "fmeale"
females3 = subset(x = wages, wages$gender == "female") 
dim(females3)
unique(females$gender)

# This is a comment
a = 4 # single statement
a=4;b=3;c=b #multiplestatements
a = 3.2
a = "string"
a=4
print(a)
## [1] 4
a # same thing
## [1] 4
cat(a) # same thing
## 4
# cat can print multiple variables one after the other
cat("The value of the variable a is: ", a)
## The value of the variable a is:  4


#example(X) shows an example of the use of the function X

#The function help.start(X) starts an html-based documentation
#within a browser, which is sometimes easier to navigate.

#Searching the help documentation using help.search(X) is useful
#if you cannot recall the precise string on which you want to seek help.

x=3 #assign value 3 to variable x
y = 3*x + 2 # basic variable assignment and arithmetic
ratio.of.x.and.y = x / y # divide x by y and assign result
ls() # list variable names in workspace memory
ls(all.names = TRUE) # list all variables including hidden ones
ls.str() # print annotated list of variable names
save.image(file = "fname") # save all variables to a file
save(x, y, file = "fname") # save specified variables
rm(x, y) # clear variables x and y from memory
rm(list = ls()) # clear all variables in workspace memory
load(varFile) # load variables from file back to the workspace
history(15) # display 15 most recent commands


# change directory to home directory
setwd(" ̃")
# display all files in current directory
dir(path = ".", all.files = TRUE)
# execute bash command ls -al (in Linux)
system("ls -al")


# install package ggplot2
install.packages("ggplot2")
# install package from a particular mirror site
install.packages("ggplot2", repos="http://cran.r-project.org")
# install a package from source, rather than binary
install.packages("ggplot2", type = "source")
library('ggplot2')  # bring package into scope
# display all datasets in the package ggplot2
data(package = 'ggplot2')
installed.packages()  # display a list of installed packages
update.packages()  # update currently installed packages

pi
## [1] 3.141593
pi = 3  # redefines variable pi
pi  # .GlobalEnv match
## [1] 3
rm(pi)  # removes masking variables
pi
## [1] 3.141593


#The function sink(outputFile) records the output to the file
#outputFile instead of the display, which is useful for creating
#a log-file for later examination. To print the output both to
#screen and to a file, use the following variation.
sink(file = 'outputFile', split = TRUE)


#We have concentrated thus far on executing R code interactively.
#To execute R code written in a text file foo.R
#(.R is the conventional filename extension for R code) use either:
source("foo.R") #the R Function
R CMD BATCH foo.R #the command from a Linux or Mac terminal, or 
Rscript foo.R #the command from a linux or R terminal.

#It is also possible to save the R code as a shell script file
#whose first line corresponds to the location of the Rscript
#executable program, which in most cases is the following line.
!/usr/bin/Rscript

a=3.2;b=3 #doubletypes
b
## [1] 3
typeof(b) # function returns type of object ## [1] "double"
c = as.integer(b)  # cast to integer type
c
## [1] 3
typeof(c)
## [1] "integer"
c = 3L # alternative to casting: L specifies integer d = TRUE
d
## [1] TRUE
e = as.numeric(d) # casting to numeric
e
## [1] 1
f = "this is a string" # string
f
## [1] "this is a string"
ls.str() # show variables and their types
##a: num3.2
##b: num3
##c: int3
##d: logiTRUE
##e: num1
## f : chr "this is a string"




current.season = factor("summer",
                        levels = c("summer", "fall", "winter", "spring"),
                        ordered = TRUE)  # ordered factor

current.season
## [1] summer
## 4 Levels: summer < fall < ... < spring
levels(current.season)  # display factor levels
## [1] "summer" "fall"   "winter" "spring"
my.eye.color = factor("brown", levels = c("brown", "blue", "green"),
                      ordered = FALSE)  # unordered factor
my.eye.color

example(factor)
?factor

#The value NA (meaning Not Available) denotes missing values
#Many functions feature the argument na.rm which, if TRUE, operates
#on the data after removing any NA values.


#Vectors, arrays, lists, and dataframes are collections that hold
#multiple scalar values4. A vector is a one-dimensional ordered
#collection of variables of the same type. An array is a
#multidimensional generalization of vectors of which a matrix is
#a two-dimensional special case. Lists are ordered collections
#of variables of potentially di↵erent types. The list signature 
#is the ordered list of variable types in the list. A dataframe
#is an ordered collection of lists having identical same signature.


#To refer to specific array elements use integers inside square
#brackets. For exampleA[3]referstothethirdelementandA[c(1, 2)]
#referstothefirsttwo elements. Negative integers inside the
#square bracket corresponds to a selection of all elements
#except for the specified positions, for example A[-3] refers
#to all elements but the third one. It is also possible to
#refer to array elements by passing a vector of boolean
#values with the selected elements corresponding to the
#TRUE values. For example A[c(TRUE, TRUE, FALSE)] corresponds
#to the third element. If the boolean vector is shorter than
#the array length it will be recycled to be of the same length.


# c() concatenates arguments to create a vector
x=c(4, 3, 3, 4, 3, 1)
x
## [1] 4 3 3 4 3 1
length(x)
## [1] 6
2*x+1  # element-wise arithmetic
## [1] 9 7 7 9 7 3
# Boolean vector (default is FALSE)
y = vector(mode = "logical", length = 4)
y
## [1] FALSE FALSE FALSE FALSE
# numeric vector (default is 0)
z = vector(length = 3, mode = "numeric")
z
## [1] 0 0 0

q = rep(3.2, times = 10) # repeat value multiple times
q
##  [1] 3.2 3.2 3.2 3.2 3.2 3.2 3.2 3.2 3.2 3.2
w=seq(0, 1, by = 0.1)  # values in [0,1] in 0.1 increments
w
##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9
## [11] 1.0
# 11 evenly spaced numbers between 0 and 1
w=seq(0, 1, length.out = 11)
w
##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9
## [11] 1.0
# create an array with TRUE/FALSE reflecting whether condition holds
w <= 0.5
##  [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
##  [7] FALSE FALSE FALSE FALSE FALSE
any(w <= 0.5)  # is it true for some elements?
## [1] TRUE
all(w <= 0.5)  # is it true for all elements?
## [1] FALSE
which(w <= 0.5)  # for which elements is it true?
## [1] 1 2 3 4 5 6
w[w <= 0.5]  # extracting from w entries for which w<=0.5
## [1] 0.0 0.1 0.2 0.3 0.4 0.5
subset(w, w <= 0.5)  # an alternative with the subset function
## [1] 0.0 0.1 0.2 0.3 0.4 0.5
w[w <= 0.5] = 0  # zero out all components smaller or equal to 0.5
w
##  [1] 0.0 0.0 0.0 0.0 0.0 0.0 0.6 0.7 0.8 0.9
## [11] 1.0









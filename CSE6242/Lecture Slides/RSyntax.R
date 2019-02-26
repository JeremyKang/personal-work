#This file illustrates some basics of R.  

#Please read the code and the comments, then experiment with the code to test 
#any points that remain unclear.  When you  finished experimenting, remove any
#code that generates errors and click submit.


#R does not have strong typing
a = 3.2
a = "a string"

#A newline or semicolon mark the end of a statement
print("The variable 'a' stores:"); print(a)

#stopifnot can be used like an assert statement
stopifnot(a == "a string");
stopifnot(TRUE || FALSE)
stopifnot(!(TRUE && FALSE))

#If-else statements are similar to the conventions of C/C++, Java, javascript,
a = 10; b = 5; c = 1
if (a < b){
  d = 1
}else if (a == b){ #having the } and the else on the same line is essential.
  d = 2
}else{
  d = 3
}
d
stopifnot(d==3)

#So do while loops
sum = 0
i = 1
while(i <= 10){
  sum = sum + i
  i = i + 1
}
stopifnot(sum==55)

#Functions are first-class objects, as reflected in the syntax
mySum = function(a,b){
  return(a + b)
}
stopifnot(mySum(2,2) == 4)

#R supports named parameters and default values
myPower = function(bas = 10, pow = 4){
  return(bas^pow)
}
stopifnot(myPower(2,3) == 8)
stopifnot(myPower(pow = 3, bas = 10) == 1000)
stopifnot(myPower(bas = 2) == 16)




#This file illustrates the basic usage of vectors in R

#Please read the code and the comments, then experiment with the code to test 
#any points that remain unclear.  When you are finished experimenting, **********remove/fix******** any
#code that generates errors and click submit.

#The simplest container in R is the vector.
x = vector(length=3, mode="numeric")

#The c function concatenates its arguments into a vector.
y = c(4,3,3)

#The default value for the numeric mode is zero
stopifnot( x == c(0,0,0))

#The length function gives the length of a vector
stopifnot(length(y) == 3)

#Individual elements can be accessed using 1-based indexing
x[1] = 2
x[3] = 1
stopifnot( x == c(2,0,1) )

#Standard arithmetic operators can used for vectors
a = 2*x + y
stopifnot( a == c(8, 3, 5) )

a = a - 1
stopifnot( a == c(7,2,4) )

#Boolean-valued operators produce logical vectors
stopifnot( (a>=7) == c(TRUE,FALSE,FALSE))
stopifnot( (a==2) == c(FALSE,TRUE,FALSE))

#Logical vectors and vectors of indices can used to select 
#a subset of entries in a vector
mask = c(TRUE,FALSE,TRUE)
stopifnot( a[mask] == c(7, 4))

indices = c(1,3)
stopifnot( a[indices] == c(7,4))

#Negative indices cause elements to be excluded
stopifnot( a[c(-1,-3)] == c(2) )

#The any, all, and which methods have the intuitive meanings when applied
#to logical vectors
stopifnot( any(c(FALSE,TRUE,FALSE)) )
stopifnot( all(c(TRUE,TRUE,TRUE)) )
stopifnot( which(c(TRUE,FALSE,TRUE)) == c(1,3) )

#Various helper methods for initializing vectors are available
b = rep(3.2, times=5)
stopifnot( b == c(3.2, 3.2, 3.2, 3.2, 3.2))

w = seq(0,3)
stopifnot(w == c(0,1,2,3))

x = seq(0,1,by=0.2)
stopifnot( x == c(0.0, 0.2, 0.4, x[4], 0.8, 1.0))

y = seq(0,1)
stopifnot( y == c(0.0, 1.0) )

z = 1:10
stopifnot(z == seq(1,10,by=1))

#for each loops can loop over the elements of a vector
sum = 0
for(i in z){
  sum = sum + i
}
stopifnot(sum == 55)

#Vectors are passed by value
x = 1:10
f = function(a){
  a[1] = 10
}
x[1] = 10
f(x)
class(x[1])
x
stopifnot(x == 1:10)



#This file illustrates the usage of multidimensional arrays in R
#Please read the code and the comments, then experiment with the code to test 
#any points that remain unclear.  When you  finished experimenting, *******remove/fix******** any
#code that generates errors and click submit.

#Arrays are the multidimensinal generalization of vectors.
x = array(data = 1:6, dim = c(2,3))

#R uses column-major format
print(x)
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

#Single indices can be used into multidimentional arrays.
#Left indices are less significant.
stopifnot( x[1] == x[1,1] )
stopifnot( x[2] == x[2,1] )
stopifnot( x[3] == x[1,2] )
stopifnot( x[4] == x[2,2] )
stopifnot( x[5] == x[1,3] )
stopifnot( x[6] == x[2,3] )

#Index and logical selection can be used to select subarrays
subx = x[c(1,2),c(TRUE,TRUE,FALSE)]
stopifnot(subx == array(data = 1:4, dim = c(2,2)))

#Refer to an entire row or column by not specifiying anything
row1 = x[1,]
stopifnot( row1 == c(1,3,5) )
col3 = x[,3]
stopifnot( col3 == c(5,6) )

#* is for element-by-element multiplication
x2 = x * x
stopifnot( x2[1,1] == x[1,1]*x[1,1] )
stopifnot( x2[2,1] == x[2,1]*x[2,1] )
stopifnot( x2[1,2] == x[1,2]*x[1,2] )
stopifnot( x2[2,2] == x[2,2]*x[2,2] )
stopifnot( x2[1,3] == x[1,3]*x[1,3] )
stopifnot( x2[2,3] == x[2,3]*x[2,3] )

#t is for transpose
xt = t(x)
stopifnot(x[1,3] == xt[3,1])
stopifnot(x[1,2] == xt[2,1])

#%*% is for matrix multiplication
M = x %*% xt
stopifnot( M == array(data=c(35,44,44,56), dim=c(2,2)) )

#%*% will also take the inner product of vectors
stopifnot( c(1,1,1) %*% x[1,] == 1 + 3 + 5 )

#Matrices can also be formed by outer product
M = outer(c(1,2), c(1,2,3))
print(M)
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    6   10

#Matrices can also be stacked rowwise
rbind(x,x)
print(M)
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6
# [3,]    1    3    5
# [4,]    2    4    6

#Or they can be concatenated columnwise
cbind(x,x)
print(M)
#      [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    3    5    1    3    5
# [2,]    2    4    6    2    4    6


#This file illustrates the basic usage of lists in R

#Please read the code and the comments, then experiment with the code to test 
#any points that remain unclear.  When you  finished experimenting,
#********remove/fix any********
#code that generates errors and click submit.

#A list is a powerful container that has the capabilities of several
#more classical containers.

#Unlike vectors it can contain elements of different types
x = list("Isaac", "Newton", 1643L, 1727L)

#To select a single element, use the [[]] operator
stopifnot(typeof(x[[1]]) == "character")
stopifnot( x[[1]] == "Isaac")

#The operator [] returns a list even when a single element is selected.
print(x[1])
# [[1]]
# [1] "Isaac"
stopifnot( typeof(x[1]) == "list" )
stopifnot( as.character(x[1]) == as.character(list("Isaac")))

#Positions are often named like so
x = list(first_name = "Isaac", last_name = "Newton", birth_year = 1643L, death_year = 1727L)

#The names function returns the names of the fields as a vector
stopifnot( names(x) == c('first_name', 'last_name', 'birth_year', 'death_year'))

#With named positions, lists behave like dictionaries (a.k.a symbol tables)
stopifnot( x[['first_name']] == "Isaac")

print(x['first_name'])
# $last_name
# [1] "Newton"
stopifnot( as.character(x['last_name']) == as.character(list(last_name = "Newton")))

years = c("birth_year", "death_year")
print(x[years])
# $birth_year
# [1] 1643

# $death_year
# [1] 1727
stopifnot( as.character(x[years]) == as.character(list(birth_year = 1643L, death_year = 1727L)) )

#for each loops can loop over the elements of a list
acc = c()
for(i in x){
  acc = c(acc,as.character(i))
}
stopifnot(acc == c("Isaac", "Newton", "1643", "1727"))



#This file illustrates the basic usage of dataframes in R

#Please read the code and the comments, then experiment with the code to test 
#any points that remain unclear.  When you  finished experimenting,

#*****remove/fix any*****
#code that generates errors and click submit.
#A dataframe is an ordered sequence of lists all having the same length and 
#field names.  It is akin to a spreadsheet.

#Typically dataframes are read in from files. E.g.
#df = read.table("foo.csv", header = TRUE)
#but for this example we'll use mtcars
#a built-in dataframe useful for tutorials
#See help(mtcars) for details

#You can preview the first few rows with the head command
print( head(mtcars) )
#                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
# Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

#nrow and ncol give the number of rows and columns respectively
stopifnot( ncol(mtcars) == 11 )
stopifnot( nrow(mtcars) == 32 )

#names gives the names of the fields
stopifnot( names(mtcars) == c("mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb"))

#row.names gives the names of the rows
stopifnot( row.names(mtcars)[1:3] == c("Mazda RX4", "Mazda RX4 Wag", "Datsun 710") )

#The [[]] operator with a field name returns the vector of values in that column
cyl = mtcars[[2]] 
stopifnot( cyl[[1]] == 6 ) #cyl is a vector whose first value is 6

mpg = mtcars[['mpg']]
stopifnot( mpg[[1]] == 21.0 ) #mpg is a vector whose first value is 21.0

#The [] operator with a single argument returns a column slice, i.e. a new dataframe 
#that only includes the selected columns.
hp_df = mtcars[4]
stopifnot( names(hp_df ) == 'hp')

mpg_df = mtcars['mpg']
stopifnot( names(mpg_df ) == 'mpg')

df = mtcars[c('mpg', 'disp')]
stopifnot( names(df) == c('mpg', 'disp') )

#With two scalar arguments, the [] operator can select a single element in the dataframe
#The first argument selects the row, the second the column
stopifnot( mtcars[1,3] == 160 )
stopifnot( mtcars[1,"disp"] == 160 )
stopifnot( mtcars["Mazda RX4", "disp"] == 160 )

#If the first argument is an index vector (a list of substricts, fieldnames, 
#or logical indexes) and the second is not, then a vector is returned.
stopifnot( mtcars[1:3,'mpg'] == c(21.0, 21.0, 22.8) )

#If the second argument is a vector (a list of substricts, fieldnames, or logical indexes)
#arguments, then [] again returns a dataframe with the selected rows.
print( mtcars["Mazda RX4", c("gear", "carb")] )
#           gear carb
# Mazda RX4    4    4

print( mtcars[1:2, c("gear", "carb")] )
#               gear carb
# Mazda RX4        4    4
# Mazda RX4 Wag    4    4

#If the second argument is omitted, all fieldnames are included.
print( mtcars["Mazda RX4", ] )
#           mpg cyl disp  hp drat   wt  qsec vs am gear carb
# Mazda RX4  21   6  160 110  3.9 2.62 16.46  0  1    4    4


#Logical indexing can be a powerful tool for extracting subsets of data.
print( mtcars[mtcars['hp'] >= 300,] )
#               mpg cyl disp  hp drat   wt qsec vs am gear carb
# Maserati Bora  15   8  301 335 3.54 3.57 14.6  0  1    5    8

#For more complex logic, the subset function is more elegant.
print( subset(mtcars, hp >= 160 & mpg >= 18) )
#                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
# Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
# Pontiac Firebird  19.2   8  400 175 3.08 3.845 17.05  0  0    3    2
# Ferrari Dino      19.7   6  145 175 3.62 2.770 15.50  0  1    5    6


#Implement functions below avoiding the use of for loops wherever possible.
#Please read the code and the comments, then experiment with the code to test 
#any points that remain unclear.  When you  finished experimenting, 
#************remove/fix any****************
#code that generates errors and click submit.

#In each case, you should assume that the dataframe argument has the same 
#fields as the mtcars data set that comes with R.

#Note: On submit, your code will be tested on a dataframe with same format
#but different data from mtcars.

#Returns a scalar value equal to the mean mpg rating in the dataframe
meanMPG = function(df){
  avg = mean(df[,'mpg'])
  return(avg)
}
df = meanMPG(mtcars)
stopifnot(abs(df - 20.09) < 0.1)

#Returns a new dataframe that includes a new column, one that gives the
#power-ratio, i.e. hp/wt.
includePR = function(df){
  pr = df[,'hp']/df[,'wt']
  df <- data.frame('pr' = c(pr), df)
  return(df)
}
df = includePR(mtcars)
stopifnot(df["Maserati Bora","pr"] == df["Maserati Bora","hp"] / df["Maserati Bora", "wt"])

#Returns a vector of the names of the cars that have a value of qsec at most
#max_qsec and a mpg rating of at least min_mpg
fastButEfficient = function(df, max_qsec, min_mpg){
  return(row.names(subset(df, qsec <= max_qsec & mpg >= min_mpg)))
}
stopifnot(sort(fastButEfficient(mtcars, 16, 15)) == sort(c("Ford Pantera L", "Ferrari Dino", "Maserati Bora")))



#Please read the code and the comments, then experiment with the code to test 
#any points that remain unclear.   When you  finished experimenting, 
#*****remove/fix any*******
#code that generates errors and click submit.

#Suppose that one column of a data set captures the season of the year
season_column = c("summer", "winter", "fall", "winter", "spring", "fall")

#The season is a categorical variable and so it is advantageous to store it as 
#a factor.
season = factor(season_column)
# [1] summer winter fall   winter spring fall  
# Levels: fall spring summer winter

#Internally, a factor stores a vector of levels containing the distinct
#values the variable takes on.
levels(season)
# "fall"   "spring" "summer" "winter"

#and vector of integers indicating which value is in each index
as.numeric(season)
# [1] 3 4 1 4 2 1

#Thus, 
stopifnot(levels(season)[as.numeric(season)] == season_column) 
#(Actually, the 'as.numeric' part isn't necessary here.)

#To give the categories an ordering, we add additional parameters to the factor 
#function
season = factor(season_column, levels = c("spring", "summer", "fall", "winter"), order = TRUE)
# [1] summer winter fall   winter spring fall  
# Levels: spring < summer < fall < winter

#factor variables allow you to make use of powerful built-in functions.
#Consider the iris dataframe, a built-in data set
print(head(iris))
#   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa
# 2          4.9         3.0          1.4         0.2  setosa
# 3          4.7         3.2          1.3         0.2  setosa
# 4          4.6         3.1          1.5         0.2  setosa
# 5          5.0         3.6          1.4         0.2  setosa
# 6          5.4         3.9          1.7         0.4  setosa

#As
ls.str(iris)
#shows, Species is stored as a factor

# Petal.Length :  num [1:150] 1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
# Petal.Width :  num [1:150] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
# Sepal.Length :  num [1:150] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
# Sepal.Width :  num [1:150] 3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
# Species :  Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...

#This makes it convenient to use R's aggregate function to compute the median
#petal length.
median_petal_lengths = aggregate(iris["Petal.Length"], by = iris["Species"], FUN=median)
#      Species Petal.Length
# 1     setosa         1.50
# 2 versicolor         4.35
# 3  virginica         5.55
stopifnot(median_petal_lengths[which(median_petal_lengths[["Species"]] == "setosa"), "PetaL.Length"] == 1.5)



#Implement functions below avoiding the use of for loops wherever possible.

#Please read the code and the comments, then experiment with the code to test 
#any points that remain unclear.  When you  finished experimenting, 
#*****remove/fix any*******
#code that generates errors and click submit.

#In each case, you should assume that the dataframe argument has the same 
#fields as the diamonds data set that comes with ggplot2.

#Don't remove these lines!
library(methods)
library(ggplot2)
data(diamonds)

#Use help(diamonds) to learn about the dataset.

#Returns the character (string) of the cut that has the greatest median price
cutWithGreatestMedianPrice = function(df){
  median_d_c = aggregate(df["price"], by = df["cut"], FUN=median)
  ind = which(median_d_c['price'] == max(median_d_c['price']))
  return(as.character(median_d_c[ind,'cut']))
}
stopifnot(cutWithGreatestMedianPrice(diamonds) == "Fair")
print(cutWithGreatestMedianPrice(diamonds))

#Returns the list with the labels cut color clarity, price 
#the containing the cut,color,clarify combination that has the 
#greatest median price

comboWithGreatestMedianPrice = function(df){
  median_prices = aggregate(df["price"], by = c(df["cut"],
                                                df["color"],
                                                df["clarity"]),
                            FUN = median)
  high = which.max(median_prices[, "price"])
  res = median_prices[high, ]
  return(res)
}
x = comboWithGreatestMedianPrice(diamonds)
stopifnot(x["cut"] == "Good" && x["color"] == "D" && x["clarity"] == "IF" && x["price"] == 15081)

print(x["cut"])
print(x["color"])
print(x["clarity"])
print(x["price"])
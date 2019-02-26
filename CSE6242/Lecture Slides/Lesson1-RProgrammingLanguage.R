# first: install dependent packages
install.packages(c("MASS", "akima", "robustbase"))

# second: install suggested packages
install.packages(c("cobs", "robust", "mgcv", "scatterplot3d", "quantreg", "rrcov", "lars", "pwr", "trimcluster", "parallel", "mc2d", "psych", "Rfit"))

# third: install an additional package which provides some C functions
install.packages("devtools")
library("devtools")
install_github("mrxiaohe/WRScpp")

# fourth: install WRS
install_github("nicebread/WRS", subdir="pkg")

install.packages("robustHD")
library("robustHD")

x = c(4,3,3,4,3,1)
x
length(x)
y = vector(mode = "logical", length = 4)
y
z = vector(length = 3, mode = "numeric")
z


q = rep(3.2, times = 10)
q


w = seq(0, 1, by =0.1)
w

w = seq(0,1, length.out = 11)

w <= 0.5

any(w<=0.5)

which(w<=0.5)

w[w<=0.5]

subset(w, w<=0.5)

w[w<=0.5]=0


z = seq(1,20,length.out=20)
x = array(data=z,dim = c(4,5))


y = x[c(1,2), c(1,2)]
y


n1 = 2 * y + 1
n1

n2 = y %*% y
n2


x[1,] %*% x[1,]


x[1,]

t(x)

outer(x[,1], x[,1])


#row bind
rbind(x[1,], x[1,])

#column bind
cbind(x[1,], x[1,])

L=list(name = 'John', age = 55, no.children = 2, children.ages = c(15,18))

names(L)
L[[2]]
L$name
L['name']
L$children.ages[2]
L[[4]][2]


vecn = c("John Smith", "Jane Doe")
veca = c(42, 45)
vecs = c(50000, 55000)
R = data.frame(name = vecn, age = veca, salary = vecs)
summary(R)
str(R)
R


names(R) = c("NAME", "AGE", "SALARY")
R







data(iris)
names(iris)
head(iris,4)
iris[1]
iris$Sepal.Length[1:10]

# Allows you to replace iris$Sepal.Length with shorter Sepal.Length
attach(iris, warn.conflicts = FALSE)


#find the average the sepal length across all rows
mean(iris$Sepal.Length)

#find the mean of all four numeric columns
colMeans(iris[1:4])

#create a subset of sepal lengths less than 5 in the setosa species
subset(iris, Sepal.Length < 5 & Species == "setosa")

#number of rows corresponding to setosa species
#since the 'dim' function returns a vector of two values, 
#the number of rows and columns, we just want the number of rows, 
#that's why we have [1]
dim(subset(iris, Species == "setosa"))[1]


summary(iris)


xor(FALSE, FALSE)


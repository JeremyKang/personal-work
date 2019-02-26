library(robustHD)
library(tidyr)
library(ggplot2)
library(plyr)
library(tidyr)
library(GGally)
library(reshape2)
library(stringr)
library(ggplot2movies)
library("devtools")

data(movies)
data(baseball)
data(ozone)
data(diamonds)
data(tips)
data(movies)


#Functions to find missing data
#is.na - Returns TRUE for missing data, FALSE otherwise. For example, this computes the frequency
#of missing budget entries mean(is.na(movies$budget))
#complete.cases() - Returns a vector whose components are FALSE for all samples TRUE otherwise
#na.omit() - Returns a new data frame omitting all samples containing missing values. 
# moviesNONA = na.omit(movies)
#na.rm - Some functions have this arguement, which if set to TRUE, changes the function behavior so
#proceeds to operate on the supplied data after removing all data frame rows with missing values

moviesNoNa = na.omit(movies)
#Eliminates all rows wth missing data and then plots it
#se=F means the standard error bars will not be produced
qplot(rating, budget, data=moviesNoNa, size=I(1.2)) + 
  stat_smooth(color="red", size=I(2), se=F)


#Data Shuffling
D <- array(data=seq(1,20,length.out = 20),dim=c(4,5))
D_Shuffled = D[sample(4,4),]


#create an array of 4 rows and 5 columns and insert the numbers 1-20
DataSet <- array(data=seq(1,20,length.out = 20),dim=c(4,5))
#generate random permutation of 1,2,3,4. The random permutation allows us to divide the rows into two groups
randomPermutation <- sample(4,4)
#75% of the data set
trainingIndicies <- randomPermutation[1:floor(4*0.75)]
#25% of the data set
testingIndicies <- randomPermutation[(floor(4*0.75)+1):4]
trainingData <- DataSet[trainingIndicies,]
testingData <- DataSet[testingIndicies,]


#Melt to tall format
tipsm = melt(tips, id=c("sex", "smoker", "day", "time", "size"))
tipstestmelt = melt(tips)

#Melt to wide format
#aggregate multiple sells using mean/average. #Sex is rows and variables as column.
dcast(tipsm, 
      sex~variable,
      fun.aggregate = mean)

#number of occurrences for measurement variable broken by sex
dcast(tipsm,
      sex~variable,
      fun.aggregate=length)

#Average total bill and tip for different times
dcast(tipsm,
      sex~variable,
      fun.aggregate=mean)

#Similar to above with breakdown for sex and time
dcast(tipsm,
      sex+time~variable,
      fun.aggregate = length)

#Similiar to above, but with mean and added margins
#Margins=TRUE includes extra row and column of average of all
dcast(tipsm,
      sex+time~variable,
      fun.aggregate = mean,
      margins=TRUE)

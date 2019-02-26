############################
#Jeremy Kang
#GTID: 903136703
#GTName: jkang315
############################
library(ggplot2)

#Built-in R log function
lgamma = function(n) {
  return(lfactorial(n))
}

lgamma(5)


#HW1Q2: For log function
log_gamma_loop = function(n) {
  res = 1
  for(i in seq(n)) {
    res = res * i
  }
  return(log(res))
}

log_gamma_loop(200)


#HW1Q3: Recursive log function
log_gamma_recursive = function(n) {
  if (n == 1) {
    return(log(n))
  } else {
  return(log_gamma_recursive(n-1) + log(n))
  }
}

log_gamma_recursive(10)


#HW1Q4 Sum of log factorials
#For loop function
sum_log_gamma_loop = function(n) {
  sum = 0
  for(i in seq(n)) {
    if (sum != log_gamma_loop(n)) {
      sum = sum + log(i)
    }
  }
  return(sum)
}

sum_log_gamma_loop(100)

#Recursive function
sum_log_gamma_recursive = function(n) {
  sum = 0
  for(i in seq(n)) {
    if (sum != log_gamma_recursive(n)) {
      sum = sum + log(i)
    }
  }
  return(sum)
}

sum_log_gamma_recursive(13)

#Built-in function
sum_log_gamma = function(n) {
  sum = 0
  for(i in seq(n)) {
    if (sum != lgamma(n)) {
      sum = sum + log(i)
    }
  }
  return(sum)
}

sum_log_gamma(5)

#HW1Q5
options(expressions=500000)
iter = seq(100, 3000, by = 10)
timeFor = c()
timeRec = c()
timeR = c()
for (n in iter) {
  timeFor = c(timeFor, system.time(sum_log_gamma_loop(n)[[1]]))
  timeRec = c(timeRec, system.time(sum_log_gamma_recursive(n)[[1]]))
  timeR = c(timeR, system.time(sum_log_gamma(n)[[1]])) 
}

#timeFor goes to 1135 observations
#timeFor <- timeFor[1:1130]

#timeFor goes to 1090 observations so remove last 5 observations
timeFor <- timeFor[1:1085]

df <- data.frame(x=iter, For_loop=timeFor, Recursive=timeRec, Built_in=timeR)

#Delete all 0's 
df <- df[!(apply(df, 1, function(y) any(y == 0))),]

#plots combined
ggplot(df, aes(x=seq(1:1085))) +
  geom_line(aes(y=Recursive), color="blue") +
  geom_line(aes(y=For_loop), color="red") +
  geom_line(aes(y=Built_in), color="green") +
  xlab("N Iteration") +
  ylab("Time (seconds)") +
  labs(title="Growth Rates for Built-in, Recursive, and For-Loop")

#plots separated
plot.ts(df, main="Growth Rates for Built-in, Recursive, and For-Loop", xlab="Iteration")

summary(df)
table(df)
sd(df$timeFor)
sd(df$timeRec)
sd(df$timeR)


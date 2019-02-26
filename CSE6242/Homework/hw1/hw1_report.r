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

log_gamma_loop(5)


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
iter = seq(100, 1800, by = 5)
timeFor = c()
timeRec = c()
timeR = c()
for (n in iter) {
  timeFor = c(timeFor, system.time(sum_log_gamma_loop(n)[1]))
  timeRec = c(timeRec, system.time(sum_log_gamma_recursive(n)[1]))
  timeR = c(timeR, system.time(sum_log_gamma(n)[1])) 
}


#timeFor goes to 1135 observations
#timeFor <- timeFor[1:1130]

#timeFor goes to 1090 observations
#timeFor <- timeFor[1:1085]

df <- data.frame(timeFor=timeFor, timeRec=timeRec, timeR=timeR)

#Delete all 0's 
df <- df[!(apply(df, 1, function(y) any(y == 0))),]

plot.ts(df, main="Growth Rates for Built-in, Recursive, and For-Loop", xlab="Iteration")


summary(df)
table(df)
sd(df$timeFor)
sd(df$timeRec)
sd(df$timeR)


############################
#Jeremy Kang
#GTID: 903136703
#GTName: jkang315
############################

library(ggplot2)
library(GGally)
library(reshape2)

########### #1 ##########
data(midwest)
attach(midwest, warn.conflicts = FALSE)

names(midwest)
help(midwest)
summary(midwest)
table(midwest$state)

#Separate states into own dfs
IL_df <- subset(midwest, midwest$state == "IL")
IN_df <- subset(midwest, midwest$state == "IN")
MI_df <- subset(midwest, midwest$state == "MI")
OH_df <- subset(midwest, midwest$state == "OH")
WI_df <- subset(midwest, midwest$state == "WI")


############# Interpretation A ############# 
#Calculate adult population with a professional education by state
IL_df$perc_AWP_state <- sum(IL_df$percprof * IL_df$popadults) / sum(IL_df$popadults)
IN_df$perc_AWP_state <- sum(IN_df$percprof * IN_df$popadults) / sum(IN_df$popadults)
MI_df$perc_AWP_state <- sum(MI_df$percprof * MI_df$popadults) / sum(MI_df$popadults)
OH_df$perc_AWP_state <- sum(OH_df$percprof * OH_df$popadults) / sum(OH_df$popadults)
WI_df$perc_AWP_state <- sum(WI_df$percprof * WI_df$popadults) / sum(WI_df$popadults)

#Check percent value for state
IL_df$perc_AWP_state[1]
IN_df$perc_AWP_state[1]
MI_df$perc_AWP_state[1]
OH_df$perc_AWP_state[1]
WI_df$perc_AWP_state[1]

#Create label and value for df for state
q1labels <- c("IL", "IN", "MI", "OH", "WI")
q1values <- c(IL_df$perc_AWP_state[1], IN_df$perc_AWP_state[1], MI_df$perc_AWP_state[1],
               OH_df$perc_AWP_state[1], WI_df$perc_AWP_state[1])

q1df <- melt(data.frame(x=q1labels, y=q1values))

#Bar plot of percentage of adult population with a professional education by state
ggplot(q1df, aes(x=reorder(q1labels, -value), y=value)) +
  geom_bar(stat="identity") +
  labs(title="% of adult population with a prof degree across midwestern states",
       x="State",
       y="Percent of Population") + 
  theme(text=element_text(size=15))



############# Interpretation B ############# 
par(mfrow=c(3, 2))
ggplot(IL_df, aes(reorder(IL_df$county,-IL_df$percprof, median), y=IL_df$percprof)) +
  geom_point() + 
  theme(axis.text.x = element_text(angle=90)) +
  labs(title="Percent of adults w. prof. edu. by county in Illinois",
       x="County",
       y="Percent of adults with prof. degree")

ggplot(IN_df, aes(reorder(IN_df$county,-IN_df$percprof, median), y=IN_df$percprof)) +
  geom_point() + 
  theme(axis.text.x = element_text(angle=90)) +
  labs(title="Percent of adults w. prof. edu. by county in Indiana",
       x="County",
       y="Percent of adults with prof. degree")

ggplot(MI_df, aes(reorder(MI_df$county, -MI_df$percprof, median), y=MI_df$percprof)) +
  geom_point() + 
  theme(axis.text.x = element_text(angle=90)) +
  labs(title="Percent of adults w. prof. edu. by county in Michigan",
       x="County",
       y="Percent of adults with prof. degree")

ggplot(OH_df, aes(reorder(OH_df$county, -OH_df$percprof, median), y=OH_df$percprof)) +
  geom_point() + 
  theme(axis.text.x = element_text(angle=90)) +
  labs(title="Percent of adults w. prof. edu. by county in Ohio",
       x="County",
       y="Percent of adults with prof. degree")

ggplot(WI_df, aes(reorder(WI_df$county, -WI_df$percprof, median), y=WI_df$percprof)) +
  geom_point() + 
  theme(axis.text.x = element_text(angle=90)) +
  labs(title="Percent of adults w. prof. edu by county in Wisconsin",
       x="County",
       y="Percent of adults with prof. degree")

#Counties with highest percentage of adults with a professional education
countyHighs <- data.frame(q1labels, y=c(IL_df$county[IL_df$percprof == max(IL_df$percprof)], 
  IN_df$county[IN_df$percprof == max(IN_df$percprof)], MI_df$county[MI_df$percprof == max(MI_df$percprof)],
  OH_df$county[OH_df$percprof == max(OH_df$percprof)], WI_df$county[WI_df$percprof == max(WI_df$percprof)]))

countyLows <- data.frame(q1labels, y=c(IL_df$county[IL_df$percprof == min(IL_df$percprof)],
  IN_df$county[IN_df$percprof == min(IN_df$percprof)], MI_df$county[MI_df$percprof == min(MI_df$percprof)],
  OH_df$county[OH_df$percprof == min(OH_df$percprof)], WI_df$county[WI_df$percprof == min(WI_df$percprof)]))

#Counties above average (count and %)
countAboveAvg <- data.frame(q1labels, y=c(length(which(IL_df$percprof > mean(IL_df$percprof))),
  length(which(IN_df$percprof > mean(IN_df$percprof))),length(which(MI_df$percprof > mean(MI_df$percprof))),
  length(which(OH_df$percprof > mean(OH_df$percprof))), length(which(WI_df$percprof > mean(WI_df$percprof)))))

countAbovPerc <- data.frame(q1labels, y=c(length(which(IL_df$percprof > mean(IL_df$percprof))) / length(IL_df$percprof),
  length(which(IN_df$percprof > mean(IN_df$percprof))) / length(IN_df$percprof),
  length(which(MI_df$percprof > mean(MI_df$percprof))) / length(MI_df$percprof),
  length(which(OH_df$percprof > mean(OH_df$percprof))) / length(OH_df$percprof),
  length(which(WI_df$percprof > mean(WI_df$percprof))) / length(WI_df$percprof)))


#Get summary stats
summary(IL_df$percprof)
summary(IN_df$percprof)
summary(MI_df$percprof)
summary(OH_df$percprof)
summary(WI_df$percprof)


#Boxplot to see distribution
ggplot(midwest, aes(reorder(state, -percprof, median), percprof)) +
  geom_boxplot() +
  labs(title="Boxplot of State and % of adult pop with prof. edu.",
       x="State",
       y="Percent of adults with prof. degree")




# ########## #2 ##########
############# Interpretation A #############
#Calculate adult population with a high school education by state
IL_df$perc_hsd_state <- sum(IL_df$perchsd * IL_df$popadults) / sum(IL_df$popadults)
IN_df$perc_hsd_state <- sum(IN_df$perchsd * IN_df$popadults) / sum(IN_df$popadults)
MI_df$perc_hsd_state <- sum(MI_df$perchsd * MI_df$popadults) / sum(MI_df$popadults)
OH_df$perc_hsd_state <- sum(OH_df$perchsd * OH_df$popadults) / sum(OH_df$popadults)
WI_df$perc_hsd_state <- sum(WI_df$perchsd * WI_df$popadults) / sum(WI_df$popadults)

#Calculate adult population with a college education by state
IL_df$perc_coll_state <- sum(IL_df$percollege * IL_df$popadults) / sum(IL_df$popadults)
IN_df$perc_coll_state <- sum(IN_df$percollege * IN_df$popadults) / sum(IN_df$popadults)
MI_df$perc_coll_state <- sum(MI_df$percollege * MI_df$popadults) / sum(MI_df$popadults)
OH_df$perc_coll_state <- sum(OH_df$percollege * OH_df$popadults) / sum(OH_df$popadults)
WI_df$perc_coll_state <- sum(WI_df$percollege * WI_df$popadults) / sum(WI_df$popadults)


#High School by State DF and plot
q2labels <- c("IL", "IN", "MI", "OH", "WI")
q2valuesHS <- c(IL_df$perc_hsd_state[1], IN_df$perc_hsd_state[1], MI_df$perc_hsd_state[1],
              OH_df$perc_hsd_state[1], WI_df$perc_hsd_state[1])

q2dfHS <- melt(data.frame(x=q2labels, y=q2valuesHS))

#Bar plot of percentage of high school educated across states
ggplot(q2dfHS, aes(x=reorder(q2labels, -value), y=value)) +
  geom_bar(stat="identity") +
  labs(title="% of HS educated across midwestern states",
       x="State",
       y="Percent of Population") + 
  theme(text=element_text(size=15))


#College by State DF and plot
q2valuesColl <- c(IL_df$perc_coll_state[1], IN_df$perc_coll_state[1], MI_df$perc_coll_state[1],
                OH_df$perc_coll_state[1], WI_df$perc_coll_state[1])

q2dfColl <- melt(data.frame(x=q2labels, y=q2valuesColl))

#Bar plot of percentage of college educated across states
ggplot(q2dfColl, aes(x=reorder(q2labels, -value), y=value)) +
  geom_bar(stat="identity") +
  labs(title="% of college educated across midwestern states",
       x="State",
       y="Percent of Population") + 
  theme(text=element_text(size=15))




############# Interpretation B #############

#raw perchsd and percollege
#Box plot of state and % of adult population with high school edu
ggplot(midwest, aes(reorder(state, -perchsd, median), perchsd)) +
  geom_boxplot() +
  labs(title="Boxplot of State and % of adult pop with H.S. edu.",
       x="State",
       y="Percent of adult pop with H.S. edu")

#Box plot of state and % of adult population with college edu
ggplot(midwest, aes(reorder(state, -percollege, median), percollege)) +
  geom_boxplot() +
  labs(title="Boxplot of State and % of adult pop with college edu.",
       x="State",
       y="Percent of adult pop with college edu")

#Get summary stats for HS for each state
summary(IL_df$perchsd)
summary(IN_df$perchsd)
summary(MI_df$perchsd)
summary(OH_df$perchsd)
summary(WI_df$perchsd)

#Get summary stats for college for each state
summary(IL_df$percollege)
summary(IN_df$percollege)
summary(MI_df$percollege)
summary(OH_df$percollege)
summary(WI_df$percollege)

# Three way relationship between percentage with high school degree,
# college degree, and state
ggplot(midwest, aes(perchsd, percollege)) +
  geom_point() +
  facet_grid(state~.) +
  geom_smooth() +
  labs(title="Education level by State")


#Calculate slope and intercept and put in DF
q2intercept <- c(coef(lm(percollege ~ perchsd, data=IL_df))[1],
          coef(lm(percollege ~ perchsd, data=IN_df))[1],
          coef(lm(percollege ~ perchsd, data=MI_df))[1],
          coef(lm(percollege ~ perchsd, data=OH_df))[1], 
          coef(lm(percollege ~ perchsd, data=WI_df))[1])

q2slope <- c(coef(lm(percollege ~ perchsd, data=IL_df))[2],
         coef(lm(percollege ~ perchsd, data=IN_df))[2],
         coef(lm(percollege ~ perchsd, data=MI_df))[2],
         coef(lm(percollege ~ perchsd, data=OH_df))[2], 
         coef(lm(percollege ~ perchsd, data=WI_df))[2])

q2facetdf <- data.frame(q1labels, q2intercept, q2slope)


#Below is just the plots broken out by state (NOT IN REPORT!)
#Plots for within each state (counties)
ggplot(IL_df, aes(IL_df$perchsd, IL_df$percollege)) +
  geom_point() +
  geom_abline(intercept = -36.4408554, slope=0.7532536) +
  labs(title="Education level by IL Counties",
       x="% High School Educated",
       y="% College Educated")

ggplot(IN_df, aes(IN_df$perchsd, IN_df$percollege)) +
  geom_point() +
  geom_abline(intercept = -39.8333693, slope=0.7694763) +
  labs(title="Education level by IN Counties",
       x="% High School Educated",
       y="% College Educated")

ggplot(MI_df, aes(MI_df$perchsd, MI_df$percollege)) +
  geom_point() +
  geom_abline(intercept = -57.641501, slope=1.029189) +
  labs(title="Education level by MI Counties",
       x="% High School Educated",
       y="% College Educated")

ggplot(OH_df, aes(OH_df$perchsd, OH_df$percollege)) +
  geom_point() +
  geom_abline(intercept = -32.7003275, slope=0.6774203) +
  labs(title="Education level by OH Counties",
       x="% High School Educated",
       y="% College Educated")

ggplot(WI_df, aes(WI_df$perchsd, WI_df$percollege)) +
  geom_point() +
  geom_abline(intercept = -57.699211, slope=1.029085) +
  labs(title="Education level by WI Counties",
       x="% High School Educated",
       y="% College Educated")




########## #3 ##########
#Create example dfs
set.seed(123)
q3hist <- data.frame(x=round(rnorm(runif(11000, min=18, max=40), mean=23, sd=1)))
q3male <- data.frame(x=factor("Male"), y=round(runif(rnorm(5500, mean=23, sd=2), min=18, max=35)))
q3female <- data.frame(x=factor("Female"), y=round(runif(rnorm(5500, mean=23, sd=3), min=18, max=40)))

q3mean <- mean(q3hist[[1]])
q3datadf <- rbind(q3male, q3female)


#Histogram example
ggplot(q3hist, aes(x, y=..density..)) +
  geom_histogram(binwidth=1) +
  geom_vline(xintercept=q3mean, color="red") +
  labs(title="Histogram of a normally distributed sample of college students' age",
       x="Age")

#Box plot example
ggplot(q3datadf, aes(x,y)) + 
  geom_boxplot() + 
  coord_flip() +
  labs(title="Boxplot of student respondents (M vs. F)",
       x="Gender",
       y="Age")


# ##QQ-Plot using qqnorm/qqline example
# qqnorm(q3hist[[1]])
# qqline(q3hist[[1]])
# 
# qqnorm(q3male[[2]])
# qqline(q3male[[2]])
# 
# qqnorm(q3female[[2]])
# qqline(q3female[[2]])

#Set up QQ plot example
q3qqmale = data.frame(density = dnorm(q3male[[2]], 0, 1))
q3qqfemale = data.frame(density = rnorm(q3female[[2]], 0, 1))

q3qqmale$samples = rnorm(5500, 0, 1) 
q3qqfemale$samples = rnorm(5500, 0, 1)
pm = list(df = 1)

#Male QQ plot
ggplot(q3qqmale, aes(sample = samples)) + 
  stat_qq(distribution = qt, dparams = pm) +
  labs(title="QQ plot of male respondents")

#Female QQ plot
ggplot(q3qqfemale, aes(sample = samples)) + 
  stat_qq(distribution = qt, dparams = pm) + 
  labs(title="QQ plot of female respondents")





########## #4 ##########
getwd()

#Uncommented on local drive. TA please setwd!
setwd('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots')

#Create random x's and y's. N was changed manually. See report for details.
N = seq(1, 100000)
q4x = runif(N)
q4y = runif(N)
q4df <- data.frame(q4x, q4y)

#Create and save plot
ggplot(q4df, aes(q4x, q4y)) +
  geom_point(size=1.1, shape=21, stroke=1) +
  labs(title="Random Numbers vs. Random Numbers",
       x="Random X Values", y="Random Y Values") +
  ggsave("Q4pdf.pdf") +
  ggsave("Q4ps.ps") +
  ggsave("Q4png.png") +
  ggsave("Q4jpg.jpg")


#Gather all file sizes with their respective file types. Note, filepath must be changed.
pdf = melt(c(file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf10.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf50.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf100.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf200.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf400.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf600.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf800.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf1000.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf2000.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf4000.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf6000.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf8000.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf10000.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf20000.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf40000.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf60000.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf80000.pdf')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4pdf100000.pdf')[1]))

ps = melt(c(file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps10.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps50.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps100.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps200.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps400.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps600.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps800.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps1000.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps2000.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps4000.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps6000.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps8000.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps10000.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps20000.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps40000.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps60000.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps80000.ps')[1],
            file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4ps100000.ps')[1]))

png = melt(c(file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png10.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png50.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png100.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png200.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png400.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png600.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png800.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png1000.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png2000.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png4000.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png6000.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png8000.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png10000.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png20000.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png40000.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png60000.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png80000.png')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4png100000.png')[1]))

jpg = melt(c(file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg10.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg50.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg100.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg200.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg400.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg600.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg800.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg1000.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg2000.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg4000.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg6000.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg8000.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg10000.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg20000.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg40000.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg60000.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg80000.jpg')[1],
             file.info('~/Desktop/Spring2017/CSE6242/Homework/hw2/plots/Q4Plots/Q4jpg100000.jpg')[1]))

row.names(pdf) <- c("10", "50", "100", "200", "400", "600", "800", "1000", "2000", "4000",
                "6000", "8000", "10000", "20000", "40000", "60000", "80000", "100000")
row.names(ps) <- c("10", "50", "100", "200", "400", "600", "800", "1000", "2000", "4000",
               "6000", "8000", "10000", "20000", "40000", "60000", "80000", "100000")
row.names(png) <- c("10", "50", "100", "200", "400", "600", "800", "1000", "2000", "4000",
                "6000", "8000", "10000", "20000", "40000", "60000", "80000", "100000")
row.names(jpg) <- c("10", "50", "100", "200", "400", "600", "800", "1000", "2000", "4000",
                "6000", "8000", "10000", "20000", "40000", "60000", "80000", "100000")

#Create df without melted info
file_size <- data.frame(pdf, ps, png, jpg)
file_size_clean <- subset(file_size, select=-c(L1, L1.1, L1.2, L1.3))
colnames(file_size_clean) <- c("pdf", "ps", "png", "jpg")
sizes <- melt(as.matrix(file_size_clean))

#Plot all file types
ggplot(sizes, aes(x=Var1, y=value, color=Var2)) +
  labs(title="Different file types and saved sizes",
       x="N sample",
       y="File size (bytes)") +
  theme(text=element_text(size=15)) +
  scale_color_discrete(name="File types") +
  geom_line()




########## #5 ##########
#Import data and look at basic info
data(diamonds)
help(diamonds)
summary(diamonds)

#Stats of colors
summary(diamonds$color)

#Stats of carat and price
q5stats <- rbind(summary(diamonds$carat, digits=15),
                 summary(diamonds$price, digits=15))
row.names(q5stats) <- c("Carat", "Price")

length(which(diamonds$price > mean(diamonds$price))) / length(diamonds$price)


##Bar chart of colors
ggplot(diamonds, aes(x=color)) +
  stat_count() + 
  labs(title="Bar chart of diamond colors",
       x="Color",
       y="Count")

#Bar chart of carat
ggplot(diamonds, aes(x=carat)) +
  stat_count() + 
  stat_bin(binwidth=.1) +
  labs(title="Bar chart of diamond carat",
       x="Carat",
       y="Count")

#Histogram of prices
ggplot(diamonds, aes(x=price)) +
  geom_histogram(binwidth=200) + 
  labs(title="Bar chart of diamond price",
       x="Price",
       y="Count")

#Three way relationship between carat, color, and facet
ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point() +
  facet_grid(color~.) +
  labs(title="Price by color and carat")


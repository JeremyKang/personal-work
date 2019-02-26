library(ggplot2)
data(faithful)

names(faithful)

plot(faithful$eruptions, xlab = "sample number", ylab = "eruption times(min)", main = "Old Faithful Eruption Times")

#Method 1 of plotting
qplot(x = waiting,
      data = faithful,
      binwidth = 3,
      main = "Waiting time to next eruption (min)")

#Method 2 of plotting
ggplot(faithful, aes(x=waiting)) + geom_histogram(binwidth=3)

#y values can be replaced with probability/frequency using the following syntax
#This tells ggplot to show thet y-axis not with count values, but rather with density values.
ggplot(faithful, aes(x=waiting, y= ..density..)) + geom_histogram(binwidth=2)

?rnorm()


data(mtcars)

#Example of line plot
x = seq(-2, 2, length.out = 30)
y = x^2
qplot(x, y, geom = "line") #line plot
qplot(x, y, geom = c("point", "line")) #line and point plot
dataframe = data.frame(x = x, y = y)
ggplot(dataframe, aes(x = x, y = y)) + 
  geom_line() + geom_point() # same as above, but with ggplot

#Slightly more complicated example of line plot
S = sort.int(mpg$cty, index.return = T)
# x: city mpg
# ix: indices of sorterd values of city mpg
plot(S$x, #plot sorted city mpg values with a line plot. Represents the data. 
     type = "l", #Going to tell the plot function to show a line plot
     lty = 2, #Going to tell the plot function what is going to be the style of the line (solid or dashed)
     xlab = "sample number (sorted by city mpg)", #correspond to different car models
     ylab = "mpg") #city mpg
lines(mpg$hwy[S$ix] ,lty = 1) #Add dashed line of hwy mpg
legend("topleft", c("highway mpg", "city_mpg"), 
       lty = c(1, 2))



#Smoothed Histogram
ggplot(faithful, aes(x=waiting, y= ..density..)) +
  geom_histogram(alpha=0.3) + geom_density(size=1.5, color="red")





#Scatter Plot using base graphics in R
plot(faithful$waiting,
     faithful$eruptions,
     pch = 17, #type of marker
     col = 2, #color of marker
     cex = 1.2, #corresponds to the size
     xlab = "waiting times (min)",
     ylab = "eruption time (min)")




data(mtcars)
data(mpg)

names(mtcars)
names(mpg)

help(mtcars)
#The goal of this graph is to show the relationship between 
#two numeric variables, horsepower and mpg, but also to show
#the relationship between these two variables in the transmission, 
#marked in the mtcars$am column in the dataframe. 
plot(mtcars$hp,
     mtcars$mpg,
     pch = mtcars$am, #pch is going to determine the shape of the marker
                      #in the scatter plot that the function plot() will produce.
                      #We're going to tell the plot function to detrmine the marker
                      #type based on the value of the transmission column (AM) of the data frame.
     xlab = "horsepower",
     cex = 1.2,
     ylab = "miles per gallon",
     main = "mpg vs. hp by transmission")
legend("topright", c("automatic", "manual"), pch = c(0,1))


#Multivariable Scatter Plots
qplot(x = wt,
      y = mpg,
      data = mtcars,
      size = cyl,
      main = "MPG vs. weight (x1000 lbs) by cylinder")

#Noisy Data
qplot(disp, mpg, data=mtcars, main = "MPG vs. Eng. Displacement") + 
  stat_smooth(method = "loess", method.args = list(degree = 0), span = 0.2, se = TRUE)



names(mtcars)
mtcars$am
mtcars$amf
#Before we look at facets, we need to modify the mtcars data frame to have new columns
#with more appropriate names for better axes labeling amf = automatic vs. manual and vsf = 
#shaping of the engine:
mtcars$amf[mtcars$am==0] = 'automatic'
mtcars$amf[mtcars$am==1] = 'manual'
mtcars$vsf[mtcars$vs==0] = 'flat'
mtcars$vsf[mtcars$vs==1] = 'V-shape'


qplot(x = wt,
      y = mpg,
      facets = .~amf, #This is telling qplot to have only one row because we have a period 
                      #of the left of the tilde. When you have multiple columns where each
                      #column corresponds to different values of the amf column in the data
                      #frame, amf being the transmission type column. Assign that formula to
                      #the facets variable.
      data = mtcars,
      main = "MPG vs. weight by transmission")



qplot(x = wt,
      y = mpg,
      facets = vsf~., #The facets in this case are showing two different rows and one column.
                      #So we need to write the variable that will dictate how the rows will 
                      #appear to the left of the tilde symbol. To the right of the tilde,
                      #we'll put a period to indicate there will only be one column.
      data = mtcars,
      main = "MPG vs. weight by engine")


qplot(x = wt,
      y = mpg,
      facets = vsf~amf, #There are four facets or two rows and two columns. Where the rows 
                        #correspond to the shape and the columns correspond to amf.
      data = mtcars,
      main = "MPG vs. weight by engine")


#Use ggpairs to illustrate relationships between multiple variables using an array of scatter plots,
#smooth histograms, and correlation values. 
DF = mpg[,
         c('cty', 'hwy', 'displ')]
install.packages("GGally")
library(GGally)
ggpairs(DF)





#Contour Plot
x_grid = seq(-1,1,length.out = 100)
y_grid = x_grid
R = expand.grid(x_grid, y_grid)
names(R) = c('x', "y")
R$z = R$x^2 + R$y^2
ggplot(R, aes(x=x, y=y, z=z)) + stat_contour()




#Box Plot
#box denoting the IQR
#An inner line bisecting the box denoting the median
#Whiskers extending to the most extreme point no further tan 1.5 times
#IQR length away from the edges of the box
#points outside the box and whiskers marked as outliers
ggplot(mpg, aes("", hwy)) + #recall ggplot recalls us to use this AES function (qplot does not)
  geom_boxplot() + #add the box plot geometry and get it from this function
  coord_flip() + #this example, we execute this function because we want the box plot to lie on it's side
  scale_x_discrete("") #Also required if we want to make the box plot lying down



#Box plot of highway mpg for different class of cars within the MPG data frame
ggplot(mpg, aes(reorder(class, - hwy, median), hwy)) +
  geom_boxplot() +
  coord_flip() +
  scale_x_discrete("class")



#Example of qq plot graphs
D = data.frame(samples = c(rnorm(200, 1, 1),  #mean 1, std 1
                           rnorm(200, 0, 1),  #mean 0, std 1
                           rnorm(200, 0, 2))) #mean 0, std 2

D$parameter[1:200]   = 'N(1,1)'; #N(1,1) corresponds to the normal distribution with mean 1, std 1
D$parameter[201:400] = 'N(0,1)';
D$parameter[401:600] = 'N(0,2)';

qplot(samples,
      facets = parameter~., #Facet graph that the rows describe the different values of the parameter
                            #or variable. 
      geom = 'histogram',
      data = D)


ggplot(D, aes(sample = samples)) +
  stat_qq() +
  facet_grid(.~parameter)


#QQ Plot skeleton shows quantiles of a Guassian distribution vs t-distribution
x_grid = seq(-6, 6, length.out = 200) #create grid between the values -6, 6, 200 equally spaced points
R = data.frame(density = dnorm(x_grid, 0, 1)) #compute Gaussian (normal) distribution with parameters 0 and 1
R$tdensity = dt(x_grid, 1.5) 
R$x = x_grid
ggplot(R, aes(x=x, y=density)) + #call ggplot function and tell it to draw two different graphs
                                 #The two graphs call the normal and t-distributions and overlay them
                                 #on top of the other. 
  geom_area(fill = I('grey')) + #Gaussian distribution
  geom_line(aes(x=x, y = tdensity)) + #Use a line graph for t-distribution
  labs(title = "N(0,1) (shaded) and t-distribution (1.5 dof)")


#QQ plot of the sample from the normal/Gaussian distribution vs. the theoretical quantiles
#of the t-distribution. 
x_grid = seq(-6, 6, length.out = 200)
R = data.frame(density = dnorm(x_grid, 0, 1))
R$samples = rnorm(200, 0, 1) #Create 200 samples from the normal distribution with parameters 0 and 1.
pm = list(df = 1.5)
ggplot(R, aes(sample = samples)) + #Call ggplot function with the data set that we just sampled from
                                   #the normal distribution, telling it to use a qqplot and drawing 
                                   #the quantiles of the dataset against the quantiles from the
                                   #distribution, denoted here by qt, which is the t-distribution
                                   #with the specific parameter, in this case, df corresponds to
                                   #degrees of freedom 1.5 (parameter of the t-distribution). 
  stat_qq(distribution = qt, dparams = pm)





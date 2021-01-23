#Multiple Linear Regression

A=X50_startups
A

#NOW, as 'state' is a categorical data we need to convert it into numeric data..
#Dummy variable coding..

A$State = factor(A$State, levels = c('New York','California','Florida'), labels = c(1,2,3) )
A

#Equation for Multiple Linear Regression..
#y regress on x....y = b0 + b1*x1 + b2*x2 + b3*x3 + b4*x4

#where 
# y = Profit,                        b0 = intercept
#x1 = R&D Spend,                     b1 = slope of R&D Spend
#x2 = Administration,                b2 = slope of Administration
#x3 = Marketing Spend,               b3 = slope of Marketing Spend
#x4 = State                          b4 = slope of state


#Splitting the dataset(A) into the Training dataset and Test dataset.
#install.packages('caTools')
library(caTools)


#Then split the same data with random method
set.seed(123)

split = sample.split(A$Profit, SplitRatio = 0.8)

training_set = subset(A, split==TRUE) # 80% of dataset(A)

test_set = subset(A,split==FALSE)     # 20% of dataset(A)

training_set
test_set

#Fitting Multiple Linear Regression to the Training set
regressor = lm(Profit ~ ., data = training_set) # here dot(.) represents the remaining columns on which profit regress.

summary(regressor)

#predicting the test set's results
y_pred = predict(regressor, newdata = test_set)
y_pred

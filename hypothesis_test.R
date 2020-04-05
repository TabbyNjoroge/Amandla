One sample t test
Steps we need to take while carrying out a hypothesis test.

Step 1: State the hypothesis
Null hypothesis: U = 50
Alternative hypothesis: U != 50 (two tailed test)
U < 50 (one tailed test)
U > 50 (one tailed test)

Step 2: Calculate the t-statistic (t-calc)
sample mean, sample standard deviation, sample size(n),and
hypothesised mean(U)
tstatistic = (sample mean - hypothesised mean(U))/
  (standard deviation/sqrt(sample size(n)))

Step 3: Determine the degrees of freedom (read about this)
df: sample size(n) - 1

Step 4: Determine the confidence level (alpha = 100% - conf level)
95% (5% = 0.05) , 99%(1% = 0.01), 90%(10% = 0.1)

Step 5: Determine the t-tabulated (t-tab)
two tailed test: t(alpha/2, df)
e.g t(0.025, 19)
In R, the code would be 
qt(area to the left of the critical value, df)
qt(1-(alpha/2), df) e.g
qt(1-(0.05/2), 19) = 2.093024

one tailed test: t(0.05, 19)
qt(area to the left of the critical value, df)
qt(1-(alpha), df) e.g
qt(1-(0.05), 19) 


##Example 1
H0:U=50, H1: U < 50, n = 20.
alpha = 0.05, df = 19 

from the tables: (-1.729)
from R: qt(area to the left of the critical value, df)
qt(0.05,19) = -1.729133

##Example 2
H0:U=50, H1: U > 50, n = 25.
alpha = 0.05, df = 24 

from the tables: (1.711)
from R: qt(area to the left of the critical value, df)
qt((1-0.05),24) = 1.710882

##Example 3
H0:U=70, H1: U > 70, n = 18.
alpha = 0.05, df = 17 

from the tables: (1.740)
from R: qt(area to the left of the critical value, df)
qt((1-0.05),17) =  1.739607

##Example 4
#It is widely believed that the average body temperature for healthy adults is 98.6 degrees 
#Fahrenheit. A study was conducted a few years go to examine this belief. The body 
#temperatures of n = 30 healthy adults were measured (half male and half female). The 
#average temperature from the sample was found to be x(bar) = 98.249 with a 
#standard deviation s = 0.7332. Do these statistics contradict the belief that the average 
#body temperature is 98.6?test at 1% significance level.


H0:U=98.6, H1: U < 98.6, n = 30.
alpha = 0.01, df = 29

from the tables: c.v = -2.462
from R: qt(area to the left of the critical value, df)
qt(0.01,29) = -2.462021


##Example 5
#The average cost of a hotel room in New York is said to be 168 dollars per night. 
#To determine if this is true, a random sample of 25 hotels is taken and resulted in 
#x = $172.5 and s = $15.40 . Test the appropriate hypotheses at alpha = 0.05.

H0:U = 168, H1: U =! 168, n = 25.(this is a two-tailed test)
alpha = 0.05, df = 24

from the tables: c.v  = -2.064 and 2.064
from R: qt(area to the left of the critical value, df)
qt((0.05/2),24) = -2.063899 and qt((1-0.05/2),24) = 2.063899

###Example 6
#A study is to be done to determine if the cognitive ability of children living near a lead 
#smelter is negatively impacted by increased exposure to lead. Suppose the average IQ for 
#children in the United States is 100. From a pilot study, the mean and standard deviation 
#of 15 children were found to be x = 89 and s = 14.4 respectively. Test at 5% level whether there is 
#a negative impact.

H0:U = 100, H1: U < 100, n = 15.(left-tailed test)
alpha = 0.05, df = 14

from the tables: c.v  = -1.761
from R: qt(area to the left of the critical value, df)
qt((0.05),14) = -1.76131 





#Step 6: Making conclusion

#To continue from here. 

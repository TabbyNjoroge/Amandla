#Getting the data
dataset=read.csv("C:/Users/HP/Downloads/wafanyikazi.csv")

#Loading Tidyverse
library(tidyverse)

#select-for picking/dropping variables
data1=dataset %>% 
  select (Department,Income,Marital_Status)
data2=dataset %>% 
  select (-Leave_Days)
#contains
data3=dataset %>% 
  select(contains ('A'))
#endswith
data4=dataset %>% 
  select(ends_with ('t'))

#mutate

#patterns
t = "i have two babies"
grepl("e",t,ignore.case = TRUE)
grep("e",t,ignore.case = TRUE, value = T)

#vector of different counties
counties = c("mombasa","machakos","kakamega","muranga","nairobi","kiambu","nyeri")
#counties containing the letter 'm'
grep("m",counties,ignore.case = TRUE, value = T)

#counties starting with the letter 'm'
grep("^m",counties,ignore.case = TRUE, value = T)

#counties starting with the letter 'a'
grep("a$",counties,ignore.case = TRUE, value = T)

#mutate: "ok" for 'N' counties and "not ok" for the rest
n_counties = dataset %>% 
  mutate(n_counties = ifelse(County %in% grep("^n",County,ignore.case = TRUE,value = T),"okay","not okay"))

#dataset containing counties ending with 'a'
counties_a = dataset %>% 
  filter(County%in% grep("a$",County,ignore.case = TRUE,value = T))

#dataset containing departments with analysts
analysts = dataset%>%
  filter(Department %in% grep("Analyst", Department,ignore.case = TRUE, value = T))

#transmute
transmuted_data = df %>% 
  transmute(transmuted_data = ifelse(Gender=="Male", "mme", "mke"))

#arrange
arrange_data = df %>% 
  arrange(County, desc(Age))
arrange_data2 = df %>% 
  arrange(desc(Age),County)
arrange_data3 = df %>% 
  arrange(County %in% grep("^K", County, ignore.case = TRUE,value = T))

  

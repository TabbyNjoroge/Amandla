## Name: Tabitha
## Assignment: Data manaipulation using some dyplyr functions
## Date: 29th February, 2020

## You are provided with the Financial Inclusion in Africa dataset, 
## which is hosted on the Zindi platform. https://zindi.africa/competitions/financial-inclusion-in-africa.
## Use the dataset to answer the questions below.

##1. At the beginning of the training, we learnt how to tell a story from data.
## List down 5 or more questions that we can ask from the dataset.

#importing the data.
fin_data = read.csv("C:/Users/Peter/Desktop/Wambui-Rstudio/rjourney/datasets/Train_v2.csv")

#5 or more questions that we can ask from the dataset.
####Which job type are people with bank accounts likely to be under?
####What's the age group of females with bank accounts?
####Are people with cell phones more likely to have bank accounts?
####How many Kenyan secondary children have a bank account?
####How many Tanzanian people with bank accounts are in informal employment?
####How many people with bank accounts are from Rural areas?
####How many married self employed males have bank accounts?
####How many individuals from large household sizes(>4) have atleast Secondary education and have bank accounts?
####Which year(2016/2017/2018) did people from Rwanda open the most bank accounts?
####How many heads of households are from Urban areas and have bank accounts?
-

##2. Generate a dataset that only contains observations from Kenya. We will 
## use this dataset to answer subsequent questions. Call the dataset Kenya_df
  
### We first launch the tidyverse package where the dyplyr package is contained.
library(tidyverse)

##Now the dataset:
fin_dataK = fin_data %>%
  filter(country == "Kenya")


##3. Drop the "unique_id" and "year" variables from the dataset.

new_fin_dataK =fin_dataK %>% 
  select(-uniqueid, -year)

##4. Generate a variable called "household_cat" that re-categorizes the "household
## size" variable into 5 groups. Group 1 (1-5), Group 2 (6-10), Group 3 (11-15),
## Group 4 (>15). 

household_cat = fin_dataK %>% 
  mutate(household_cat = ifelse(household_size >=1 & household_size <= 5, "Group 1",
         ifelse(household_size >= 6 & household_size <= 10, "Group 2",
         ifelse(household_size >= 11 & household_size <= 15, "Group 3","Group 4"))))


##5. Generate a variable called "age_cat" that categorizes the "age" variable into three buckets.
## Use limits of your own choice.

age_cat = fin_dataK %>% 
  mutate(age_cat = ifelse(age_of_respondent >= 15 & age_of_respondent <= 35, "youth",
                          ifelse(age_of_respondent >= 36 & age_of_respondent <= 65,"senior adults", "senior citizens")))

##6. Generate a variable called "relationship_with_head2", that combines the 
## "other relative" and "Other non-relatives" options of the "relationship_with_head"
## variable into a single option called "other".

relationship_with_head2 = fin_dataK %>%
  mutate(relationship_with_head2 = ifelse(relationship_with_head %in% 
                                            grep("relative",relationship_with_head, 
                                                 ignore.case = TRUE, value = T), "other", ""))

         
##7. Generate a dataset that contains self employed ladies who have never been married,
## they have no cellphone access, but they have bank accounts. Call this dataset "empowered".

empowered = fin_dataK %>%
  filter(gender_of_respondent == "Female",
         job_type == "Self employed",
         marital_status == "Single/Never Married",
         cellphone_access == "No",
         bank_account == "Yes")
empowered

  
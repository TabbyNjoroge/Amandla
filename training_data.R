####Reading in the training data###
library(dplyr)
library(tidyverse)
library(ggplot2)

data = read.csv("C:/Users/Peter/Desktop/Wambui-Rstudio/Wambui-Rstudio/training_data.csv")

tab1 = data %>% 
  select(ID, Q1, Q2) %>% 
  mutate(gender = ifelse(Q2 == 1, "Male", "Female")) %>% 
  rename(age = Q1) %>% 
  mutate(age_groups = ifelse(age >= 15 & age <=35, "Youth",
                       ifelse(age >= 36 & age <= 65, "Mid-age","Senior Citizens"))) %>% 
  group_by(age_groups, gender) %>% 
  summarise(age_groups_count = n())


 
age_bargraph = ggplot(data = tab1, aes(x = age_groups, y = age_groups_count, fill = gender))+
                        geom_bar(stat = "identity", position = "dodge")+
                        geom_text(aes(label = age_groups_count), hjust = 0.5, vjust = -0.25, 
                                  size = 4, color = "red", position = position_dodge(width = 0.7))+
                         theme(plot.title = element_text(size = 12, hjust = 0.5, color = "blue"),
                                 plot.caption = element_text(size = 2, face = "italic"),
                                 axis.title = element_text(face = "bold", size = 8, hjust = 0.5),
                                 axis.text = element_text( size = 6),
                                 axis.line = element_line(size = 0.2),
                                 panel.background = element_rect(fill = "NA"))+
                                 scale_fill_manual(values = c("purple", "pink"))+
                labs(title = "Gender Count \n in the \n different age groups", caption = "FSDT 2017",
                     x = "Age_groups", y = "Count")
age_bargraph 

bg_theme = theme(plot.title = element_text(size = 12, hjust = 0.5, color = "blue"),
                plot.caption = element_text(size = 2, face = "italic"),
                axis.title = element_text(face = "bold", size = 8, hjust = 0.5),
                axis.text = element_text( size = 6),
                axis.line = element_line(size = 0.2),
                panel.background = element_rect(fill = "NA"))

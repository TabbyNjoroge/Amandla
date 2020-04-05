## Name: Tabitha Njoroge
## Date: 23rd March, 2020
## Description: ggplot2

## Types of graphs
##1. Bar graphs - Done
##2. Line graphs
##3. Scatter plots
##4. Histograms
##5. Box plots
##6. Area plots
##7. Alluvial plots

##Loading the packages
library(ggplot2)
library(tidyverse)
library(dplyr)

#Getting the data
df = read.csv("C:/Users/Peter/Desktop/Wambui-Rstudio/rjourney/wafanyikazi - wafanyikazi.csv")

## 1. Bar Graphs
## 1.1 Bar graph of one grouping variable
## First we generate a table that shows the distribution per department
dept  = df %>% 
  group_by(Department) %>% 
  summarise(count = n())
                
bg_dept = ggplot(data = dept, aes (x = Department, y = count)) +
                  geom_bar(stat = "identity",fill = "red") +
                  geom_text(aes(label = count), hjust = 0.5, vjust = -0.25) +
                  theme(plot.title = element_text(face = "bold", hjust = 0.5, colour = "blue", size = 16),
                        plot.subtitle = element_text(face = "bold",size = 12, hjust = 0.5, colour = "blue"),
                        plot.caption = element_text(face = "italic",size = 6, colour = "blue"),
                        axis.title = element_text(face = "italic", size = 10),
                        axis.text = element_text(face = "bold", size = 10),
                        axis.line = element_line(size = 1.3),
                        panel.background = element_rect(fill = "NA")) +
                  labs(title = "Department Frequency", subtitle = "Barplot", caption = "Figure 1.1",
                       x = "Department",
                       y = "Frequency")
bg_dept

#Giving the bargraph theme an object name for reptitive use
plot_theme = theme(plot.title = element_text(face = "bold", hjust = 0.5, colour = "blue", size = 16),
              plot.subtitle = element_text(face = "bold",size = 8, hjust = 0.5, colour = "blue"),
              plot.caption = element_text(face = "italic",size = 6, colour = "blue"),
              axis.title = element_text(face = "italic", size = 10),
              axis.text = element_text(face = "bold", size = 8),
              axis.line = element_line(size = 1.3),
              panel.background = element_rect(fill = "NA"))


## 1.1 Bar graph of two grouping variable
## Generate a table that shows the distribution of average age per department and per role(double bars)

age_dept_role = df %>% 
  group_by(Department, Role) %>% 
  summarise(average_age = round(mean(Age),0))
age_dept_role

bg_age = ggplot(data = age_dept_role, aes(x = Department, y = average_age, fill = Role))+
         geom_bar(stat = "identity", position = "dodge") +
         geom_text(aes(label = average_age), hjust = 0.5, vjust = -0.25, 
                   position = position_dodge(width = 0.9)) +
         plot_theme+
         scale_fill_manual(values = c("blue","red","purple"))+
         labs(title = "Average Age \n per \n Department and Role", subtitle = "Barplot", caption = "Figure 1.2",
                    x = "Role",
                    y = "Average Age")
bg_age

#2. Linegraphs
#2.1. Linegraph for one variable data

#Using the game goals data
game_goals <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-03/game_goals.csv')

player7 = game_goals %>%
  filter(player == "Dave Andreychuk") %>%
  group_by(season) %>%
  summarise(count = n())
player7

dave = ggplot(data = player7, aes(x = season, y = count))+
       geom_line(size = 0.6, color = "red")+
       geom_text(aes(label = count), size = 4)+
       theme(plot.title = element_text(face = "bold", size = 14, hjust = 0.5, colour = "purple"),
             plot.subtitle = element_text(face = "bold", size = 12, colour = "purple", hjust = 0.5),
             plot.caption = element_text(face = "bold", colour = "red", size = 6, ),
             axis.title = element_text(face = "italic", size = 10),
             axis.text = element_text(face = "bold", size = 8, hjust = 0.5),
             axis.line = element_line(size = 1.5),
             panel.background = element_rect(fill = "NA"))+
       labs(title = "Number of games per season", subtitle = "Dave Andreychuk",
           caption = "Prepared by Tabitha",
           x = "Team", y = "Count" )
dave

#linegraph for two variable data
Week <- c("W1","W2","W3","W4","W5","W6","W7","W8","W9","W10")
Financial_fitness <- c(6170,4081,4870,4393,6136,6696,6351,5984,5282,6496)
SRH <- c(6199,7432,8858,7653,8060,6744,8300,7860,7540,7010)
Governance <- c(1835,1612,1365,1387,1879,2394,1538,1603,1269,2129)

messages = data.frame(Week, Financial_fitness, SRH, Governance)
messages

messages_df = messages %>%
  pivot_longer(c(Financial_fitness, SRH, Governance),
               names_to = "Campaign",
               values_to = "No_of_messages")

messages_df1 <- messages_df %>% 
  mutate(Week = factor(Week, levels = c("W1","W2","W3","W4","W5","W6","W7","W8","W9","W10"),
                       labels = c("W1","W2","W3","W4","W5","W6","W7","W8","W9","W10")))

linegraph2 <- ggplot(data = messages_df1, aes(x = Week, y = No_of_messages, group = Campaign, color = Campaign))+
              geom_line(size = 1) +
              geom_text(aes(label = No_of_messages), size = 3, colour = "black", vjust = -0.5)+
              theme(plot.title = element_text(face = "bold", hjust = 0.5,size = 12),
                    axis.title = element_text(size = 12,face = "bold"),
                    axis.text = element_text(size = 9),
                    axis.line = element_line(size = 1,colour = "maroon"),
                    plot.subtitle = element_text(hjust = 0.5,size = 14),
                    plot.caption = element_text(face = "bold",size = 6),
                    panel.background = element_rect(fill = "NA"))+
              labs(title = "Weekly SMS messages received per campaign",
                   x = "Week",
                   y = "Number of messages",
                   caption = "Figure 2.2")
linegraph2
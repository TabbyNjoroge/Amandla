## Name: Shelmith Kariuki
## Date: 24th March, 2020
## Description: ggplot2 : tiny tricks

## Load the ggplot2 library
library(tidyverse)
library(ggplot2)

## Read in the wafanyikazi dataset
#df <- rChambua::wafanyikazi
df = read.csv("C:/Users/Peter/Desktop/Wambui-Rstudio/rjourney/datasets/wafanyikazi.csv")


## Specify the theme before hand
amandla_theme <- theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 16),
                       axis.title = element_text(size = 14),
                       axis.text = element_text(size = 12),
                       axis.line = element_line(size = 1.5),
                       plot.subtitle = element_text(hjust = 0.5, size = 14),
                       plot.caption = element_text(face = "bold", size = 12),
                       panel.background = element_rect(fill = NA))

## 1. Facet wraps and Facet Grids
### facet wrap is used when we want to facet our plot using one variable

scatterplot1 <- ggplot(data = df, aes(x = Age, y = Income))+
  geom_point(size = 3, color = "red") +
  amandla_theme +
  labs(title = "Relationship between Age and Income",x = "Age", y = "Income") +
  facet_wrap(~Role, nrow = 2)
scatterplot1

tab3 <- df %>% 
  group_by(Role, Gender) %>% 
  summarise(avg_income = round(mean(Income, na.rm = TRUE),0))

bargraph1 <- ggplot(data = tab3, aes(x = Role, y = avg_income))+
  geom_bar(stat = "identity", position = "dodge", fill = "brown")+
  geom_text(aes(label = avg_income), hjust = 0.5, vjust = -0.25, size=6,
            position = position_dodge(width = 0.9))+
  amandla_theme +
  #scale_fill_brewer(palette = "Blues")+
  #scale_fill_manual(values = c("pink","blue"))+
  facet_wrap(~Gender, ncol = 2)
labs(title = "Average Income \n per \n Role and Gender",subtitle = "Training",
     x = "Role",y = "Average Income",
     caption = "Plot prepared by Shelmith")  
bargraph1

## facet grid is used when we want to facet our plot using two variable

scatterplot2 <- ggplot(data = df, aes(x = Age, y = Income))+
  geom_point(size = 3, color = "red") +
  amandla_theme +
  labs(title = "Relationship between Age and Income",x = "Age", y = "Income") +
  facet_grid(Role ~ Gender )
scatterplot2


tab2 <- df %>% 
  group_by(Role, Gender, Department) %>% 
  summarise(avg_income = round(mean(Income, na.rm = TRUE),0))

bargraph2 <- ggplot(data = tab2, aes(x = Role, y = avg_income))+
  geom_bar(stat = "identity", position = "dodge", fill = "red")+
  geom_text(aes(label = avg_income), hjust = 0.5, vjust = -0.25, size=4,
            position = position_dodge(width = 0.9))+
  amandla_theme+
  facet_grid(Department ~ Gender) + 
  labs(title = "Average Income \n per \n Role and Gender",subtitle = "Training",
       x = "Role",y = "Average Income",
       caption = "Plot prepared by Shelmith")  


bargraph2


## 2. Reordering bar graphs by ascending order of the y axis
## Generate a table that shows the distribution per department
tab1 <- df %>% 
  group_by(Department) %>% 
  summarise(Count = n()) %>% 
  mutate(Perc = round(Count / sum(Count)*100,0))

## Generate the bar graph
bargraph1 <- ggplot(data = tab1, aes(x = reorder(Department,-Count), y = Count)) +
  geom_bar(stat = "identity", fill = "brown") +
  geom_text(aes(label = Count), hjust = 0.5, vjust = -0.25, size = 3) +
  amandla_theme+
  labs(title = "Distribution of Respondents",
       x = "Department",
       y = "Frequency")
bargraph1


## 3. Flipping graphs

## Generate the bar graph
bargraph1a <- ggplot(data = tab1, aes(x = reorder(Department,Count), y = Count)) +
  geom_bar(stat = "identity", fill = "brown") +
  geom_text(aes(label = Count), hjust = -0.25, vjust = 0.5 , size = 4) +
  amandla_theme+
  coord_flip() +
  labs(title = "Distribution of Respondents",
       x = "Department",
       y = "Frequency")
bargraph1a


## Generate the bar graph
bargraph1 <- ggplot(data = tab1, aes(x = reorder(Department,Count), y = Count, fill=Department)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Count), hjust = -0.25, vjust = 0.5 , size = 4) +
  amandla_theme+
  theme(legend.position = "none") +
  coord_flip() +
  scale_fill_brewer(palette = "BrBG") +
  labs(title = "Distribution of Respondents",
       x = "Department",
       y = "Frequency")
bargraph1

##4. Change the legend position

## Generate the bar graph
bargraph1 <- ggplot(data = tab1, aes(x = reorder(Department,Count), y = Count, fill=Department)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Count), hjust = -0.25, vjust = 0.5 , size = 4) +
  amandla_theme+
  theme(legend.position = "top") +
  coord_flip() +
  scale_fill_brewer(palette = "BrBG") +
  labs(title = "Distribution of Respondents",
       x = "Department",
       y = "Frequency")
bargraph1


##5. Including a % sign on the graph

tab1 <- df %>% 
  group_by(Department) %>% 
  summarise(Count = n()) %>% 
  mutate(Perc = round(Count / sum(Count)*100,0))

## Generate the bar graph
bargraph1 <- ggplot(data = tab1, aes(x = reorder(Department,-Perc), y = Perc)) +
  geom_bar(stat = "identity", fill = "brown") +
  geom_text(aes(label = paste0(Perc,"%")), hjust = 0.5, vjust = -0.25, size = 5) +
  amandla_theme+
  scale_y_continuous(labels = function(x) paste0(x, "%"))+
  labs(title = "Distribution of Respondents",
       x = "Department",
       y = "Percentage")
bargraph1

## 6. How do we alter the breaks of the y axis

## Generate the bar graph
bargraph1b <- ggplot(data = tab1, aes(x = reorder(Department,-Perc), y = Perc)) +
  geom_bar(stat = "identity", fill = "brown") +
  geom_text(aes(label = paste0(Perc,"%")), hjust = 0.5, vjust = -0.25, size = 5) +
  amandla_theme+
  scale_y_continuous(limits = c(0, 22), breaks = seq(0, 22, by = 2),
                     labels = function(x) paste0(x, "%"))+
  labs(title = "Distribution of Respondents",
       x = "Department",
       y = "Percentage")
bargraph1b

## 6. How do we alter the breaks of the y axis

bargraph1 <- ggplot(data = tab1, aes(x = reorder(Department,-Perc), y = Perc)) +
  geom_bar(stat = "identity", fill = "brown") +
  geom_text(aes(label = paste0(Perc,"%")), hjust = 0.5, vjust = -0.25, size = 5) +
  amandla_theme+
  scale_y_continuous(limits = c(0, 22), breaks = seq(0, 22, by = 2),
                     labels = function(x) paste0(x, "%"))+
  labs(title = "Distribution of Respondents",
       x = "Department",
       y = "Percentage")
bargraph1


##7. Truncating graphs based on limits of the x and y axis.

scatterplot1 <- ggplot(data = df, aes(x = Age, y = Income))+
  geom_point(color = "red", size = 3) +
  amandla_theme +
  xlim(c(18,30)) + ylim(c(1000,2500)) +
  labs(title = "Relationship between Age and Income",x = "Age", y = "Income")
scatterplot1

##8. position = "fill" .... nah, let us stick to position = "stack" which is the default

tab1 <- df %>% 
  group_by(Department, Role) %>% 
  summarise(Count = n()) %>% ungroup() %>% 
  group_by(Department) %>% 
  mutate(Perc = round(Count / sum(Count)*100,0))

## Generate the bar graph
bargraph1c <- ggplot(data = tab1, aes(x = reorder(Department,-Perc), y = Perc, fill = Role)) +
  geom_bar(stat = "identity" ) +
  geom_text(aes(label = paste0(Perc,"%")), hjust = 0.5, vjust = 6, size = 5, position = position_stack()) +
  amandla_theme+
  scale_y_continuous(labels = function(x) paste0(x, "%"))+
  scale_fill_manual(values = c("#F29E0F","#30B570","#FF5062")) +
  labs(title = "Distribution of Respondents",
       x = "Department",
       y = "Percentage")
bargraph1c

##9. patchwork

library(patchwork)

windowone <-  (bargraph1b + bargraph1c)/bargraph1a 
windowone
windowtwo <-  (bargraph1b | bargraph1c)/bargraph1a 
windowtwo
windowthree <-  (bargraph1b + plot_spacer() + bargraph1c)/ bargraph1a 
windowthree

windowfour <-  (bargraph1b + plot_spacer() + bargraph1c)/plot_spacer()+ bargraph1a 
windowfour

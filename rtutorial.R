diamondata<-read.csv(file.choose())
install.packages('ggplot2')
library(ggplot2)
ggplot(data=diamondata[diamondata$Salary<2.5,], 
       aes(x=carat,y=price,colour=clarity))+
  geom_point(alpha=0.1)+
  geom_smooth

install.packages('tidyverse')
library(tidyverse)
data=mpg
ggplot(data=mpg)+
         geom_point(mapping=aes(x=displ,y=hwy))
ggplot(data=mpg)
?mpg

ggplot(data=mpg)+
       geom_point(mapping = aes(x=hwy,y=cyl))
ggplot(data = mpg)+
  geom_point(mapping = aes(x=class,y=drv))
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,colour=class))
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,size=class))
ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,y=hwy, shape=class))
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy),colour='blue')
?mpg
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,colour=cty))
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,shape=cty))
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,alpha=cty))
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,colour=cty,alpha=hwy))
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,stroke=displ))
?geom_point
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,colour=displ<5))
head(mpg, 1)
install.packages('zeallot')
library(zeallot)
head(mpg, 1)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y=hwy))+
  facet_grid(.~cyl)
ggplot(data = mpg)+
  geom_point(mapping=aes(x=displ, y=hwy))+
  facet_grid(manufacturer~drv)
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+
  facet_grid(.~drv)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))
?mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))+
  facet_grid(drv ~ cyl)
str(mpg)
dplyr::glimpse(mpg)

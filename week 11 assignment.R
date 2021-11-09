#############read data########

my.data<- read.csv("/Users/T480s/Desktop/INHA/course 2021 fall/R Programm/food-price-index-September-2021-index-numbers-csv-tables.csv",header=T, sep=",",dec = ".", fill = TRUE, comment.char = "")
head(my.data)

names(my.data)

########split data indicated by apples#####

apples<- subset(my.data,Series_title_1=="Apples, 1kg")
head(apples)

##########sort by data_value########

install.packages(plyr)
library(plyr)
order.apple<- arrange(apples,Data_value)
head((order.apple))


#############descriptive statistics for apples data######

install.packages(hmisc)
library(Hmisc)
describe(apples$Data_value)

############# get trend of apples data#####
library(ggplot2)

ggplot(apples,aes(Period,Data_value))+geom_line(stat = "identity")


#######filter orranges whose value>3 from original data and rename it
library(dplyr)

filter.orrange<- filter(.data = my.data,my.data$Data_value>=3,my.data$Series_title_1 == "Oranges, 1kg")
names(filter.orrange)

###########factor function for Series_title_1 colum)
factor(my.data$Series_title_1)

############ get average price value for each product#########
a<- split(my.data$Data_value,my.data$Series_title_1)
sapply(a, mean)

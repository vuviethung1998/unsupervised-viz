#install.packages("ggplot2")
#install.packages("gridExtra")
#install.packages("cowplot")
install.packages("dplyr")
install.packages("hrbrthemes")

library("cowplot")
library("gridExtra")
library(ggplot2)
library(dplyr)
library(hrbrthemes)

feat<-read.csv("../data/feature.csv", encoding='utf-8')
print(feat)

lst_pm25 = feat$PM2.5
print(lst_pm25)
pm25 = data.frame(group = "PM2.5", value = lst_pm25)

ggplot(pm25, aes(x=group, y=value)) +
  geom_boxplot() +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank()) # remove x-label
ggsave('pm25-box-plot.eps',
       device = 'eps',
       path='../output/',
       scale = 1,
       width = 5,
       height = 5,
       units = "cm",
       dpi = 300,
       limitsize = TRUE
       )


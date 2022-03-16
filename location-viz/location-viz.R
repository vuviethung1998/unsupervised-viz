#install.packages("ggplot2")
install.packages("gridExtra")
install.packages("cowplot")
library("cowplot")
library("gridExtra")
library(ggplot2)

get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}


locations1<-read.csv("../data/location_viz_test1.csv")
locations2<-read.csv("../data/location_viz_test2.csv")
locations3<-read.csv("../data/location_viz_test3.csv")
locations4<-read.csv("../data/location_viz_test4.csv")
print(locations1)

# Create subplots
plot1 <- ggplot(locations1, aes(y=latitude, x=longitude, color=label)) + geom_point() 
plot2 <- ggplot(locations2, aes(y=latitude, x=longitude, color=label)) + geom_point() + 
  theme(legend.position="none")
plot3 <- ggplot(locations3, aes(y=latitude, x=longitude, color=label)) + geom_point() + 
  theme(legend.position="none")
plot4 <- ggplot(locations4, aes(y=latitude, x=longitude, color=label)) + geom_point() + 
  theme(legend.position="none")
# 2. Save the legend
#+++++++++++++++++++++++
legend <- get_legend(plot1)
# 3. Remove the legend from the box plot
#+++++++++++++++++++++++
plot1 <- plot1 + theme(legend.position="none")

pic <- grid.arrange(plot1, plot2, plot3, plot4, legend, ncol=5, widths=c(2.3, 2.3, 2.3, 2.3, 0.8))

ggsave(file="../output/loc_viz.eps", pic)

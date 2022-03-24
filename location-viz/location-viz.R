# read the data 
data<-read.csv("../data/location_viz_test3.csv",header=T,sep=",")

# define the min, max of x and y 
max_x <- max(data$longitude)
min_x <- min(data$longitude)
max_y <- max(data$latitude)
min_y <- min(data$latitude)

# export to eps file 
setEPS()
postscript("test3_distribution.eps",height=6, width=6)

# define the margin of the figure 
par(mar=c(5, 5, 1, 1) + 0.1)
par(mgp = c(3, 1, 0))

# define the color 
plot_colors <-  c("#FF0000", "#00FF00","#0000FF")

# define the plot range 
plot(c(min_x,max_x),c(min_y,max_y), type="n", cex.lab = 1.5, cex.axis=1.5, xlab="Longitude", ylab="Latitude")

# draw line, 
# pch: type of point, lty: type of line 
# col: color of line and point 
# cex: size of point, lws: width of line 

s1 <- data[data$c == "#FF0000",]
s2 <- data[data$c == "#00FF00",]
s3 <- data[data$c == "#0000FF",]
s1$longitude

lines(s1$longitude, s1$latitude, type="o", pch=17, lty=0, col=plot_colors[1], cex=.8, lwd=1.5)
lines(s2$longitude, s2$latitude, type="o", pch=8, lty=0, col=plot_colors[2], cex=.8, lwd=1.5)
lines(s3$longitude, s3$latitude, type="o", pch=16, lty=0, col=plot_colors[3], cex=.8, lwd=1.5)
abline(h=0, col="blue")

#draw the legend 
legend(bty = "o","topright",c("Train stations","Validation stations", "Test stations"),pch=c(8,16,17), lty=c(0,0,0), col=plot_colors, cex=1.2, x.intersp=1, y.intersp=1.5)
dev.off()

# # draw the confidence intervals which are vertical segments at every point. 
# arrows(x0=data$area, y0=data$bcp_av-data$bcp_err, x1=data$area, y1= data$bcp_av+data$bcp_err, code=3, angle=90, length = 0.05, col=plot_colors[1])
# arrows(x0=data$area, y0=data$hach_av-data$hach_err, x1=data$area, y1= data$hach_av+data$hach_err, code=3, angle=90, length = 0.05, col=plot_colors[2])
# arrows(x0=data$area, y0=data$hpa_av-data$hpa_err, x1=data$area, y1= data$hpa_av+data$hpa_err, code=3, angle=90, length = 0.05, col=plot_colors[3])


# #install.packages("ggplot2")
# #install.packages("gridExtra")
# #install.packages("cowplot")
# library("cowplot")
  # library("gridExtra")
# library(ggplot2)
# 
# get_legend<-function(myggplot){
#   tmp <- ggplot_gtable(ggplot_build(myggplot))
#   leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
#   legend <- tmp$grobs[[leg]]
#   return(legend)
# }
# 
# 
# locations1<-read.csv("../data/location_viz_test1.csv")
# locations2<-read.csv("../data/location_viz_test2.csv")
# locations3<-read.csv("../data/location_viz_test3.csv")
# #locations4<-read.csv("../data/location_viz_test4.csv")
# print(locations1)
# 
# # Create subplots
# plot1 <- ggplot(locations1, aes(y=latitude, x=longitude, color=label)) + geom_point() 
# plot2 <- ggplot(locations2, aes(y=latitude, x=longitude, color=label)) + geom_point() + 
#   theme(legend.position="none")
# plot3 <- ggplot(locations3, aes(y=latitude, x=longitude, color=label)) + geom_point() + 
#   theme(legend.position="none")
# # plot4 <- ggplot(locations4, aes(y=latitude, x=longitude, color=label)) + geom_point() + 
# #   theme(legend.position="none")
# # 2. Save the legend
# #+++++++++++++++++++++++
# legend <- get_legend(plot1)
# # 3. Remove the legend from the box plot
# #+++++++++++++++++++++++
# plot1 <- plot1 + theme(legend.position="none")
# 
# pic <- grid.arrange(plot1, plot2, plot3, legend, ncol=5, widths=c(2.3, 2.3, 2.3, 2.3, 0.8))
# 
# ggsave(file="../output/loc_viz.eps", pic)
# 

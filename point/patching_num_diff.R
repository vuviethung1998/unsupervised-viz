# read the data 
data<-read.table("patching_num_diff.dat",header=T,sep="\t")

# define the min, max of x and y 
max_x <- max(data$area)
min_x <- min(data$area)
max_y <- max(data$telpac_av, data$bcp_av, data$hach_av, data$hpa_av)
min_y <- min(data$telpac_av, data$bcp_av, data$hach_av, data$hpa_av)

# export to eps file 
setEPS()
postscript("patching_num_diff.eps",height=6, width=6)

# define the margin of the figure 
par(mar=c(5, 5, 1, 1) + 0.1)
par(mgp = c(3, 1, 0))

# define the color 
plot_colors <-  c("darkorange3", "darkorchid1","cyan4")

# define the plot range 
plot(c(min_x,max_x),c(min_y,max_y), type="n", cex.lab = 1.5, cex.axis=1.5, xlab=expression(paste("Hole area ( x 1000 ",m^2, ")")), ylab="Difference on the number of patching sensors")

# draw line, 
# pch: type of point, lty: type of line 
# col: color of line and point 
# cex: size of point, lws: width of line 
lines(data$area, data$hach_av, type="o", pch=8, lty=0, col=plot_colors[2], cex=.8, lwd=1.5)
lines(data$area, data$hpa_av, type="o", pch=16, lty=0, col=plot_colors[3], cex=.8, lwd=1.5)
lines(data$area, data$bcp_av, type="o", pch=17, lty=0, col=plot_colors[1], cex=.8, lwd=1.5)
abline(h=0, col="blue")

# draw the confidence intervals which are vertical segments at every point. 
arrows(x0=data$area, y0=data$bcp_av-data$bcp_err, x1=data$area, y1= data$bcp_av+data$bcp_err, code=3, angle=90, length = 0.05, col=plot_colors[1])
arrows(x0=data$area, y0=data$hach_av-data$hach_err, x1=data$area, y1= data$hach_av+data$hach_err, code=3, angle=90, length = 0.05, col=plot_colors[2])
arrows(x0=data$area, y0=data$hpa_av-data$hpa_err, x1=data$area, y1= data$hpa_av+data$hpa_err, code=3, angle=90, length = 0.05, col=plot_colors[3])

#draw the legend 
legend(bty = "n","topleft",c("BCP - TELPAC","HACH - TELPAC", "HPA -TELPAC"),pch=c(17,8,16), lty=c(0,0,0), col=plot_colors, cex=1.2, x.intersp=1, y.intersp=1.5)

dev.off()


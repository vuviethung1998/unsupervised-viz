##### read data 
data<-read.table("lifetime_node.dat",header=T,sep="\t")

##### define data range 
max_x <- max(data$node) ## minimum x 
min_x <- min(data$node)  ## maximum x
max_y <- max(data$inma, data$qlearning, data$nocharge)  ## minimum y
min_y <- min(data$inma, data$qlearning, data$nocharge)  ## maximum x
### max_e <- max(data$inma_e, data$qlearning_e, data$nocharge_e)  ### maximum error 

##### export eps file 
setEPS()
postscript("node.eps",height=6.5, width=6.5)

##### define margins 
par(mar=c(5, 5, 1, 1) + 0.1)
par(mgp = c(3, 1, 0))

##### define colors 
plot_colors <-  c( "blue","darkgreen", "purple", "red")

##### define plot area 
##### xlab, ylab are the titles of the x-axis, y-axis 
##### use expression for math formulars 
##### at = seq(200, 400, by = 50) is for the ticks. ommit this if you want to use the default value 
##### cex is the size 
plot(c(min_x,max_x),c(min_y, max_y), type="n", xaxt="n", cex.lab = 1.5, cex.axis=1.5, xlab="The number of sensors", ylab=expression(paste("Network lifetime (", 10^3, "s)")))
axis(1, at = seq(200, 400, by = 50), las=1,  cex.axis=1.5)

##### to draw lines 
##### pch is the type of point; lty is the type of line; col is the color; lwd is the weight of the line, cex is the size of the point. 
lines(data$node, data$qlearning, type="o", pch=0, lty=1, col=plot_colors[1], lwd=2.5, cex = 1.6)
lines(data$node,data$gsa, type="o", pch=1, lty=1, col=plot_colors[2], lwd=2.5, cex = 1.6)
lines(data$node, data$inma, type="o", pch=2, lty=1, col=plot_colors[3], lwd=2.5, cex = 1.6)
lines(data$node, data$nocharge, type="o", pch=5, lty=1, col=plot_colors[4], lwd=2.5, cex = 1.6)

###### to draw condidence intervals
#arrows(x0=data$sensor_num, y0=data$galm-data$galm_e, x1=data$sensor_num, y1= data$galm+data$galm_e, code=3, angle=90, length = 0.05, col=plot_colors[1])
#arrows(x0=data$sensor_num, y0=data$grlm-data$grlm_e, x1=data$sensor_num, y1= data$grlm+data$grlm_e, code=3, angle=90, length = 0.05, col=plot_colors[2])
#arrows(x0=data$sensor_num, y0=data$inma-data$inma_e, x1=data$sensor_num, y1= data$inma+data$inma_e, code=3, angle=90, length = 0.05, col=plot_colors[3])
#arrows(x0=data$sensor_num, y0=data$no_charge-data$inma_e, x1=data$sensor_num, y1= data$inma+data$inma_e, code=3, angle=90, length = 0.05, col=plot_colors[3])
#arrows(x0=data$sensor_num, y0=data$pso-data$pso_e, x1=data$sensor_num, y1= data$pso + data$pso_e, code=3, angle=90, length = 0.05, col=plot_colors[4])
#legend(bty = "n","topright", c("GALM","GRLM","INMA", "HPSOGA)","No charging"),pch=c(0,2,5,8), lty=c(1,1,1,1,1), col=plot_colors, cex=1.6, x.intersp=1, y.intersp=1.5)

###### to draw the legend
legend(bty = "n","topleft", c("Q-charging", "GSA", "INMA","No charging"),pch=c(0,1,2,5), lty=c(1,1,1,1), col=plot_colors, lwd=2.5, cex=1.6, x.intersp=1, y.intersp=1.5)

dev.off()


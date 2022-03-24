setEPS()

## increase the width to show the legend on the right of the plot 
postscript("fuzzy_output.eps",height=5.5, width=6.8)

## par are the margins around the plot, which are arranged by the order of: bottom, left, top, right. 
## --> increase the fourth parameter of par to show the legend on the right of the plot
par(mar=c(5, 5, 2, 6.5) + 0.1)  

par(mgp = c(3, 1, 0))

x_vlow = c(0,0, 1/3, 1)
y_vlow = c(0,1, 0 , 0)
x_low = c(0,1/3,2/3)
y_low = c(0,1,0)
x_mid = c(0,1/3,2/3,1)
y_mid = c(0,0,1,0)
x_high = c(2/3,1,1)
y_high = c(0,1,0)

min_x = min(x_vlow, x_low, x_mid, x_high)
max_x = max(x_vlow, x_low, x_mid, x_high)
min_y = min(x_vlow, x_low, x_mid, x_high)
max_y = max(x_vlow, x_low, x_mid, x_high)

plot_colors <-  c("red","green4", "dodgerblue3", "chocolate2")

plot(c(min_x,max_x),c(min_y, max_y), type="n", cex.lab = 1.5, cex.axis=1.5, xlab=expression(paste("Theta values (x ", delta, ")")), ylab=expression(paste("Membership degree (", mu, ")")), bty='L')

box(which = "plot", lty = "solid") ## this option is to draw the box aroudn the plot 

lines(x_vlow,y_vlow, type="o", pch="", lty=1, col=plot_colors[1], lwd=2)
lines(x_low,y_low, type="o", pch="", lty=1, col=plot_colors[2], lwd=2)
lines(x_mid,y_mid, type="o", pch="", lty=1, col=plot_colors[3], lwd=2)
lines(x_high,y_high, type="o", pch="", lty=1, col=plot_colors[4], lwd=2)


par(xpd=TRUE) ## use this option to show the legend outside of the plot 

## inset is the distance of the legend from the anchor (i.e., topright)
legend("topright", inset=c(-0.3,0.3), bty = "n",ncol=1, c("VL", "L", "M", "H"),lty=c(1,1,1,1), col=plot_colors, cex=1.5,lwd=2, x.intersp=1, y.intersp=1)


dev.off()
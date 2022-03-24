
### export to eps 
setEPS()

#### set the margin 
par(mar=c(0, 0, 0, 0) )
par(mgp = c(0, 0, 0))

#### the name, and sizes of the exported file 
postscript("n_legend2.eps",height=3, width=8.5)

### define the plot area 
plot(1, type="n", axes=FALSE, xlab="", ylab="")

#### define the colors 
plot_colors <- c("darkgreen", "blue", "purple","red", "darkslateblue")


### plot the legend
### use expression to express the math formulars 
### col is the colors 
### pch=c(0,1,2,4,6) is the id list of the used point types  
### lty=c(1,2,3,4,5) is the id list of the used line types 
### cex is the size 
### ncol is the number of colums. In this example, we have 5 series, then by using "ncol=5" we will have a horizontal legend 
legend(1,1, x.intersp=0.5, c(expression(epsilon==0.5) ,expression(epsilon==0.8),
                             expression(epsilon==1.2),expression(epsilon==1.5),expression(epsilon==2.0)),
       pch=c(0,1,2,4,6), lty=c(1,2,3,4,5), col=plot_colors, cex=1.5, xjust=0.5, yjust=0.5, ncol=5)

### export to eps 
dev.off()

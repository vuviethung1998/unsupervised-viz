# export to eps file 
setEPS()
postscript("result_bar_plot_mse.eps",height=6.85, width=12)

# define the min, max of x and y 
par(mar=c(5.5, 6.5, 1.8, 1) + 0.1)
par(mgp = c(3.5, 1, 0))

# read the data 
#dataRaw <- read.table("all_av_stretch_multi_topo_e20n6.dat",header=T,sep="\t")
dataRawMAE <- read.csv("../data/mae_all_models.csv", sep=',',header = T, encoding='utf-8')
dataRawMSE <- read.csv("../data/mse_all_models.csv", sep=',',header = T, encoding='utf-8')
dataRawMAPE <- read.csv("../data/mape_all_models.csv", sep=',',header = T, encoding='utf-8')

#dataError <- read.table("all_av_stretch_error_multi_topo_e20n6.dat",header=T,sep="\t")
#errorY0 = c(dataError$trueCircle21, dataError$trueRecrangle31, dataError$random62, dataError$random15, dataError$random26)
#errorMargin=c(dataError$trueCircle21Xi, dataError$trueRecrangle31Xi, dataError$random62Xi, dataError$random15Xi, dataError$random26Xi)
dataMean <-data.frame(dataRawMSE$GEDE,dataRawMSE$KIDW.TCGRU,dataRawMSE$BiLSTM.IDW)
max_y = max(dataRawMSE$GEDE,dataRawMSE$KIDW.TCGRU,dataRawMSE$BiLSTM.IDW)
dataMean <- do.call(rbind, dataMean)
dataMean
# define the color
#plot_colors <- c("darkgreen", "darkgreen",  "darkgreen","dodgerblue", "purple","red")
plot_colors <- c("darkgreen","dodgerblue","red")
# draw the bars
barCenters <- barplot(dataMean, beside = TRUE, ylim=c(0,80), names.arg =c("testcase 1", "testcase 2","testcase 3", "average"),
                      angle=c(100,35,120),
                      density=c(6,12,20),
                      #xlab = "Test number",
                      ylab = "MAPE",
                      cex.lab = 2.3, cex.axis=2, cex.names=2.3,
                      col=plot_colors
                      #,legend.text = c(expres3ion(ACOBA(epsilon==0.8)),expression(ACOBA(epsilon==1.2)), expression(ACOBA(epsilon==1.5)),
                      #                        expression(ACOBA(epsilon==2.5)),expression(ACOBA(epsilon==3.0)), "GOAL","BEHDS","GPSR")
                      #  args.legend = list(x = "topleft", bty="n",  cex=1.3, pt.cex = 1,
                      #            y.intersp=1.2, x.intersp=1.5, ncol =4)
)
bar2<- barplot(dataMean,add=TRUE, ylim=c(0,80),cex.lab = 2, cex.axis=2, cex.names=2,beside = TRUE,col=plot_colors,
               angle=c(100,35,120),
               density=c(6,12,20))

# draw the legend
legend("topright", bty = "n", legend=c("GEDE","KIDW-TCGRU","BiLSTM-IDW") ,
       ncol=1, fill=plot_colors, cex=1.5, col=plot_colors, angle=c(100,35,120), density=c(6,12,20))
# legend("topleft",bty = "n", legend=c(expression(ACOBA(epsilon==0.3)),expression(ACOBA(epsilon==1.2)),
#                                      expression(ACOBA(epsilon==2.0)),"GOAL","EHDS","GPSR"),
#        ncol=3, fill=plot_colors, cex=1.5, col=plot_colors, angle=c(100,35,120,45,45,45), density=c(6,12,20,10,15,20))

# #draw the confidence intervals
# arrows(x0=barCenters, y0=errorY0-errorMargin, x1=barCenters, y1= errorY0+errorMargin, code=3, angle=90, length = 0.05, col=plot_colors, lwd=1.2)

dev.off()




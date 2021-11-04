library(ggplot2)
install.packages("dplyr")

#you will have to modify the file path accordingly here 
P <- read.csv("~/Desktop/FinalPaper_RawImages/RawImages&Data_AllFigures/Figure1_Data/DataWithoutBloatedCells.csv")

# Or I can do it this way 
P <- read.csv("~/Desktop/NewFigure6Graphs/DataWithoutBloatedCells.csv")




ggplot(P, aes(x=Treatment, y=FractionOutside)) + geom_bar(stat="identity") + theme_bw() 

#Map according to color. See page 27 in ggplot book. 
ggplot(P, aes(x=Treatment, y=FractionOutside, fill=Treatment)) + geom_bar(stat="identity") + scale_fill_manual(values=c("pink", "red")) + theme_bw() 

ggplot(P, aes(x=Treatment, y=FractionOutside, fill=Treatment)) + geom_boxplot() + scale_fill_manual(values=c("pink", "red")) + theme_bw() + scale_x_discrete(labels=c("Control", "H2O2 Treated")) + theme(axis.text.x = element_text(angle=20, hjust=1, vjust=1)) 

#Box plot covers the 25th to 75th percentage of the data, while the line represents the median 

ggplot(P, aes(x=Treatment, y=FractionOutside, fill=Treatment)) + geom_boxplot() + scale_fill_manual(values=c("pink", "red")) + theme_bw() + scale_x_discrete(labels=c("Control", "H2O2 Treated")) + theme(axis.text.x = element_text(angle=20, hjust=1, vjust=1)) + ylab("Fraction of Flourescence Signal Outside of Pyrenoid") 

one.way <- aov(FractionOutside ~ Treatment, data = P)

summary(one.way)


#Okay we got the following. The results are significant P<.001 

#            Df Sum Sq Mean Sq F value   Pr(>F)    
#Treatment    1 0.3371  0.3371   66.46 4.31e-08 ***
#Residuals   22 0.1116  0.0051                     
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
 

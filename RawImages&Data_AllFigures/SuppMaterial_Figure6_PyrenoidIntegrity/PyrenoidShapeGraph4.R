library(ggplot2)
install.packages("dplyr")

#you will have to modify the file path accordingly here 
P <- read.csv("~/Desktop/FinalPaper_RawImages/RawImages/SuppMaterial_Figure6_PyrenoidIntegrity/TestPyrenoidIntegrity6.csv")

ggplot(P, aes(x=Strain, y=PercentExposure)) + geom_boxplot() + scale_y_continuous(name="Percent Exposure") + theme_bw() + scale_x_discrete(limits=c("CC1009","c1_1","c1_2","c1_3","c1_4", "CC2343"), labels=c("CC-1009","c1_1","c1_2","c1_3","c1_4", "CC-2343"))


m <- aov(PercentExposure ~ Strain, data = P)

#Do the Honest Significant Difference. See page 305 in book. 

TukeyHSD(m)
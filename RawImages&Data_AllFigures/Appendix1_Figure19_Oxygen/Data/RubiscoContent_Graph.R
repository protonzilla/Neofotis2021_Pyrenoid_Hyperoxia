library(ggplot2)

#You will have to change the file path accordingly 
RC<- read.csv("~/Desktop/FinalPaper_RawImages/RawImages/SuppMaterial_Figure19_Oxygen/Data/RubiscoContent_Submit.csv")

ggplot(RC, aes(x=Treatment, y=Mean_Intensity)) + geom_boxplot() + theme_bw() + labs(x="", y="Mean Intensity") 


res.aov <- aov(Mean_Intensity ~ Treatment, data = RC)
# Summary of the analysis
TukeyHSD(res.aov)
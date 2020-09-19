data(iris)
str(iris)
iris$Petal.Length
summary(iris$Petal.Length)
str(iris$Petal.Length)
mean(iris$Petal.Length)
library(ggplot2)
png(file="Histogram.png")
ggplot(iris, aes(Petal.Length))+ 
  geom_histogram(binwidth =2.5, alpha=0.4,col="green",
                 fill="blue", 
                 breaks=seq(1,7,by=0.1)) + 
  labs(title="Histogram of Petal Length")

dev.off()

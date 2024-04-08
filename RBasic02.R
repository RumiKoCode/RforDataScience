#这是一个新的Rstudio与GitHub连接的测试
#测试目的是本地R语言文件能否推送到GitHub仓库中
library(tidyverse)
library(ggplot2)
library(dlookr)

head(mpg)
diagnose(mpg)
diagnose_outlier(mpg)
ggplot(mpg,aes(x=mpg$cty))+
  geom_boxplot()+
  coord_flip()
#测试线性回归模型
head(iris)
mod_sum <- summary(lm(iris$Sepal.Length~iris$Sepal.Width+iris$Petal.Length,iris))
mod_sum
#测试多元线性回归与可视化
iris_lm <- lm(iris$Sepal.Length~iris$Sepal.Width+iris$Petal.Length,iris)
#同质检验
par(mfrow=c(2,2))
plot(iris_lm)


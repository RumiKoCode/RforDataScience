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

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

#主成分分析：利用MSAA包乳腺癌数据
library(MASS)
library(factoextra)
library(ggplot2)

#导入数据并查看结构
data("biopsy")
str(biopsy)
#可以看到数据集有11个变量、699个观察样本，其中class为因子型，水平有两个：良性和恶性
#在进行PCA分析前需要排除或者说筛选掉非数值变量，因为PCA主要与数值数据兼容
data_biopsy <- na.omit(biopsy[,-c(1,11)])
#第一步：计算主成分-----
#数据标准化，将数据缩放为标准正态分布
biopsy_pca <- prcomp(data_biopsy,scale=TRUE)
names(biopsy_pca)
summary(biopsy_pca)
#第二步：计算理想的主成分数-----
#有多种方法可以决定要保留的成分数量
#作为一种替代方案，我们将使用碎石图可视化每个主成分的解释方差百分比
#我们将为应用程序调用factoextra 包的fviz_eig() 函数
fviz_eig(biopsy_pca,addlabels = TRUE,ylim=c(0,70))
#第三步：解释结果-----
#在PCA中，解释结果最常见和有用的图表是biplot图（双标图）
#我们将使用factoextra包的fviz_pca_biplot()函数
#我们还将使用 label="var" 参数来标记变量
fviz_pca_biplot(biopsy_pca,label = "var")





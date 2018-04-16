install.packages("FNN")
library(FNN)

set.seed(1)
x <- sort(rnorm(100))
y<- 3+x^2 + rnorm(100)

eval.n = 100
eval.point = seq(-3,3, length= eval.n)
plot(x, y, pch = 20)
idx.mat<- knnx.index(x, eval.point , k = 1)
yhat = rep(0,eval.n)
for (i in 1:eval.n)   yhat[i]<-mean(y[idx.mat[i,]])
lines(eval.point , yhat, type= 'l', lty = 1, col = 'red')

idx.mat<- knnx.index(x, eval.point , k = 5)
yhat = rep(0,eval.n)
for (i in 1:eval.n)   yhat[i]<-mean(y[idx.mat[i,]])
lines(eval.point , yhat, type= 'l', lty = 2, col = 'blue')

idx.mat<- knnx.index(x, eval.point , k = 30)
yhat = rep(0,eval.n)
for (i in 1:eval.n)   yhat[i]<-mean(y[idx.mat[i,]])
lines(eval.point , yhat, type= 'l', lty = 3, col = 'orange')

legend("bottomright", c("k=1", "k=5", "k=30"), col = c("red", "blue", "orange"),
       lty = c(1,2,3))

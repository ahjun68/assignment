install.packages("FNN")
library(FNN)

#데이터 생성
set.seed(1)
x.tr <- sort(rnorm(100))
y.tr <- 3+x.tr^2 + rnorm(100)

#또 데이터 생성
set.seed(2)
x.te <- sort(rnorm(100))
y.te <- 3+x.te^2 + rnorm(100)

#K-NN 적합
eval.n = 100
eval.point = x.te
yhat.mat=matrix(rep(0,30*eval.n),30,eval.n)
for (j in 1:30)
{
  idx.mat<- knnx.index(x.tr, eval.point , k = j)
  for (i in 1:eval.n)
  {
    yhat.mat[j,i]<-mean(y.tr[idx.mat[i,]])
  }
}

#제곱합 구하기
test.error=rep(0,30)
for (j in 1:30)
{
  test.error[j]=sum((y.te-yhat.mat[j,])^2)
}

#k 선택하기
which.min(test.error)

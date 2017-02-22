# 8.(a)
college = read.csv('data/College.csv') 
fix(college) #8.(b)
college=college[,-1]
fix(college)
#8.(c)
summary(college) # i
pairs(college[,1:10]) # ii
plot(college$Outstate,college$Private) # iii
Elite = rep("No",nrow(college)) # iv
Elite[college$Top10perc > 50] = "Yes" 
Elite=as.factor(Elite)
college=data.frame(college,Elite)
summary(college)
# v
plot(college$Elite, college$Outstate)
par(mfrow=c(2,2))
hist(college$Top25perc)
hist(college$Expend,col=2)
hist(college$S.F.Ratio,col=3)
hist(college$Books,col=4)
# vi
par(mfrow=c(1,1))
plot(college$Accept,college$Outstate)
plot(college$Expend,college$Enroll)
plot(college$Outstate, college$Grad.Rate) # seem to be linearly increasing

#9.
library(ISLR)
head(Auto)
dim(Auto)
summary(Auto)
# 9. (a)
#quantative - name, origine,
#qualitative - mpg, displacement, horsepower, weigth, acceleration, year, cylinders

#9. (b)
range(Auto$mpg) #9.0 46.6
or
sapply(Auto[, 1:7], range)

#9.(c)
sapply(Auto[,1:7],mean)
sapply(Auto[,1:7],sd)

#9.(d)
newAuto = Auto[-(10:85),]
sapply(newAuto[,1:7],mean)
sapply(newAuto[,1:7],sd)
sapply(newAuto[,1:7],range)


#9.(e)
pairs(Auto)
plot(Auto$mpg,Auto$cylinders)
# mpg goes down whith increase in cylinders
plot(Auto$mpg,Auto$displacement)
plot(Auto$horsepower,Auto$weight)
#more horsepower means heavyer weight

#9.(e)
pairs(Auto)
#from the plots mpg seem to have some kind of linear relation with all other features so we may be able to predict mpg with other features


#10
library(MASS)
#10.(a)
nrow(Boston)
ncol(Boston)
Boston[0,]
dim(Boston)

#10. (b)
pairs(Boston)

#10. (c)
plot(log(Boston$crim),Boston$age)
#more crime is seen at old homes
plot(log(Boston$crim),Boston$nox)
#more crime is seen at more nitrogen oxides
plot(Boston$crim,Boston$dis)
#crime rate is more at employment centres
plot(Boston$medv,log(Boston$dis))

plot(Boston$medv,Boston$lstat)
#prise is less in lower status of the polputation

#10. (d)
par(mfrow=c(1,3))
hist(Boston$crim[Boston$crim>1], breaks=25)
hist(Boston$tax, breaks=25)
#there is lot of differnce in tax rate particularly at 700+
#10.(e)
dim(subset(Boston, chas == 1)) #[1] 35 14

#10.(f)
median(Boston$ptratio) # 19.05
#10 (g)
t(subset(Boston, medv == min(Boston$medv)))

library(MASS)
library(class)
#help(biopsy)

biopsyAdjustment <- na.omit(biopsy)

L <- sample(1: nrow(biopsyAdjustment), round(nrow(biopsyAdjustment)/3))

train <- biopsyAdjustment[-L, 2:10]

test <- biopsyAdjustment[L, 2:10]

cl <- factor(biopsyAdjustment[-L, 11])

fit <- knn(train, test, cl, k = 2)

c_matrix = table(fit[1: length(L)], factor(biopsyAdjustment[L, 11]))

print(c_matrix)

cat('Acuracy', sum(diag(c_matrix))/sum(c_matrix)*100, '%')


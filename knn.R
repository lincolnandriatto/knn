library(MASS)
library(class)
#help(biopsy)

biopsyAjust <- na.omit(biopsy)

L <- sample(1: nrow(biopsyAjust), round(nrow(biopsyAjust)/3))

train <- biopsyAjust[-L, 2:10]

test <- biopsyAjust[L, 2:10]

cl <- factor(biopsyAjust[-L, 2:11])

fit <- knn(train, test, cl, k = 2)

c_matrix = table(fit[1: length(L)], factor(biopsyAjust[L, 11]))

print(c_matrix)

cat('Acuracy', sum(diag(c_matrix))/sum(c_matrix)*100, '%')


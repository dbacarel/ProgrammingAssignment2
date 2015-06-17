source('~/Coursera/ProgrammingAssignment2/cachematrix.R')

print("Test start.")

m1 <- matrix(rnorm(1:9),nrow = 3,ncol = 3, byrow = FALSE)
m2 <- matrix(rnorm(1:9),nrow = 3,ncol = 3, byrow = FALSE)
m3 <- matrix()

inverse_m1 <- solve(m1)
inverse_m2 <- solve(m2)
inverse_m3 <- solve(m3)


cM <- makeCacheMatrix(m1)



#Check if get function is correct
stopifnot(identical(cM$get(), m1))

#Check if getInverse return NULL on a newly created object
stopifnot(identical(cM$getInverse(), NULL))

#Check if setInverse function is correct
cI1 <- cacheSolve(cM)
cM$setInverse(cI1)
stopifnot(identical(cM$getInverse(), cI1))


#Check if set function is correct
cM$set(m2)
stopifnot(identical(cM$get(), m2))
stopifnot(identical(cM$getInverse(), NULL))

#Set to an empty matrix
cM$set(m3)
stopifnot(identical(cM$get(), matrix()))
stopifnot(identical(cM$getInverse(), NULL))

print("Test success.")
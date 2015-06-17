## 'makeCacheMatrix' and 'cacheSolve' are 2 utility functions to represent a matrix

## Create a wrapper object for the matrix 'x' providing utility functions to set/get its inverse,
## as also to get 'x' and reinitiate the object state with a new matrix 'm'

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    
    #Setter functions 
    set <- function(m) {
        x <<- m
        inverse <<- NULL
    }
    setInverse <- function(i) inverse <<- i
    
    #Getter functions
    get <- function() x
    getInverse <- function() inverse
    
    #Return public API
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Return a matrix that is the inverse matrix of the object 'x' returned by makeCacheMatrix.
## If 'x' has already the inverse matrix in cache, then this function returns the cached matrix;
## Otherwise it computes the inverse 'x^(-1)', stores it in 'x' and returns 'x^(-1)'

cacheSolve <- function(x, ...) {
    
    #Access matrix X and check if its inverse is in cache
    inverse <- x$getInverse()
    if (is.null(inverse)){
        #Compute inverse and set into matrix x
        m <- x$get()
        inverse <- solve(m)
        x$setInverse(inverse)
    }
    #Return inverse of x
    inverse
}

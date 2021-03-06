## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  M <- NULL
  set <- function(y) {
    x <<- y
    M <<- NULL
  }
  get <- function() x
  setmatrix <- function(inverse) M <<- inverse
  getmatrix <- function() M
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix above. If the inverse has already been calculated 
##(and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  M <- x$getmatrix()
  if(!is.null(M)) {
    message("getting cached data")
    return(M)
  }
  data <- x$get()
  M <- solve(data, ...)
  x$setmatrix(M)
  M
}

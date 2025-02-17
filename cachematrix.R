## 
## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than computing it
## repeatedly. Therefore, the below pair of functions cache the inverse of a
## matrix.

## For this assignment, it is assumed that the matrix supplied is always
## invertible.


## Function 'makeCacheMatrix' creates a special "matrix" object that can cache
## its inverse.
## Computing the inverse of a square matrix is done with the `solve` function
## in R. The cache is stored in 's'.

makeCacheMatrix <- function(x = matrix()) {

  s <- NULL
  
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  
  get <- function() x
  
  setsolve <- function(solve) s <<- solve
  
  
  getsolve <- function() s
  
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
  
}


## This function computes the inverse of the special "matrix" returned by
## `makeCacheMatrix` above. If the inverse has already been calculated (and the
## matrix has not changed), then `cacheSolve` should retrieve the inverse from
## the cache.

cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  
  ## Return a matrix that is the inverse of 'x'
  s
}

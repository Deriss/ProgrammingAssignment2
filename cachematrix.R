
## functions that cache the inverse of a matrix
## 

## creates a "matrix" object whose inverse can be cached.

makeCacheMatrix <- function(x = matrix()) {
                    inverse <<-NULL
                    set <- function(y) {
                      x <<-y
                      inverse <<-NULL
                    }
                    get <-function() x
                    getinverse<-function() inverse
                    setinverse <- function(inv) inverse <-inv
                    list(set = set, get = get,
                         setinverse= setinverse,
                         getinverse = getinverse)
}


## Fuction to return the inverse of a matrix using a matrix object that can cache its inversed

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if (!is.null(inv)){
          message("getting cached data")
          return(inv)
        }
        data <- x$get()
        inv <- solve(data)
        x$setinverse(inv)
        inv
}

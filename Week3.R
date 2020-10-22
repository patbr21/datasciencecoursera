# Week 3 coursera assignment
# set the value of the vector
# get the value of the vector
# set the value of the mean
# get the value of the mean

makeCacheMatrix <- function(x = matrix()) { ## create a matrix object x 
        m <- NULL               ## define the cache m
        set <- function(y) {
                x <<- y         ## assign the input matrix y to the variable x in the
                                ## parent environment
                m <<- NULL      ## re-initialize m in the parent environment to null
        }
        get <- function() x     ## return the matrix x
        setinverse <- function(inverse) m <<- inverse ## set the cache m equal
        ## to the inverse of the matrix x
        getinverse <- function() m ## return the cached inverse of x
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

# The following function calculates the mean of the special "Matrix" # created with the above function. However, it first checks to see if 
# the mean has already been calculated. If so, it gets the mean from the # cache and skips the computation. Otherwise, it calculates the mean
# of the data and sets the value of the mean in the cache via the setmean function.

#----------------- Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
#create accessor function for the getFun slot of IntScore class
if (!isGeneric("getFun")) {
    if (is.function("getFun")){
        fun <- getFun
    }else{
        fun <- function(object) standardGeneric("getFun")
    }
    setGeneric("getFun", fun)
}

setMethod("getFun","siscreen.IntScore", function(object) object@fun)

#create accessor function for the getParams slot of IntScore class
if (!isGeneric("getParams")) {
    if (is.function("getParams")){
        fun <- getParams
    }else{
        fun <- function(object) standardGeneric("getParams")
    }
    setGeneric("getParams", fun)
}

setMethod("getParams","siscreen.IntScore", function(object) object@params)

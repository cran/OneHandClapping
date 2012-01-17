# Author: Sebastian Dümcke <duemcke@genzentrum.lmu.de>

#create accessor function for the validated slot of Screening.validated class
if (!isGeneric("getValidated")) {
    if (is.function("getValidated")){
        fun <- getValidated
    }else{
        fun <- function(object) standardGeneric("getValidated")
    }
    setGeneric("getValidated", fun)
}

setMethod("getValidated","Screening.validated", function(object) object@validated)

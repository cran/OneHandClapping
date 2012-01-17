siscreen.paircluster <-
function(dendrog){
    
    if(length(labels(dendrog)) <= 1){
        return(list())
    }
    if(length(labels(dendrog)) == 2){
        return(list(labels(dendrog)))
    }
    
    return(c(siscreen.paircluster(dendrog[[1]]),siscreen.paircluster(dendrog[[2]])))
}


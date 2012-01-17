pairwiseCoopScreen <-
function(TFtarget,IntScore){

    res = matrix(ncol=length(TFtarget),nrow=length(TFtarget),dimnames = list(names(TFtarget),names(TFtarget)))
    for(i in 1:(length(TFtarget)-1)){
        for(j in (i+1):length(TFtarget)){
            val = do.call(getFun(IntScore),c(list(tf1=names(TFtarget)[i],tf2=names(TFtarget)[j],tflist=TFtarget),getParams(IntScore)))
            res[i,j] = val
        }
    }

    return(res)
}


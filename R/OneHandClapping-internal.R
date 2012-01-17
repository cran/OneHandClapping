.check_interaction <-
function(vec,intmat){ #vec:vector length two
    if(length(intersect(which(intmat[,1] == vec[1]),which(intmat[,2] == vec[2]))) > 0) {
        return(TRUE)
    }else if(length(intersect(which(intmat[,2] == vec[1]),which(intmat[,1] == vec[2]))) > 0) {
        return(TRUE)
    }
    
    return(FALSE)
}
.normMat <-
function(coopMat,diagval=0){
    coopMat[which(is.na(coopMat))] = 0
    coopMat[which(coopMat == -Inf)] = 0
    coopMat[which(coopMat == Inf)] = 0
    diag(coopMat) = diagval
    
    return(coopMat)
}
.toSymm <-
function(mat){
    ret = mat
    ret[lower.tri(ret,diag=F)] = 0
    ret = ret + t(ret)

    return(ret)
}
.vecnorm <-
function(x,type){
    return(sqrt(sum(x^2)))
}

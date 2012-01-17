corDist <-
function(scoremat){
    
    dmat=matrix(0,nrow=nrow(scoremat),ncol=nrow(scoremat),dimnames = list(rownames(scoremat),rownames(scoremat)))
    for(i in 1:(nrow(scoremat)-1)){
        for(j in (i+1):nrow(scoremat)){
            corel = corfun(rbind(scoremat[i,],scoremat[j,]))
            if(is.na(corel)){
                dmat[i,j] = 1
                dmat[j,i] = 1
            }else{
                dmat[i,j] = corel
                dmat[j,i] = corel
            }
        }
    }
    
    return(dmat)
}

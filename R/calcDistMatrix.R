calcDistMatrix <-
function(scoremat,dfun){
    
    if(dfun == "cor"){
        
        dmat = corDist(scoremat)
        dmat = as.dist(dmat)
    }else{
        dmat = dist(scoremat,method=dfun,diag=T,p=3)
    }
    
    return(dmat)
}

siscreen <-
function(TFtarget  #list describing TF-target relation
                    ,IntScore #object storing interaction score calculations
                    ,dfun     #character indicating distance function to use. Can be "cor" or any method accepted by 'dist'
                    ,efun	  #function with dendrogram as signature
                    ,cmeth = "single" #clustering method
                    ,twoints = FALSE
                    ){

    #error checking
    if(length(intersect(unlist(TFtarget),getParams(IntScore)$genes)) <= 0){
        stop("No intersect between annotated target genes and gene measurements. Maybe different IDs?")
    }
    a = lapply(TFtarget,function(x){intersect(x,getParams(IntScore)$genes)})
    rem = sapply(a,length) == 0
    TFtarget = TFtarget[!rem]
    if(sum(rem > 0)){
        warning(paste("Removed",sum(rem),"TFs from list, as they had no overlap with any measured genes."))
    }
    
#1) calculate pairwise interaction scores between all TF from TFtarget
    if(twoints){
    }else{
        scoremat = pairwiseCoopScreen(TFtarget,IntScore)
        #normalize this matrix so that it is symmetric but keep NA values
        scoremat = .toSymm(scoremat)
    }
#2)cluster interaction scores
    dmat = calcDistMatrix(scoremat,dfun) 
    
    if(sum(is.na(dmat)) > 0){
        dmat[is.na(dmat)] = max(dmat,na.rm=T)#set missing value to maximal distance
        warning("distance matrix contained missing values. They have been substituted by highest distance.")
    }
    
    clustering = hclust(dmat,method=cmeth)
#3) get interacting TFs, defined by decision function efun
    interacting = efun(as.dendrogram(clustering))
    
    return(new("Screening",scoremat,tftarget=TFtarget,intscore=IntScore,dfun=dfun,clust=clustering,interactions=interacting,cmeth=cmeth))
}


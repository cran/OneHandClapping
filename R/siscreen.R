siscreen <-
function(TFtarget  #list describing TF-target relation
                    ,IntScore #object storing interaction score calculations
                    ,dfun     #character indicating distance function to use. Can be "cor" or any method accepted by 'dist'
                    ,efun	  #function with dendrogram as signature
                    ,cmeth = "single" #clustering method
                    ,twoints = FALSE
                    ){

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


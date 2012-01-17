setMethod("show","Screening", function(object){
            dfun = object@dfun
            cat("\nSynthetic genetic interaction screen\n\nDistance function:",dfun,"\nInteraction score:",object@intscore@name,"\nClustering:",object@cmeth,"\n\n",sep=" ")
            cat(nrow(object),"x",ncol(object),"matrix\n\n")
            cat("Result:",length(object@interactions),"predicted interactions\n")
            if(class(object)[1] == "Screening.validated"){
                cat("Validation:",length(object@validated),"validated interactions (",round(length(object@validated)/length(object@interactions)*100,2),"%)\n")
                cat("Validation method:",object@valmethod,"\n")
            }
})

setMethod("plot","Screening",function(x,y,col=c("blue","grey","yellow"),granularity=39,damp=0,...){

            a = colorsbreaks(range(x,na.rm=T),maincols=col,granularity=granularity,damp=damp)
            
            if(class(x)[1] == "Screening.validated"){
                colvec = rep("black",ncol(x))
                names(colvec) = rownames(x)
                colvec[unlist(getValidated(x))] = "green"
                heatmap2(.normMat(x),symm=T,Rowv=as.dendrogram(x@clust),breaks=a$breaks,col=a$col, labRowCol = colvec, ...)
            }else{
                heatmap(.normMat(x),symm=T,Rowv=as.dendrogram(x@clust),breaks=a$breaks,col=a$col, ...)
            }
            
})

#create accessor function for the interactions slot of Screening class
if (!isGeneric("getInteractions")) {
    if (is.function("getInteractions")){
        fun <- getInteractions
    }else{
        fun <- function(object) standardGeneric("getInteractions")
    }
    setGeneric("getInteractions", fun)
}

setMethod("getInteractions","Screening", function(object) object@interactions)

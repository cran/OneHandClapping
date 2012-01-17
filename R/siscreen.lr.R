siscreen.lr <-
function(	tf1			#first TF
                    ,tf2		#second TF
                    ,tflist		#TF target list
                    ,lods		#gene expression data
                    ,genes		#genes to consider
                    ,thresh=1	#size threshold for groups TF1, TF2, TF1 \intersect TF2
                    ,pval = FALSE#return transformed pvalue
                    ,pvalthresh=1#threshold for pvalue cutoff
                    ,norm = FALSE#normalize beta12 with sd(beta12)
                    ,retcoefs = FALSE
            ){
    
    a = rep("nontarget",length(genes))
    a[genes %in% tflist[[tf1]]] = "target"

    b = rep("nontarget",length(genes))
    b[genes %in% tflist[[tf2]]] = "target"
    
    if(sum(a == "target") < thresh || sum(b == "target") < thresh || sum((a == "target") & (b == "target")) < thresh){
        return(NA)
    }
    
    res = lm(lods[genes,] ~ I(a == "target") * I(b == "target"))
    
    if(retcoefs){
        return(res$coefficients)
    }
    
    if(pval){
        if(any(dim(summary(res)$coefficients) < 4)){
            warning(paste("Could not get pvalue for pair:",tf1,tf2))
            return(NA)
        }
        pval = summary(res)$coefficients[4,4]
        pval = pvalthresh - pval
        return(sign(res$coefficients[4])*pval*(pval>0))
    }else if(norm){
        return(res$coefficients[4]/summary(res)$coefficients[4,2])
    }
    return(res$coefficients[4])
}


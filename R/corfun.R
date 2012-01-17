corfun <-
function(x){
    1 - cor(x[1,],x[2,],method="pearson",use="pairwise.complete.obs")
}

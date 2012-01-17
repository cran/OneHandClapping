#definition of interaction measure between 2 TF
setClass("siscreen.IntScore",representation(fun="function",params="list",name="character"))

#dummy class because 'hclust' is S3 class
setClass("hclust",contains="list")

#definition of interaction screen class. This class will be used for most of the
#following computations
setClass("Screening",representation(tftarget="list",intscore="siscreen.IntScore",dfun="character",clust="hclust",interactions="list",cmeth="character"),contains="matrix")
setClass("Screening.validated",representation("Screening",validated="list",valmethod="character"),contains="Screening")

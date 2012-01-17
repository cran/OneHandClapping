siscreen.validate.biogrid <-
function(siscreen #object of class Screening
                                     ,biogrid #interaction data from BioGRID (nx2 matrix)
                            ) {
    res = getInteractions(siscreen)[sapply(getInteractions(siscreen),.check_interaction,biogrid)]
    return(new("Screening.validated",siscreen,validated=res,valmethod="BioGRID"))
}

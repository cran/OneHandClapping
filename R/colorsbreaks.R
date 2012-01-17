colorsbreaks <-
function(range, maincols, granularity, midpoint=0,rev=F,damp=0.05){
    
    stopifnot(range[1] < range[2] && (range[1] < midpoint && range[2] > midpoint))
    delta_lower = midpoint - range[1]
    delta_upper = range[2] - midpoint
    
    by_lower = delta_lower/granularity
    by_upper = delta_upper/granularity
    breaks = c(seq(range[1],midpoint-by_lower,by=by_lower),seq(midpoint+by_upper,range[2],by=by_upper))
    
    if(which.max(c(delta_lower,delta_upper)) == 2){
        nb_down = (length(breaks) / 2)
        nb_up = (length(breaks) / 2) -1 
    }else{
        nb_down = (length(breaks) / 2) -1
        nb_up = (length(breaks) / 2)
    }
    
    if(rev){
        cols = c(colorRampPalette(rev(c(maincols[1],maincols[2])))(nb_down),colorRampPalette(rev(c(maincols[2],maincols[3])))(nb_up))
    }else{
        cols = c(colorRampPalette(c(maincols[1],maincols[2]))(nb_down),colorRampPalette(c(maincols[2],maincols[3]))(nb_up))
    }
    
    cols[which(breaks > damp*-delta_lower & breaks < midpoint)] = maincols[2]
    cols[which(breaks < damp*delta_upper & breaks > midpoint)] = maincols[2]
    
    return(list(breaks=breaks,col=cols))
}

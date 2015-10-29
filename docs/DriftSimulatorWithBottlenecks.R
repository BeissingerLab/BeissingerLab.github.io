###################################################
###  Function for Calculating Drift             ###
###################################################

## Timothy M Beissinger
## Updated: 1-25-2012

###################################################
# This function will simulate drift for a neutral locus.
#
# Load the function into R with the command: source("/path/to/this/file")
# To run the function, see examples at the bottom of this document
#
# FUNCTION PARAMETERS:
# initial = Assumed allele frequency in the initial population
# total.pop = population size in each generation (number of progeny)
# no.males = Number of males contributing gametes
# no.females = Number of females contributing gametes
# cycles = Number of generations of random mating
# Bottleneck = True or false.  Was there a bottleneck?
# Bottleneck.gen = Cycle when bottleneck occurred
# Bottleneck.no.males = Number of males contributing gametes in bottleneck generation
# Bottleneck.no.females = Number of females contributing gametes in bottleneck generation
# plot = T/F, whether or not a plot should be drawn
#        If T, the plot will sequentially add a line as each
#        simulation is performed.
# sims = number of simulations to perform
#
# The function will return a vector with one element for each simulation performed.
# Each element of the returned vector represents the final allele frequency for one
# simulation.

driftNeutral <- function(initial,total.pop,no.males=total.pop/2,no.females=total.pop/2,cycles=30,Bottleneck=F, Bottleneck.gen=1,Bottleneck.no.males=no.males,Bottleneck.no.females=no.females, plot=F,sims=1){
  no.males=2*no.males  # two alleles for every male
  no.females=2*no.females # two alleles for every female
  Bottleneck.no.males = 2*Bottleneck.no.males
  Bottleneck.no.females = 2*Bottleneck.no.females
  prog <- c(rep("A",initial*total.pop*2),rep("B",(1-initial)*total.pop*2))
  maleprog <- c()
  femaleprog <- c()
  frequency <- c()
  frequency[1] <- length(which(prog=="A"))/length(prog)
  if(Bottleneck==F){
    for(i in 1:cycles){
    maleprog <- sample(prog,size=no.males,replace=T)  #sample male alleles from total population
    maleprog <- rep(maleprog,length.out=total.pop)
    femaleprog <- sample(prog,size=no.females,replace=T) #sample females from total population
    femaleprog <- rep(femaleprog,length.out=total.pop)
    prog <- c(maleprog,femaleprog)
    frequency[i+1] <- length(which(prog=="A"))/(2*total.pop)
  }
  dat <- matrix(nrow={cycles+1},ncol=2)
  dat[,1] <- c(0:cycles)
  dat[,2] <- frequency
  finalfrequencies <- c()
  finalfrequencies[1] <- frequency[cycles+1]
  if(plot==T) plot(dat,type="l",ylim=c(0,1),xlab="Generation",ylab="Frequency")
  }
  if(Bottleneck==T){
    for(i in 1:{Bottleneck.gen-1}){
    maleprog <- sample(prog,size=no.males,replace=T)  #sample male alleles from total population
    maleprog <- rep(maleprog,length.out=total.pop)
    femaleprog <- sample(prog,size=no.females,replace=T) #sample females from total population
    femaleprog <- rep(femaleprog,length.out=total.pop)
    prog <- c(maleprog,femaleprog)
    frequency[i+1] <- length(which(prog=="A"))/(2*total.pop)
  }
    i <- Bottleneck.gen
    maleprog <- sample(prog,size=Bottleneck.no.males,replace=T)  #sample male alleles from total population
    maleprog <- rep(maleprog,length.out=total.pop)
    femaleprog <- sample(prog,size=Bottleneck.no.females,replace=T) #sample females from total population
    femaleprog <- rep(femaleprog,length.out=total.pop)
    prog <- c(maleprog,femaleprog)
    frequency[i+1] <- length(which(prog=="A"))/(2*total.pop)
    for(i in {Bottleneck.gen+1}:cycles){
    maleprog <- sample(prog,size=no.males,replace=T)  #sample male alleles from total population
    maleprog <- rep(maleprog,length.out=total.pop)
    femaleprog <- sample(prog,size=no.females,replace=T) #sample females from total population
    femaleprog <- rep(femaleprog,length.out=total.pop)
    prog <- c(maleprog,femaleprog)
    frequency[i+1] <- length(which(prog=="A"))/(2*total.pop)
  }
  dat <- matrix(nrow={cycles+1},ncol=2)
  dat[,1] <- c(0:cycles)
  dat[,2] <- frequency
  finalfrequencies <- c()
  finalfrequencies[1] <- frequency[cycles+1]
  if(plot==T) plot(dat,type="l",ylim=c(0,1),xlab="Generation",ylab="Frequency")
  }
  if(sims > 1){
    for(j in 2:sims){
  prog <- c(rep("A",initial*total.pop*2),rep("B",(1-initial)*total.pop*2))
  maleprog <- c()
  femaleprog <- c()
  frequency <- c()
  frequency[1] <- length(which(prog=="A"))/length(prog)
  if(Bottleneck==F){
    for(i in 1:cycles){
    maleprog <- sample(prog,size=no.males,replace=T)  #sample male alleles from total population
    maleprog <- rep(maleprog,length.out=total.pop)
    femaleprog <- sample(prog,size=no.females,replace=T) #sample females from total population
    femaleprog <- rep(femaleprog,length.out=total.pop)
    prog <- c(maleprog,femaleprog)
    frequency[i+1] <- length(which(prog=="A"))/(2*total.pop)
    }
  dat <- matrix(nrow={cycles+1},ncol=2)
  dat[,1] <- c(0:cycles)
  dat[,2] <- frequency
  finalfrequencies[j] <- frequency[cycles+1]
  if(plot==T) lines(dat,type="l")
  }
  if(Bottleneck==T){
    for(i in 1:{Bottleneck.gen-1}){
    maleprog <- sample(prog,size=no.males,replace=T)  #sample male alleles from total population
    maleprog <- rep(maleprog,length.out=total.pop)
    femaleprog <- sample(prog,size=no.females,replace=T) #sample females from total population
    femaleprog <- rep(femaleprog,length.out=total.pop)
    prog <- c(maleprog,femaleprog)
    frequency[i+1] <- length(which(prog=="A"))/(2*total.pop)
  }
    i <- Bottleneck.gen
    maleprog <- sample(prog,size=Bottleneck.no.males,replace=T)  #sample male alleles from total population
    maleprog <- rep(maleprog,length.out=total.pop)
    femaleprog <- sample(prog,size=Bottleneck.no.females,replace=T) #sample females from total population
    femaleprog <- rep(femaleprog,length.out=total.pop)
    prog <- c(maleprog,femaleprog)
    frequency[i+1] <- length(which(prog=="A"))/(2*total.pop)
    for(i in {Bottleneck.gen+1}:cycles){
    maleprog <- sample(prog,size=no.males,replace=T)  #sample male alleles from total population
    maleprog <- rep(maleprog,length.out=total.pop)
    femaleprog <- sample(prog,size=no.females,replace=T) #sample females from total population
    femaleprog <- rep(femaleprog,length.out=total.pop)
    prog <- c(maleprog,femaleprog)
    frequency[i+1] <- length(which(prog=="A"))/(2*total.pop)
  }
  dat <- matrix(nrow={cycles+1},ncol=2)
  dat[,1] <- c(0:cycles)
  dat[,2] <- frequency
  if(plot==T) lines(dat,type="l")
  finalfrequencies[j] <- frequency[cycles+1]
  }
    }
  }
  return(finalfrequencies)
}

###
###
###
### Note: This function is free to use and distribute.  Please provide appropriate credit when doing so.


######################## EXAMPLE 1 #################################
#
#Simulate drift for a neutral locus, initial frequency = 0.5, total population size = 5000,
#number of reproducing males = 1000, number of reproducing females =1000, generations=30,
# no bottleneck, draw a plot, 100 simulations:
#
# result = driftNeutral(initial=0.5, total.pop=5000, no.males=1000, no.females=1000, cycles=30, Bottleneck=F,plot=T,sims=100)
#
#Next, ask for quantiles of the result to determine significance thresholds for drift
#
#quantile(result,c(0.025,0.975))
#

######################## EXAMPLE 2 #################################
#
#Simulate drift for a neutral locus, initial frequency = 0.5, total population size = 5000,
#number of reproducing males = 1000, number of reproducing females =1000, generations=30,
# bottleneck at generation 15, 20 reproducing males during bottleneck, 20 reproducing females during bottleneck, draw a plot, 100 simulations:
#
#
#result = driftNeutral(initial=0.5, total.pop=5000,no.males=1000,no.females=1000,cycles=30,Bottleneck=T,Bottleneck.gen=15,Bottleneck.no.males=20,Bottleneck.no.females=20,plot=T,sims=100)
#
#Next, ask for quantiles of the result to determine significance thresholds for drift
#
#quantile(result,c(0.025,0.975))
#
#


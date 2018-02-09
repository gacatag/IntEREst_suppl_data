# Before running the script make sure $IRFRESPATH enivronmetal variable is set 
# to the same path as in IRFinderScripts.sh. Moreover set the working directory
#to the 'scripts' fodler. You can set working dircetoy with setwd() command.

#Scripts were adapted from https://github.com/williamritchie/IRFinder/wiki/Generalized-Linear-Model-with-Replicates
DESeqDataSetFromIRFinder <- function(filePaths,designMatrix,designFormula){
    res=c()
    libsz=c()
    irtest=read.table(filePaths[1])
    if (irtest[1,1]=="Chr"){irtest=irtest[-1,]}
    irnames=unname(apply(as.matrix(irtest),1,FUN=function(x){
		return(paste0(x[4],"/",x[1],":",x[2],"-",x[3],":",x[6]))}))
    n=1
    for (i in filePaths){
        print(paste0("processing file ",n," at ",i))
        irtab=read.table(i)
        if (irtab[1,1]=="Chr"){irtab=irtab[-1,]}
        tmp1=as.numeric(as.vector(irtab[,9]))
        tmp2=as.numeric(as.vector(irtab[,19]))
        tmp3=tmp1+tmp2
        res=cbind(res,tmp1)
        libsz=cbind(libsz,tmp3)
        n=n+1
    }
    res.rd=round(res)
    libsz.rd=round(libsz)
    colnames(res.rd)=paste("intronDepth",as.vector(designMatrix[,1]),sep=".")
    rownames(res.rd)=irnames
    colnames(libsz.rd)=paste("totalSplice",as.vector(designMatrix[,1]),sep=".")
    rownames(libsz.rd)=irnames
    
    ir=c(rep("IR",dim(designMatrix)[1]),rep("Splice",dim(designMatrix)[1]))
    group=rbind(designMatrix,designMatrix)
    group$IRFinder=ir
    group$IRFinder=factor(group$IRFinder,levels=c("Splice","IR"))
    
    counts.IRFinder=cbind(res.rd,libsz.rd)
    
    dd = DESeqDataSetFromMatrix(countData = counts.IRFinder, colData = group, 
		design = designFormula)
    sizeFactors(dd)=rep(1,dim(group)[1])
    rownames(dd)=irnames
    sp=libsz-res
    final=list(dd,res,sp)
    names(final)=c("DESeq2Object","IntronDepth","SpliceDepth")
    return(final)
}

# Get results files from $IRFRESPATH
resPath<- as.character(Sys.getenv("IRFRESPATH"))
paths<- paste(paste(resPath, 
	c("SRR1691641", 
	"SRR1691642",
	"SRR1691643",
	"SRR1691644",
	"SRR1691645",
	"SRR1691646",
	"SRR1691647",
	"SRR1691648",
	"SRR1691633",
	"SRR1691634",
	"SRR1691635",
	"SRR1691636",
	"SRR1691637",
	"SRR1691638",
	"SRR1691639",
	"SRR1691640"), sep="/"), "IRFinder-IR-nondir.txt", sep="/")
# Get the experiment table from experiment.txt file in 'scripts' folder
experiment = read.table("./experiment.txt",header=TRUE)
# Set WT as the baseline in the analysis
experiment$Condition=factor(experiment$Condition,levels=c("WT","MUT"))
library(DESeq2)
metaList=DESeqDataSetFromIRFinder(filePaths=paths, 
	designMatrix=experiment, designFormula=~1)

dds = metaList$DESeq2Object
colData(dds)

design(dds) = ~Condition + Condition:IRFinder
dds = DESeq(dds)
resultsNames(dds)

irfDiff = results(dds, 
	contrast=list("ConditionMUT.IRFinderIR", "ConditionWT.IRFinderIR"))         
# Wald test result of each intron for differential IR analysis.
  
pThresh<- 0.01
#Number of differential retained introns
length(which(irfDiff[,"padj"]<pThresh))
#Number of introns  with significantly increased reetnation in ZRSR2mut samples
length(which(irfDiff[,"padj"]<pThresh & irfDiff[,"log2FoldChange"]>0))
##Number of introns  with significantly dereased reetnation in ZRSR2mut samples
length(which(irfDiff[,"padj"]<pThresh & irfDiff[,"log2FoldChange"]<0))

save(irfDiff, file="./irfDiff.rda")

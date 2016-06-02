# TODO: Add comment
# 
# Author: igor
###############################################################################


library("languageR")
library("MASS")

?lexicalMeasures

#task 1
aff_subset=affixProductivity[(affixProductivity$Registers=="L"),]
aff_subset[18,]
aff_subset=aff_subset[-c(21,18),]

aff_subset_pca=prcomp(aff_subset[,1:27],center=T,scale=T)
summary(aff_subset_pca)

aff_subset_df=data.frame(aff_subset_pca$x[,1:4],birth=aff_subset$Birth)

pairscor.fnc(aff_subset_df[,1:5])


#task2
semanticvars=c("Vf","Dent","NsyC","NsyS","CelS","Fdif","NVratio","Ient")

subset_lM=lexicalMeasures[,-1]
lM_cor=cor(subset_lM,method="spearman")^2
lM_cor_cmd=cmdscale(dist(lM_cor),k=2)

plot(lM_cor_cmd,type="n")
text(lM_cor_cmd,row.names(lM_cor_cmd),col=c("red","blue")[row.names(lM_cor_cmd) %in% semanticvars+1])

#task3
?finalDevoicing


#task4
func_w_pca=prcomp(spanishFunctionWords,scale=T,center=T)
biplot(func_w_pca)

tagtri_pca=prcomp(spanish,scale=T,center=T)
biplot(tagtri_pca,var.axes=F)

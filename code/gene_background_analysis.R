# This script is used to compare the predicted genes from ecFSEOF and the genes used in the reference strains.
library(ggplot2)
library(tidyverse)
library(readxl)
library(pheatmap)
library(viridis)

# Setting the working directory to the directory which contains this script
if (exists("RStudio.Version")){
  path <- dirname(rstudioapi::getActiveDocumentContext()$path)
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
} else {
  setwd(getSrcDirectory()[1])
}

# data preparation
# input the genes from background strains
gene_background <- read.table("../data/genetic_background_updated.txt", sep="\t", header = TRUE, stringsAsFactors = FALSE)
# only keep products with gene background information
# as a whole only 56 products have gene background information
gene_background0 <- filter(gene_background, !(overexpression=="" & downregulation=="" & deletion==""))

# input the predicted genes targets without background information
# ecFSEOF
ecFSEOF <- read.table("../results/production_targets/targetsMatrix_ecFSEOF.txt", sep="\t", header = TRUE, stringsAsFactors = FALSE)
ecFSEOF <- read.table("../results/production_targets/targetsMatrix_mech_validated.txt", sep="\t", header = TRUE, stringsAsFactors = FALSE)

# mech-validated
mech_validated <- read.table("../results/production_targets/targetsMatrix_mech_validated.txt", sep="\t", header = TRUE, stringsAsFactors = FALSE)
# compatible
#compatible_gene <- read.table("../results/production_targets/targetsMatrix_compatible.txt", sep="\t", header = TRUE, stringsAsFactors = FALSE)

find_common_gene <- function(s1, s2) {
  common <- vector()
  # s1 <- background_OE
  # s2 <- predict_OE
  s10 <- unlist(str_split(s1, ","))
  s10 <- str_trim(s10, side = "both")
  s2 <- str_trim(s2, side = "both")
  common <- intersect(s10, s2)
  perc   <- length(common)/length(s10)
  if (length(common) >=1) {
    return(list(paste0(common,collapse = ","),perc))
  } else {
    return(list(NA,perc))
  }
}

# comparison
# the comparsion with start from ecFSEOF, mech_validated and compatible
gene_background0$common_OE <- NA
#gene_background0$common_KD <- NA
gene_background0$common_KO_KD <- NA

gene_background0$ovlp_OE <- 0
#gene_background0$ovlp_KD <- 0
gene_background0$ovlp_KO_KD <- 0

met_name_need_check <- vector()
for (i in 1:nrow(gene_background0)) {
  product0  <- gene_background0$results_folder[i]
  product00 <- str_replace(product0, "_targets", "")
  product00 <- product00 %>%
    str_replace_all(., "-", "") %>%
    str_replace_all(., "_", "")
  product00 <- paste(product00, "_fam_", sep = "")
  # as the name of products need to be unified
  product00 <- str_replace(product00, "^[:digit:]", "") # remove the number at the start of string
  background_OE <- gene_background0$overexpression[i]
  #background_KD <- paste(gene_background0$downregulation[i],gene_background0$deletion[i])
  background_KO <- paste(gene_background0$downregulation[i],gene_background0$deletion[i],sep=',')

  all_col <- colnames(ecFSEOF)
  prodNames <- all_col[5:length(all_col)]
  for (j in 1:length(prodNames)){
    str <- substr(prodNames[j],1,(nchar(prodNames[j])-3))
    prodNames[j] <- str
  }
  all_col[5:length(all_col)] <- prodNames
  common_OE    <- NA
  common_KO_KD <- NA
  presence <- grep(product00,all_col,fixed = TRUE)
  if (length(presence)>=1) {
    print(product00)
    # find the predicted genes based on the product name
    col_select <- c(1,2,3,4,presence) 
    predict_tagets <- ecFSEOF[, col_select]
    predict_OE <- predict_tagets$genes[predict_tagets[5] == 3]
    predict_KO <- predict_tagets$genes[predict_tagets[5] == 1 | predict_tagets[5] == 2]
    #find intersect between predictions and data
    #OEs
    print(predict_OE)
    print(background_OE)
    temp       <- find_common_gene(background_OE, predict_OE)
    common_OE  <- temp[[1]]
    gene_background0$ovlp_OE[i] <- temp[[2]]
    #KOs and KDs
    temp        <- find_common_gene(background_KO, predict_KO)
    common_KO_KD <- temp[[1]]
    gene_background0$ovlp_KO_KD[i] <- temp[[2]]
    
  } else {
    met_name_need_check <- c(met_name_need_check, product00)
  }
  gene_background0$common_OE[i]    <- common_OE
  gene_background0$common_KO_KD[i] <- common_KO_KD
}
# save the analysis result
df <- gene_background0
dir.create("../results/validation")
write.table(df, "../results/validation/exp_validated_targets.txt", sep = "\t", row.names = FALSE)
gene_background0$sum <- rowSums(gene_background0[,((ncol(gene_background0)-1):ncol(gene_background0))])
gene_background0 <- gene_background0[gene_background0$sum>0,]
temp <- data.frame(gene_background0[,((ncol(gene_background0)-2):(ncol(gene_background0)-1))])
rownames(temp) <- gsub('.mat','',gene_background0$ecModel)
rownames(temp) <- substring(rownames(temp),3)
colnames(temp) <- c('OE','KD_KO')
fileName <- '../results/validation/intersect_exp_pred_mech_targets.png'
png(fileName,width=800, height=(nrow(temp)/22)*750)
p <- pheatmap(temp,color = cividis(11),cluster_cols = F,cluster_rows = T, show_rownames = TRUE,scale='none',fontsize = 20)
dev.off()


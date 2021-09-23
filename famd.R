df <- forRanalysis
## PCA
library("factoextra")
library("FactoMineR")
res.famd <- FAMD(df, 
                 sup.var = 19,  ## Set the target variable "Churn" as a supplementary variable, so it is not included in the analysis for now
                 graph = FALSE, 
                 ncp=25)

quality.var <- get_famd_var(res.famd, "quali.var")
print(quality.var)
head(quality.var) # coordinates of qualitative variables

fviz_screeplot(res.famd)
fviz_famd_var(res.famd)
fviz_famd_ind(res.famd, col.ind = "cos2",
              gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
              repel = TRUE)
fviz_famd_var(res.famd, "quali.var", col.var = "black")

# Quantitative variables
fviz_famd_var(res.famd, "quanti.var", repel = TRUE)

# Qualitative variables
fviz_famd_var(res.famd, "quali.var")

fviz_famd_var(res.famd, repel=TRUE)

var <- get_famd_var(res.famd)
# Contribution to the first dimension
fviz_contrib(res.famd, "var", axes = 1)
# Contribution to the second dimension
fviz_contrib(res.famd, "var", axes = 2)


#Link: https://rpkgs.datanovia.com/factoextra/reference/fviz_famd.html
# http://www.sthda.com/english/articles/31-principal-component-methods-in-r-practical-guide/115-famd-factor-analysis-of-mixed-data-in-r-essentials/
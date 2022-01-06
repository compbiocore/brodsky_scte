BiocManager::install(c("AnnotationHub","biomaRt", "rhdf5", "ensembldb", "SingleCellExperiment", "AUCell", "RcisTarget", "GENIE3", "zoo", "mixtools", "rbokeh", "DT", "NMF", "ComplexHeatmap", "R2HTML", "Rtsne", "doMC", "doRNG", "BiocGenerics", "DelayedArray", "DelayedMatrixStats", "limma", "S4Vectors", "SummarizedExperiment", "batchelor", "Matrix.utils", "TFBSTools", "JASPAR2018", "scater"))

install.packages(c("arrow", "RcppArmadillo", "deldir", "Seurat", "Signac","hdf5r", "patchwork","tidyverse", "ggrepel","sctransform", "remotes", "knitr", "kableExtra", "stringr", "plotly","viridis", "parallel", "pdftools", "openxlsx"), repos = "http://cran.rstudio.com/")

devtools::install_github("immunogenomics/harmony")
devtools::install_github("aertslab/SCopeLoomR")
devtools::install_github("aertslab/SCENIC")
devtools::install_github("cole-trapnell-lab/leidenbase")
devtools::install_github("cole-trapnell-lab/monocle3")
devtools::install_github("mojaveazure/loomR")
devtools::install_github("mojaveazure/seurat-disk")
devtools::install_github("satijalab/seurat-data")
devtools::install_github("satijalab/seurat-wrappers")
devtools::install_version("Rcpp", version = "1.0.7", repos = "http://cran.us.r-project.org")

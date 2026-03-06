Participant Info <please fill out>
Name: Moritz Madern
Mail: moritz.madern@meduniwien.ac.at









######### Contents/File structure ############


- **README.md** : This README file



- **LOG.md ** : LOG file documenting time spent per task as well as additional comments.



- **Topstas_codingExperiment.Rproj** : R project file used for the entire analysis in R. 



- **code** : A folder with the code to recreate the entire analysis. Contains 5 Rmd files with R code, 2 html files, and an R file with some functions/prespecified variables. The files within this folder are as follows:

[1] "code/preprocessing.Rmd"         : Rmd code file to read in the original data input files (i.e., file patients.csv, file hospitalstay_stent.csv, etc.) and cleans/prepares the data for the ensuing statistical analysis. When run, this file returns "data/cleaned_data.csv", which is a table containing the final pooled index hospitalizations as rows.
[2] "code/analysisdescriptive.Rmd"   : Rmd code file that performs the descriptive analysis tasks. Running this file produced "data/Rsession_analysis_descriptive2026-02-02.RData", which stores the descriptive analysis results in the form of several R objects.                       
[3] "code/resultsdescriptive.Rmd"    : Rmd code file that reads in "data/Rsession_analysis_descriptive2026-02-02.RData" and produced a compact html report of the descriptive results (see [12] "output/resultsdescriptive.html").
[4] "code/analysismain.Rmd"          : Rmd code file that performs the main analysis tasks. Running this file produced "data/Rsession_analysis_main2026-02-02.RData", which stores the main analysis results in the form of several R objects
[5] "code/resultsmain.Rmd"           : Rmd code file that reads in "data/Rsession_analysis_main2026-02-02.RData" and produced a compact html report of the main results (see [13] "output/resultsmain.html")
 
[6] "code/analysisdescriptive.html"  : html file created when knitting to html the Rmd file "code/analysisdescriptive.Rmd" (see [2]).  Probably not of interest, as the results are presented in a more compact way in [12] "output/resultsdescriptive.html".                    
[7] "code/analysismain.html"         : html file created when knitting to html the Rmd file "code/analysismain.Rmd" (see [4]). Probably not of interest, as the results are presented in a more compact way in [13] "output/resultsmain.html".
 
[8] "code/functions.R"               : R code file that is sourced by "code/preprocessing.Rmd" (see [1]). It contains some functions as well as prespecified objects of interest for the data preparation step.                                
                                            


- **data** : A folder containing the cleaned/prepared data as well as two R session images.

[9] "data/cleaned_data.csv"                                    : csv file containing the data after cleaning and preparation. This file serves as the starting point of the statistical analysis. It is produced by the code in [1] "code/preprocessing.Rmd".
[10] "data/Rsession_analysis_descriptive2026-02-02.RData"      : R session image created by [2] "code/analysisdescriptive.Rmd". It serves as the input of [3] "code/resultsdescriptive.Rmd" in order to create "output/resultsdescriptive.html".
[11]  "data/Rsession_analysis_main2026-02-02.RData"            : R session image created by [4] "code/analysismain.Rmd". It serves as the input of [5] "code/resultsmain.Rmd" in order to create "output/resultsmain.html".



- **output** : A folder containing the analysis results in form of two html reports and seven figures.

[12] "output/resultsdescriptive.html"  : html file that presents the results of the descriptive analysis in a compact and readable way.
[13] "output/resultsmain.html"         : html file that presents the results of the main analysis in a compact and readable way.

[14] "output/figures/Fig1__DescriptiveAnalysis__KM_overall.pdf"           : also contained in [12] "output/resultsdescriptive.html".
[15] "output/figures/Fig2__DescriptiveAnalysis__reverseKM_overall.pdf"    : also contained in [12] "output/resultsdescriptive.html".
[16] "output/figures/Fig3__DescriptiveAnalysis__reverseKM_stratified.pdf" : also contained in [12] "output/resultsdescriptive.html".
[17] "output/figures/Fig4__MainAnalysis_stratifiedKM_unadjusted.pdf"      : also contained in [13] "output/resultsmain.html".
[18] "output/figures/Fig5__MainAnalysis_Density_stabilized_weights.pdf"   : also contained in [13] "output/resultsmain.html".
[19] "output/figures/Fig6__MainAnalysis_Density_unstabilized_weights.pdf" : also contained in [13] "output/resultsmain.html".
[20] "output/figures/Fig7__MainAnalysis_marginalSurvival.pdf"             : also contained in [13] "output/resultsmain.html".








########### R version ############


R version used:
R version 4.5.2 (2025-10-31) -- "[Not] Part in a Rumble"
Copyright (C) 2025 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin20











########### Combined Session Info ############

sessionInfo()
R version 4.5.2 (2025-10-31)
Platform: x86_64-apple-darwin20
Running under: macOS Sonoma 14.7.3

Matrix products: default
BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
LAPACK: /Library/Frameworks/R.framework/Versions/4.5-x86_64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.1

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

time zone: Europe/Vienna
tzcode source: internal

attached base packages:
[1] grid      splines   stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] nnet_7.3-20     ggsurvfit_1.2.0 tableone_0.13.2 janitor_2.2.1   lubridate_1.9.4 forcats_1.0.1   stringr_1.6.0  
 [8] purrr_1.2.0     readr_2.1.6     tidyr_1.3.1     tibble_3.3.0    ggplot2_4.0.1   tidyverse_2.0.0 survival_3.8-3 
[15] dplyr_1.1.4     knitr_1.50     

loaded via a namespace (and not attached):
 [1] generics_0.1.4     stringi_1.8.7      lattice_0.22-7     hms_1.1.4          digest_0.6.39      magrittr_2.0.4    
 [7] evaluate_1.0.5     timechange_0.3.0   RColorBrewer_1.1-3 fastmap_1.2.0      Matrix_1.7-4       DBI_1.2.3         
[13] scales_1.4.0       cli_3.6.5          mitools_2.4        rlang_1.1.6        withr_3.0.2        yaml_2.3.11       
[19] tools_4.5.2        tzdb_0.5.0         vctrs_0.6.5        R6_2.6.1           lifecycle_1.0.4    snakecase_0.11.1  
[25] pkgconfig_2.0.3    pillar_1.11.1      gtable_0.3.6       Rcpp_1.1.0         glue_1.8.0         xfun_0.55         
[31] tidyselect_1.2.1   rstudioapi_0.17.1  farver_2.1.2       htmltools_0.5.9    survey_4.4-8       rmarkdown_2.30    
[37] compiler_4.5.2     S7_0.2.1 




Please note: 

The files [6] "code/analysisdescriptive.html" and [7] "code/analysismain.html"  also feature session infos at the end for the indivdual scripts



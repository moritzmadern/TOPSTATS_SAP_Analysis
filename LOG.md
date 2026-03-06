Participant Info <please fill out>
Name: Moritz Madern
Mail: moritz.madern@meduniwien.ac.at








############### TIME PER TASK ############################################
##########################################################################


#### Preprocessing

# Roughly 1 hour to carefully read SAP for the first time

# Roughly 10 hours to explore the data in R and get an initial understanding of the data (i.e., what is contained in the different files and where do I get which information)

# Roughly 20 hours coding the preprocessing. Defining pooled index hospitalization periods was the hardest part of this step.







#### Analysis

# Descriptive Analysis: Roughly 5 hours


# Main Analysis: Finding suitable variable transformations + adequate specification of functional form: 3 hours


# Calculating and plotting unadjusted KM curves: 1 hour. 


# Fitting multinomial logistic regression model and calculating IPTW + assessment of weights: 3 hours.


# Calculating marginal survival curves by double robust IPTW + G-formula strategy: 5 hours. 


# Formating result files: 5 hours. 








############### ADDITIONAL COMMENTS ######################################
##########################################################################


A: Regarding the transformation of covariates and specification of functional forms: Many of the integer variables (e.g., number of hospital
stays during eligibility period) were utimately included into the model as categorical dummy variables ranging from lower to higher counts, with an extra category for the minimum possible count (e.g., 0 or 1). I figured that
this would keep the model somewhat flexible while also avoiding strong assumptions (e.g. linearity, proportional hazards across a certain variable range).


B: For the main analysis, the SAP reads: "A Kaplan-Meier plot stratified by the three treatment groups will be created". Since there was no mention of "adjusted" or "IPTW-weighted", I figured that the unadjusted KM curves were desired.




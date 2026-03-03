###############################
# Logistic Regression - Assignment
# Threshold fixed at 0.25
###############################

## Set Seed
set.seed(1)

## Read in Training Data
logit <- read.csv(file.choose())  ## Choose training.csv

############################
# Transform / Create Data #
############################

## Create ln variables
logit$lnVehOdo   <- log(logit$VehOdo + 1)
logit$lnVehBCost <- log(logit$VehBCost + 1)

## PRIMEUNIT as categorical
logit$PRIMEUNIT <- as.factor(logit$PRIMEUNIT)

## Convert MMR variable from "NULL" to numeric (if needed)
logit$MMRCurrentAuctionCleanPrice <- as.numeric(
  ifelse(logit$MMRCurrentAuctionCleanPrice == "NULL", 0,
         logit$MMRCurrentAuctionCleanPrice)
)

##################################
# Run Logistic Regression (GLM)
##################################

logit_result <- glm(
  formula = IsBadBuy ~ VehicleAge + lnVehOdo + lnVehBCost +
    PRIMEUNIT + MMRCurrentAuctionCleanPrice,
  data = logit,
  family = "binomial"
)

## Coefficient table (requirement c)
summary(logit_result)

#################################
# McFadden Pseudo R2 (requirement b)
#################################

null_result <- glm(IsBadBuy ~ 1, data = logit, family = "binomial")
pseudoR2 <- 1 - logLik(logit_result)/logLik(null_result)
pseudoR2

#################################
# Predicted Probabilities
#################################

logit$predict <- predict(logit_result, logit, type = "response")

quantile(logit$predict, prob = seq(0,1,length=11), type=5)

###########################
# Hit Rate Table (Threshold = 0.25)
###########################

threshold <- 0.25

logit$pIsBadBuy <- ifelse(logit$predict >= threshold, 1, 0)
hitrate <- table(logit$IsBadBuy, logit$pIsBadBuy)
hitrate

accuracy <- sum(diag(hitrate))/sum(hitrate)
accuracy

sensitivity <- hitrate["1","1"] / sum(hitrate["1",])
specificity <- hitrate["0","0"] / sum(hitrate["0",])

sensitivity
specificity
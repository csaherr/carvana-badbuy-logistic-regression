# carvana-badbuy-logistic-regression
Predict bad vehicle purchases (IsBadBuy) using logistic regression in R; includes feature engineering and Kaggle submission workflow.
## Highlights
- Dataset: 72,983 auction purchases (binary target: `IsBadBuy`)
- Approach: Logistic regression + feature engineering + threshold evaluation
- Output: probability predictions for Kaggle submission (AUC-based leaderboard)

## Model & Features
Key predictors used in the final model:
- `VehicleAge`
- `lnVehOdo` (log odometer)
- `lnVehBCost` (log purchase cost)
- `PRIMEUNIT`
- `MMRCurrentAuctionCleanPrice`

## Results (from final report)
- Pseudo R²: 0.052  
- Threshold analysis (example): at 0.25 → Accuracy 85.4%, Sensitivity 14.4%, Specificity 95.4%
- Kaggle: Public 0.14868 / Private 0.14634 (AUC ≈ 0.573)

## How to Run
1. Install R and (optionally) RStudio
2. Open `code/Log_Reg_Final.R`
3. Install required packages (if prompted)
4. Update file paths to your local data files
5. Run script to train model and generate test predictions

> Data not included in this repo due to licensing/competition restrictions.  
> You can obtain it from the Kaggle competition “Don’t Get Kicked!” and place files locally.

## Repo Structure
- `code/` — R script(s)
- `report/` — write-up / documentation
- `assets/` — images used in README (optional)

## Notes
This is an academic project. Focus is on interpretable modeling, feature engineering, and evaluation tradeoffs in an imbalanced classification setting.

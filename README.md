# Hotel Pricing Analysis & Forecasting

## 📌 Overview

This project analyzes hotel pricing data from **2012–2015** to understand pricing behavior and build a forecasting model. The goal is to:

* Identify **year-over-year seasonal patterns**
* Detect **outliers in pricing data**
* Forecast **daily hotel prices for February 2022**

The approach focuses on **interpretable analysis and practical insights**, reflecting real-world pricing systems.

---

## Project Structure

```
hotel-pricing-analysis/
│
├── data/
│   ├── raw.csv
│   ├── daily_yoy.csv
│   ├── Feb2015.csv
│   ├── FebComplete.csv
│   └── Weekday.csv
│
├── notebooks/
│   ├── Q1_Visualisations.ipynb
│   ├── Q2_Outliers.ipynb
│   └── Q3_Predicting.ipynb
│
├── images/
│   ├── yoy_plot.png
│   ├── outliers_plot.png
│   └── feb_prediction.png
│
├── README.md
├── requirements.txt
└── .gitignore
```

---

##  Q1: Year-over-Year Pattern Analysis

### Approach

* Converted dates into **day-of-year** to align multiple years on a common timeline
* Overlaid yearly price trends for direct comparison
* Used smoothing (rolling average) for better visualization

<img width="1589" height="590" alt="Q1_YoY_Seasonal_Pattern" src="https://github.com/user-attachments/assets/678e3e8d-2b57-4231-8527-ac7778448e01" />
<img width="1189" height="590" alt="Q1_Week_on_Week_pattern" src="https://github.com/user-attachments/assets/56a6151f-c1cf-494d-9ac2-dc57f7a5b7d1" />

---

##  Q2: Outlier Detection

### Approach

* Used **boxplots** for visual analysis
* Applied **IQR-based outlier detection (2.5× IQR)** to reduce false positives
* Performed detection **year-wise** to avoid cross-year bias

<img width="1589" height="590" alt="Q2_Full_Dataset_Outliers" src="https://github.com/user-attachments/assets/aa5e6a0e-7af6-480a-aac3-8e60027686f0" />
<img width="1589" height="590" alt="Q2_Year_wise_Outliers" src="https://github.com/user-attachments/assets/7e0ff920-c65f-4494-b1a2-797e4ba90c57" />


### Insight

> Outlier detection without accounting for seasonality can misclassify normal pricing behavior as anomalies.

---

## Q3: Price Forecasting (February 2022)

### Approach 1: Rule-Based Model

* Incorporated:

  * Year-over-year growth
  * Inflation
  * COVID impact

**Pros:**

* Interpretable
* Incorporates domain knowledge

**Cons:**

* Rigid assumptions
* Limited adaptability


<img width="1389" height="690" alt="Q3_Heuristic_Prediction" src="https://github.com/user-attachments/assets/a15efcc1-cc78-4385-99eb-4c9aed2e3e9d" />


---

### Approach 2: Prophet Model

Used **Facebook Prophet** for time-series forecasting:

* Yearly seasonality
* Weekly seasonality
* Custom monthly seasonality
* Holiday effects (e.g., Valentine's Day, peak demand periods)

### Model Tuning

* Added **holiday effects** to capture event-driven demand spikes
* Introduced **monthly seasonality** to capture intra-month variations
* Explored **logistic growth** to reflect bounded pricing behavior

### Observations

* Prophet captures overall trends effectively
* Predictions are **smooth**, as the model prioritizes general patterns over noise
* Sharp spikes are not fully captured due to model regularization

<img width="1190" height="590" alt="Q3_Model_Prediction" src="https://github.com/user-attachments/assets/39650c41-2066-4e8b-95d0-559c74b78449" />


---


## 🚀 Future Improvements

* Incorporate external data:

  * Holidays
  * Local events
  * Occupancy rates
* Use **residual-based anomaly detection**
* Perform **backtesting** for model validation
* Combine **statistical models with domain knowledge**

---


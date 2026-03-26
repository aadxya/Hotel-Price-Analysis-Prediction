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

---

##  Q2: Outlier Detection

### Approach

* Used **boxplots** for visual analysis
* Applied **IQR-based outlier detection (2.5× IQR)** to reduce false positives
* Performed detection **year-wise** to avoid cross-year bias

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


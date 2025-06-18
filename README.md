
# 🧠 Customer CLV Prediction & Segmentation

A data science project that predicts **Customer Lifetime Value (CLV)** from sales data and segments customers into three groups using clusters. This helps companies know who their most valuable customers are and how marketing can be optimized, It’s vital to remember that CLV is an umbrella term that comprises **acquisition**, **engagement**, **conversion**, and **retention strategies**.

---

## 📚 Table of Contents

- [Project Objectives](#-project-objectives)
- [Tools & Technologies](#-tools--technologies)
- [Data Source & Preprocessing](#-data-source--preprocessing)
- [Features Used](#-features-used)
- [Models Overview](#-models-overview)
  - [CLV Prediction](#1-clv-prediction)
  - [Customer Segmentation](#2-customer-segmentation)
- [Visualizations](#-visualizations)
- [Key Insights](#-key-insights)
  - [Customer Distribution](#-customer-distribution)
  - [Revenue Contribution](#-revenue-contribution)
  - [CLV Prediction Model](#-clv-prediction-model)
  - [Behavioral Patterns](#-behavioral-patterns)
  - [Clustering Insights](#-clustering-insights)
- [Business Recommendations](#-business-recommendations)
  - [Prioritize High CLV Customers](#-prioritize-high-clv-customers)
  - [Understand, Grow and Retain Medium CLV Customers](#-understand-grow-and-retain-medium-clv-customers)
  - [Optimize and Re-Engage Low CLV Customers](#-optimize-and-re-engage-low-clv-customers)

---

## 📊 Project Objectives

- Predict CLV with linear regression model.
- Segment customers into **High**, **Medium**, and **Low CLV** clusters with K-means clustering.
- get insights to support decision making in **marketing, customer loyalty, and revenue optimization**.

---

## 🛠️ Tools & Technologies

- **Languages**: Python, MySQL
- **Libraries**: pandas, numpy, matplotlib, seaborn, scikit-learn
- **Other**: Jupyter Notebook (VSCode), Git/GitHub

---

## 🧪 Data Source & Preprocessing

- Collected Sales Transaction Data from Kaggle: InvoiceNo, StockCode, Quantity, InvoiceDate, UnitPrice, CustomerID, Country.
- Cleaned Created features and CLV with SQL:
  - Removed duplicates
  - Created CLV features: `TotalSales`, `Frequency`, `AverageOrderValue`, `LifeSpan`, `TotalQuantity`
- Handled outliers by a statistical method called IQR in Python
- used `log` and `sqrt` Numpy methods to transform data in Python

---

## 📈 Features Used

- `TotalSales` = Quantity × UnitPrice
- `Frequency` = Unique Invoice Count
- `AverageOrderValue` = TotalSales / Frequency
- `LifeSpan` = Days between first and last purchase
- `CLV` = Frequency × AverageOrderValue × LifeSpan
- `QuantityPerOrder` = TotalQuantity / Frequency

---

## 🤖 Models Overview

### 1. **CLV Prediction**
- Model: Linear Regression
- Evaluation: R² Score, MSE
- Insights:
  - Identifies most influential features on CLV
  - Helps in forecasting high-value customers

### 2. **Customer Segmentation**
- Method: K-Means Clustering
- Used Silhouette Score to validate clustering
- Segments:
  - High CLV
  - Medium CLV
  - Low CLV

---

## 📊 Visualizations

- Distributions and Boxplots (before and after outlier removal and log transformation)
- Pie Chart: Customer Count by Segment
- Pie Chart: Revenue Contribution by Segment
- Regression Evaluation (Model Coefficients, R²)
- Heatmap for correlation (Pearson's method)

---

## 🔍 Key Insights

### 🧑‍🤝‍🧑 **Customer Distribution**:

- The High CLV segment contains the largest number of customers among the three clusters.
- This suggests a healthy base of high-value customers for potential retention and loyalty strategies.

### 💰 **Revenue Contribution**:

- The High CLV segment generates over ~50% of the total revenue, aligning with its size.
- The Medium CLV segment contributes a significant, but smaller portion.
- The Low CLV segment contributes the least to overall revenue, despite representing a noticeable customer count.

### 📈 **CLV Prediction Model**:

- Regression analysis revealed that Total Sales, Frequency, and Average Order Value were strong predictors of CLV.
- The model achieved an R² score of ~0.92, indicating a strong fit.

### 🔍 **Behavioral *Patterns**:

- After cleaning and transformation:
- Distributions of CLV-related features normalized.
- Outlier removal via IQR significantly reduced noise and skew.
- These improvements positively impacted clustering and model accuracy.

### 📊 **Clustering Insights**:

- K-Means segmentation successfully grouped customers by their CLV profiles with silhouette score of ~0.6 which is great for business segmentation and indicates actionable insights
- Cluster analysis and visualizations (pie charts) clarified the relationship between customer count and revenue share.


---

## 💡 Business Recommendations:

### ✅ **Prioritize High CLV Customers**:
Since the high CLV customers make ~50% of the total revenue and interact constantly

*Recommendations*:

1. Offer exclusive promotions, early access to products, or loyalty programs to further monetize this group and offer upselling based on their interest for higher profit and increased revenue.

2. Use personalized email marketing and premium support to enhance satisfaction and retention.

3. Focused marketing efforts on high CLV customers to maximize ROI since they bring the most revenue.

---

### ✅ **Understand, Grow and Retain Medium CLV Customers**:
Because Medium CLV make ~50% of total revenue, and have potential for growth and is a valuable segment that interacts regularly and brings decent revenue.

*Recommendations*:

1. Offer personalized promotions like discounts, bundles and loyalty programs to increase interactions and purchases, offer cross-selling at checkout which increases revenue and profit and improves customer satisfaction and loyalty.

2. Introduce product recommendations based on their purchase and browsing history, and ask for feedback to improve the customer experience and build.
a stronger relationship

3. Regular marketing efforts to keep Medium CLV customers around.

---

### ✅ **Optimize and Re-Engage Low CLV Customers**:
Low CLV customers contribute ~17.5% of total revenue. While some may remain low value, others might respond to targeted engagement, the focus should be optimizing spending while exploring growth opportunities.

*Recommendations*:

1. Segment and assess behavior to distinguish between one-time buyers and those with growth potential like new or seasonal buyers.

2. Do re-engagement campaigns like seasonal discounts and bundles for seasonal
buyers and limited or one-time deals to renew interest.

3. Match and align spending with return by limiting high-cost retention efforts and reallocating resources based on response. Focus on channels with the best ROI for this segment.
    
---

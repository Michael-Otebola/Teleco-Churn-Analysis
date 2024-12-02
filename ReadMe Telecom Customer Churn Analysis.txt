Telecom Customer Churn Analysis

Project Overview
This project analyzes customer churn patterns in a telecom company using SQL, Python, and Tableau. By identifying churn factors, the analysis provides actionable insights for improving customer retention strategies. Additionally, predictive modeling was employed to anticipate at-risk customers, enabling targeted interventions.

Objectives
Understand customer churn drivers and patterns.
Build dashboards and KPIs to track churn metrics.
Develop predictive models to identify high-risk customers.

Tools and Technologies
SQL: Data extraction, cleaning, and aggregation.
Python: Advanced statistical analysis and visualization.
Tableau: Dashboards for interactive insights.

Dataset Description
The dataset contains customer demographic, service, and billing details. Key columns include:
CustomerID: Unique identifier.
Tenure: Months with the company.
Internet Service: Type of internet used.
Payment Method: Billing method (e.g., credit card).
Monthly Charges: Monthly subscription amount.
Churn: Whether the customer left the service.

Key Deliverables
1. SQL Analysis
Data Cleaning: Resolved null values and ensured consistent column types.
Data Aggregation: Churn percentages by demographics, payment method, and tenure.
Query Example:
SELECT 
    PaymentMethod, 
    COUNT(CustomerID) AS Total_Customers, 
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    AVG(MonthlyCharges) AS Avg_MonthlyCharges
FROM telecom_customer
GROUP BY PaymentMethod;

2. Python Insights
Correlation Analysis: Heatmaps revealed relationships between churn and variables like tenure, billing, and services.

Visualization Example: Churn distribution by internet service:
sns.countplot(data=df, x='Churn', hue='InternetService')
plt.title('Churn by Internet Service')
plt.show()

3. Tableau Dashboards
KPIs: Churn Rate, Average Monthly Charges, Total Revenue.
Visuals: Pie charts, bar charts, and interactive filters by demographics.
Title: Visualizing Churn: insights to Drive Retention Strategies

4. Predictive Analytics
Initial Model (Logistic Regression)
Accuracy: 81.9%
Strengths: High precision for non-churners.
Weakness: Lower recall for churners (58%).

Balanced Logistic Regression
Adjusted weights for better churner identification.
Recall for churners improved to 83%.

Future Directions:
Experiment with Random Forests or Gradient Boosting.
Refine features to improve predictive power.

Key Insights and Recommendations
Insights
1. Payment Method: Customers using electronic checks churn the most.
2. Tenure: Shorter tenure correlates with higher churn rates.
3. Service Impact: Add-ons like OnlineSecurity reduce churn significantly.

Recommendations
Focus on at-risk groups: low-tenure customers, senior citizens, and electronic check users.
Upsell retention-enhancing services like OnlineSecurity.
Develop engagement strategies for senior citizens and high-churn segments.

Folder Structure
SQL_Scripts/: Queries for cleaning and analysis.
Python_Scripts/: Jupyter notebooks for preprocessing and insights.
Tableau_Files/: Dashboards showcasing churn metrics.
Datasets/: Raw and processed customer data.

How to Use
1. Clone the repository or download project files.
2. Load telecom_churn.csv into your environment.
3. Execute SQL scripts for initial analysis.
4. Run Python notebooks for visual insights.
5. Open Tableau workbooks to explore dashboards.
Future Work
Advanced machine learning for better churn prediction.
Include time-series analysis to uncover trends over time.


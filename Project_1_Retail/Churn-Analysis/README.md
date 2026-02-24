

# 📊 Customer Churn & Sales Analysis – Food Delivery Dataset

This project explores **customer behavior, order trends, and churn patterns** in a food delivery platform dataset using **Python, Pandas, and Plotly**.

The goal of the project is to understand **what factors influence customer churn** and identify behavioral patterns that may help improve **customer retention and engagement**.

The analysis focuses on transforming raw transaction data into insights related to:

* Customer order behavior
* Loyalty patterns
* Pricing and order value trends
* Delivery performance
* Early indicators of customer churn

---

# 🚀 Project Objective

Customer churn is a major challenge for food delivery platforms. Retaining existing customers is often significantly cheaper than acquiring new ones.

The objective of this project is to:

* Explore customer order and engagement patterns
* Identify variables correlated with churn
* Understand behavioral differences between retained and churned customers
* Lay the groundwork for future churn prediction models

---

# 📂 Dataset Overview

The dataset contains **6,000 food delivery transactions** including customer information, order details, and delivery metrics.

Key fields include:

| Column          | Description                         |
| --------------- | ----------------------------------- |
| customer_id     | Unique identifier for each customer |
| age             | Customer age                        |
| gender          | Customer gender                     |
| city            | Customer location                   |
| signup_date     | Date the customer joined            |
| order_id        | Unique order identifier             |
| order_date      | Date the order was placed           |
| restaurant_name | Restaurant fulfilling the order     |
| dish_name       | Ordered item                        |
| category        | Food category                       |
| quantity        | Number of items ordered             |
| price           | Total order value                   |
| payment_method  | Method used for payment             |
| order_frequency | Total orders placed by customer     |
| loyalty_points  | Reward points accumulated           |
| rating          | Customer rating                     |
| delivery_status | Order delivery outcome              |
| churned         | Whether the customer churned        |

---

# 🧠 Analysis Performed

## 1️⃣ Data Exploration

Initial exploration was performed using **Pandas** to understand dataset structure.

Steps included:

* Loading and previewing data
* Inspecting column types
* Checking dataset shape and structure

---

## 2️⃣ Data Quality Checks

Data quality was evaluated using:

* Missing value detection
* Statistical summaries
* Column type validation

Example finding:

* The **rating column contains missing values**, indicating incomplete customer feedback.

---

## 3️⃣ Exploratory Data Analysis (EDA)

EDA was conducted to analyze relationships between:

* Order frequency and churn
* Loyalty points and customer engagement
* Order price distribution
* Customer demographics
* Delivery performance and ratings

Visualizations were created to highlight trends and customer behavior patterns.

---

# 📊 Churn Analysis Focus

The project investigates potential drivers of customer churn, including:

* Customers with **low order frequency**
* Customers with **lower loyalty points**
* Customers experiencing **delivery issues**
* Customers providing **low ratings**

Understanding these patterns can help food delivery platforms design **better retention strategies and loyalty programs**.

---

# 🛠 Tools & Technologies

**Programming Language**

* Python

**Libraries**

* Pandas
* NumPy
* Plotly Express

**Techniques**

* Data cleaning
* Missing value analysis
* Exploratory Data Analysis (EDA)
* Data visualization
* Behavioral analysis

---

# 📊 Key Business Questions

This analysis attempts to answer questions such as:

* What behavioral patterns indicate customer churn?
* Do customers with higher order frequency churn less?
* Does delivery performance influence customer ratings?
* Which customer segments show the highest churn risk?

---

# 🔮 Future Improvements

Planned extensions for this project include:

* Building a **machine learning churn prediction model**
* Customer segmentation using clustering
* Feature importance analysis
* Retention strategy recommendations
* Time-series analysis of customer order behavior

---

# 📁 Project Structure

```
Food-Delivery-Churn-Analysis
│
├── churn_analysis.ipynb
├── food_delivery_dataset.csv
├── README.md
```

---

# 🎯 Skills Demonstrated

This project highlights key data analytics skills including:

* Data cleaning and preprocessing
* Exploratory Data Analysis
* Customer behavior analysis
* Data visualization with Python
* Business-oriented insight generation

---

# 📌 About This Project

This project is part of my **data analytics portfolio**, demonstrating my ability to analyze real-world datasets using Python and derive insights related to **customer behavior and churn risk**.


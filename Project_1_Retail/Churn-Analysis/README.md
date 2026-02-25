

# Food Delivery Customer Churn Analysis (Random Forest)

## Project Overview

This project analyzes customer behavior in a food delivery dataset and builds a **machine learning model to predict customer churn**.

The objective is to identify behavioral patterns that lead to customers becoming **inactive (churned)** and to evaluate the predictive power of various customer activity features.

The analysis includes:

* Data exploration and validation
* Data preprocessing and feature engineering
* Feature selection
* Random Forest modeling
* Model evaluation using **Out-of-Bag (OOB) validation**
* Feature importance analysis

The full notebook can be viewed here:
📄 **Sales-Analysis Notebook** 

---

# Dataset

The dataset contains **6000 customer records** from a food delivery platform.

### Key Variables

| Column          | Description                                |
| --------------- | ------------------------------------------ |
| customer_id     | Unique identifier for each customer        |
| gender          | Customer gender                            |
| age             | Age group                                  |
| city            | Customer location                          |
| signup_date     | Date of registration                       |
| order_id        | Unique order identifier                    |
| order_date      | Date of order                              |
| restaurant_name | Restaurant from which the order was placed |
| dish_name       | Dish ordered                               |
| category        | Food category                              |
| quantity        | Number of items ordered                    |
| price           | Order price                                |
| payment_method  | Payment type                               |
| order_frequency | Number of orders placed                    |
| last_order_date | Last order date                            |
| loyalty_points  | Reward points accumulated                  |
| delivery_status | Order delivery status                      |
| rating          | Customer rating (with missing values)      |
| rating_date     | Date of rating                             |
| churned         | Target variable (Active / Inactive)        |

---

# Project Workflow

## 1. Data Exploration

Initial checks were performed to understand the structure of the dataset:

* Preview of dataset
* Dataset dimensions
* Data types
* Missing value analysis

Key observation:

* The **rating column contained ~30% missing values**, so it was removed from modeling.

---

# 2. Data Preprocessing

### Removing Irrelevant Columns

The following identifiers were removed because they do not provide predictive information:

* `customer_id`
* `order_id`

---

### Handling Dates

Date columns were converted into useful behavioral features.

Example feature:

```
days_since_last_order
```

This measures customer inactivity and is an important churn indicator.

---

### Encoding Categorical Variables

Categorical variables were converted into numerical form using **One-Hot Encoding**.

Example:

```
gender → gender_Male, gender_Other
payment_method → payment_method_Cash, payment_method_Wallet
```

---

### Feature Scaling

Numerical features were standardized using:

```
StandardScaler
```

Features scaled include:

* price
* quantity
* loyalty_points
* order_frequency
* days_since_last_order

---

# 3. Train-Test Split

The dataset was divided into:

* **Training set (80%)**
* **Test set (20%)**

```
train_test_split(test_size = 0.2)
```

---

# 4. Feature Selection

Feature selection was performed using:

**Recursive Feature Elimination (RFE)**

The algorithm recursively removes the least important features until a selected subset remains.

```
RFE(estimator = RandomForestClassifier)
```

---

# 5. Model Training

The model used in this project is:

## Random Forest Classifier

Random Forest is an ensemble model that builds multiple decision trees and aggregates their predictions.

Model configuration:

```
RandomForestClassifier(
    n_estimators = 200,
    oob_score = True,
    random_state = 42
)
```

### Why Random Forest?

* Handles nonlinear relationships
* Works well with tabular data
* Automatically estimates feature importance
* Built-in **Out-of-Bag validation**

---

# 6. Model Evaluation

### Out-of-Bag (OOB) Score

Random Forest uses bootstrap sampling, leaving some observations unused for each tree. These unused samples are called **Out-of-Bag samples**.

They act as an internal validation set.

Example:

```
OOB Score ≈ 0.50
```

This indicates that the dataset contains **weak predictive signals for churn**.

---

# 7. Feature Importance

Random Forest identifies the most influential variables for churn prediction.

Top features:

| Feature               | Importance |
| --------------------- | ---------- |
| price                 | 0.139      |
| days_since_last_order | 0.135      |
| loyalty_points        | 0.134      |
| order_frequency       | 0.117      |
| quantity              | 0.057      |

These features represent **customer engagement and spending behavior**, which are typically strong indicators of churn.

---

# Key Insights

1. **Customer activity features dominate churn prediction**

   * order frequency
   * recency of orders
   * loyalty engagement

2. **Demographic features have weaker influence**

3. Behavioral metrics provide the most predictive power.

---

# Technologies Used

* Python
* Pandas
* NumPy
* Scikit-learn
* Seaborn
* Matplotlib
* Plotly

---

# Project Structure

```
project/
│
├── Sales-Analysis.ipynb      # Jupyter Notebook export
├── foodpanda_dataset.csv    # Dataset
├── README.md
```

---

# Future Improvements

Possible improvements to this model:

* Hyperparameter tuning (GridSearchCV)
* Testing boosting algorithms (XGBoost / LightGBM)
* Feature engineering using RFM metrics
* Handling high-cardinality categorical variables
* Using ROC-AUC for more robust evaluation

---

# Author : Ayush Anand

Data Analysis / Data Science / Machine Learning Project

Customer churn modeling using behavioral data from a food delivery platform.

---

# 📌 About This Project

This project is part of my **data analytics portfolio**, demonstrating my ability to analyze real-world datasets using Python and derive insights related to **customer behavior and churn risk**.


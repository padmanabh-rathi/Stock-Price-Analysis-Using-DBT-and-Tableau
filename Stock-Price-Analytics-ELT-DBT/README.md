### Project Overview: End-to-End Data Analytics System


#### **Project Summary**
This project builds an end-to-end data analytics system to process, transform, and visualize historical stock price data, providing actionable insights through metrics like Moving Averages, RSI, and Price Momentum. The system automates the data pipeline from ingestion to visualization using tools like Airflow, dbt, Snowflake, and Tableau.


---


#### **Key Features**
- **Automated Data Ingestion**: Fetches daily stock price data (e.g., META, AAPL) from the Alpha Vantage API.
- **Centralized Data Storage**: Stores raw and transformed data in Snowflake for scalability and high performance.
- **Data Transformation**: Utilizes dbt to calculate meaningful metrics like Moving Averages and RSI.
- **Pipeline Orchestration**: Manages data ingestion and transformation workflows using Airflow DAGs.
- **Visualization**: Presents key insights and metrics via Tableau dashboards.


---


#### **Components Breakdown**
1. **Data Collection**
   - Fetches historical stock data (last 90 days) using Alpha Vantage API.
   - Includes fields: Symbol, Date, Open, High, Low, Close, Volume.
   - Automated daily ingestion with Airflow.


2. **Data Storage**
   - Raw and transformed data are stored in structured Snowflake tables.
   - Supports efficient data processing and visualization.


3. **Data Transformation**
   - dbt performs ELT to calculate metrics like Moving Averages and RSI.
   - Transformation results are stored in Snowflake for visualization.


4. **Data Pipeline Automation**
   - Airflow automates daily ingestion, transformation, and table updates.
   - Uses DAGs for scheduling and task orchestration.


5. **Data Visualization**
   - Tableau visualizes derived metrics for trend analysis.
   - Provides interactive dashboards for informed decision-making.


---


#### **Technology Stack**
- **Airflow**: Automates and schedules data pipelines.
- **Snowflake**: Scalable cloud-based data storage.
- **dbt**: Performs data transformations for analytics-ready metrics.
- **Alpha Vantage API**: Data source for stock prices.
- **Tableau**: Visualization and dashboard creation.


---


#### **Key Metrics Derived**
- **Moving Averages**: Identifies trends over time.
- **RSI (Relative Strength Index)**: Assesses price momentum and potential reversals.
- **Price Momentum**: Highlights short-term stock movements.


---


#### **Project Goals**
- Automate data ingestion, transformation, and visualization for stock price data.
- Provide meaningful insights to facilitate data-driven decision-making.
- Ensure scalability and performance through robust data engineering practices.


---





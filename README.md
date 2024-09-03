# BIG_DATA_PROJECT
## Twitter Sentiment Analysis with Big Data Platforms
This project demonstrates the use of **big data platforms** such as **Databricks** and **AWS** to perform sentiment analysis on AI related tweets and extract actionable insights.

### Project Overview
The tweets used in this project were sourced from the public S3 bucket of WeCloudData. Since these tweets were not pre-labeled, **TextBlob** was employed to generate sentiment labels. The labeled data was then processed using **PySpark** for sentiment analysis. The results of this analysis were exported to a personal S3 bucket for further exploration.

To query and analyze the sentiment data, **Amazon Athena** was utilized. Finally, a comprehensive dashboard was created using **Amazon QuickSight** to visualize and derive insights from the sentiment analysis.

### Key Components
- **Data Labeling**: Sentiment labels were generated using **TextBlob** for the unlabeled tweets.
- **Sentiment Analysis**: Conducted using **PySpark MLlib** on Databricks.
- **Data Storage**: Results were exported to a personal **S3 bucket** on AWS.
- **Data Querying**: **Amazon Athena** was used to run SQL queries on the processed data.
- **Data Visualization**: Insights were visualized using **Amazon QuickSight** in a dashboard format.

### Repository Contents
- **Jupyter Notebook**: The labeling and machine learning processes are documented in a Jupyter notebook. A Databricks-compatible (DBC) version of the notebook is also provided.
- **SQL Queries**: The queries used in **Amazon Athena** are included in a separate SQL file.
- **Dashboard**: The **Amazon QuickSight** dashboard is saved as a PDF file for easy reference.

### Skills and Tools Used
- **NLP & Sentiment Analysis**: TextBlob, PySpark
- **Big Data & Cloud Platforms**: Databricks, AWS (EC2, S3, Amazon Athena, QuickSight)
- **Machine Learning & Data Pipeline**

### Accessing the Project
You can explore the Databricks notebook [here](https://databricks-prod-cloudfront.cloud.databricks.com/public/4027ec902e239c93eaaa8714f173bcfc/6674135409746784/2049850721467198/3350319427062091/latest.html).


<img width="786" alt="Histo_TweetsCounts_by_Type_ _Label" src="https://github.com/user-attachments/assets/d7ed54f8-c34b-455f-a6f1-43005c0c10d4">

<img width="707" alt="Sankey_Plot_Predicted_vs_Actual" src="https://github.com/user-attachments/assets/5bd3f2ba-2a91-4dda-b7d4-137671c6df48">

<img width="779" alt="Wordcloud2" src="https://github.com/user-attachments/assets/b2c680bd-b42b-4cb8-a6a9-ca72e054e288">




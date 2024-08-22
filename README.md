# WCD_BIG_DATA_PROJECT
## Twitter Sentiment Analysis

This project leverages **big data platforms** such as **Databricks** and **AWS** to perform **sentiment analysis** of tweets and extract insights.

The tweets were extracted from the public S3 bucket of WeCloudData. Since they were not labeled, **TextBlob** was used to generate sentiment labels. Then, the sentiment analysis was conducted using **PySpark** , and the results were exported to my personal S3 bucket. From there, **Amazon Athena** was used to run queries, and finally, a dashboard was created on **QuickSight** to gain insights from the analysis.

The labeling and the machine learning processes can be viewed in the Jupyter notebook. A Databricks-compatible (DBC) version of the notebook is also available in this repository.

The queries used on Amazon Athena are provided in a SQL file, and the QuickSight dashboard is saved as a PDF file.


Skills/Tools: NLP, sentiment analysis, TextBlob, PySpark, AWS (EC2, S3, Amazon Athena, Quicksight), Machine Learning, Pipeline,


<img width="786" alt="Histo_TweetsCounts_by_Type_ _Label" src="https://github.com/user-attachments/assets/d7ed54f8-c34b-455f-a6f1-43005c0c10d4">

<img width="707" alt="Sankey_Plot_Predicted_vs_Actual" src="https://github.com/user-attachments/assets/5bd3f2ba-2a91-4dda-b7d4-137671c6df48">

<img width="779" alt="Wordcloud2" src="https://github.com/user-attachments/assets/b2c680bd-b42b-4cb8-a6a9-ca72e054e288">




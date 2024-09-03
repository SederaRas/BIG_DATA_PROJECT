
 # BIG DATA PROJECT: ATHENA QUERY

# -- After we upload our tweets data and the prediction table into the S3 bucket, we created those tables in Athena.
# -- As our label and prediction columns are numericals, we created new columns that display the class names.
# -- Also we created a column that shows if a tweet is an original tweet or a retweet.
########################################################################################################################

# -- 1. Create the table of the tweets raw data with label

CREATE EXTERNAL TABLE IF NOT EXISTS `b5_bigdata_project`.`AI_tweets_labeled` (
  `id` string,
  `name` string,
  `username` string,
  `tweet` string,
  `followers_count` integer,
  `location` string,
  `geo` string,
  `created_at` string,
  `label` integer
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim' = '\t',
  'collection.delim' = '\u0002',
  'mapkey.delim' = '\u0003'
)
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat' OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://b5-sedera/AI_tweets_labeled.csv/';


# -- 2. Create the prediction table #

CREATE EXTERNAL TABLE IF NOT EXISTS `b5_bigdata_project`.`AI_predictions_data` (
  `id` string,
  `name` string,
  `username` string,
  `tweet` string,
  `followers_count` integer,
  `location` string,
  `geo` string,
  `created_at` string,
  `label` integer,
  `prediction` integer
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim' = '\t',
  'collection.delim' = '\u0002',
  'mapkey.delim' = '\u0003'
)
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat' OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://b5-sedera/AI_predictions.csv/';


# -- 3. Create a table of the tweets with two new columns: label_class and is_retweet

CREATE TABLE "b5_bigdata_project"."AI_tweets_table" WITH (format = 'TEXTFILE', field_delimiter = '\t') AS
SELECT *,
  case
    when label = 0 then 'Negative'
    when label = 1 then 'Neutral' else 'Positive'
  end as label_class,
  case
    when tweet like '%RT %' then 'Retweet' else 'tweet'
  end as is_retweet
FROM ai_tweets_labeled;


# -- 4. Create a table of the predictions with three new columns: label_class, prediction_class and is_retweet

CREATE TABLE "b5_bigdata_project"."Pedictions" WITH (
  format = 'TEXTFILE',
  external_location = 's3://b5-sedera/ATHENA query Sedi/',
  field_delimiter = '\t'
) AS
SELECT *,
  case
    when label = 0 then 'Negative'
    when label = 1 then 'Neutral' else 'Positive'
  end as label_class,
  case
    when prediction = 0 then 'Negative'
    when prediction = 1 then 'Neutral' else 'Positive'
  end as prediction_class,
  case
    when tweet like '%RT %' then 'Retweet' else 'tweet'
  end as is_retweet
FROM ai_predictions_data;

 # -- 5. At the end a table of the tweets already cleaned was created to avoid cleaning again the tweets in Athena.
CREATE EXTERNAL TABLE IF NOT EXISTS `b5_bigdata_project`.`AI_tweets_Cleaned` (
  `id` string,
  `name` string,
  `username` string,
  `tweet` string,
  `followers_count` int,
  `location` string,
  `geo` string,
  `created_at` string,
  `label` integer
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim' = '\t',
  'collection.delim' = '\u0002',
  'mapkey.delim' = '\u0003'
)
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat' OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://b5-sedera/AI_tweets_Clean.csv/';
Use Marketing_Analysis;


-- csutomer_segementation_data
Select *
From customer_segmentation_data;


-- Basic info about dataset

-- Check total number of customers
select count(*) as total_customers
from customer_segmentation_data;

-- Answer: Total customers 1000.

-- Check for duplicate records
select 
      id,
      count(*) as duplicate_count
from customer_segmentation_data
group by id
having count(*) >1;

-- Answer: 0

-- Check exact duplicate records
select count(*) as Duplicate_records
From(
     select *
     from customer_segmentation_data
     group by id, age, gender, income, spending_score,
              membership_years, purchase_frequency,
              preferred_category, last_purchase_amount
	having count(*) >1
) as duplicates;

-- Answer: 0

-- Check missing values
select
     sum(id is null) as missing_id,
     sum(age is null) as missing_age,
     sum(gender is null) as missing_gender,
     sum(income is null) as missing_income,
     sum(spending_score is null) as missing_spending_score,
     sum(membership_years is null) as missing_membership_years,
     sum(purchase_frequency is null) as missing_purchase_frequency,
     sum(preferred_category is null) as missing_preferred_category,
     sum(last_purchase_amount is null) as missing_last_purchase_amount
from customer_segmentation_data;

-- Answer: 0

-- Analysis 
-- Gender distribution (understanding the customer demographics)
select
    gender,
    count(*) AS total_customers,
    concat(
        ROUND(
            COUNT(*) * 100.0 /
            (select COUNT(*) from customer_segmentation_data),
            2
        ),
        '%'
    ) as percentage
from customer_segmentation_data
group by gender
order by total_customers desc;
     
-- Answer: The gender distribution shows that Male customers account for the highest proportion at 35.70% (357 customers), followed by Other at 32.70% (327 customers) and Female customers at 31.60% (316 customers). Overall, the distribution is relatively balanced across all three categories.
     
-- Which products or categories are most popular?
select
    preferred_category,
    count(*) AS total_customers,
    concat(
        ROUND(
            COUNT(*) * 100.0 /
            (select COUNT(*) from customer_segmentation_data),
            2
        ),
        '%'
    ) as percentage
from customer_segmentation_data
group by preferred_category
order by total_customers desc;

-- Answer: Electronics has the highest proportion at 21.50% (215 customers), followed by Sports (21.00%), Home & Garden (20.60%), Groceries (19.90%) and Clothing (17.00%).

-- Average customer income and spending score
select
      Round(avg(age), 2) as average_age,
      round(avg(income), 2) as average_income,
      round(avg(spending_score), 2) as average_spending_score,
      round(avg(membership_years), 2) as average_membership_years,
      round(avg(purchase_frequency), 2) as average_purchase_frequency,
      round(avg(last_purchase_amount), 2) as average_last_purchase_amount
from customer_segmentation_data;

-- Answer: The average customer age is 43.78 years, average income is 88,500.80, spending score is 50.69, membership duration is 5.47 years, purchase frequency is 26.60, and last purchase amount is 492.35.

-- Let's identify which age group has the highest number of customers.
SELECT
    CASE
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS Age_Group,

    COUNT(*) AS Total_Customers,

    CONCAT('$', FORMAT(AVG(income), 2)) AS Average_Income,

    ROUND(AVG(spending_score), 2) AS Average_Spending_Score

FROM customer_segmentation_data

GROUP BY Age_Group

ORDER BY Total_Customers DESC;

-- Answer: The 45–54 age group has the highest number of customers (218), followed by 55–64 (205) and 25–34 (199). The 18–24 group has the highest average income ($91,287.46), while the 35–44 group has the highest average spending score (55.84).

-- Top 10 customers
select
      id,
      age, 
      gender,
      income,
      spending_score,
      last_purchase_amount
from customer_segmentation_data
order by last_purchase_amount desc
limit 10;

-- Answer: The top 10 customers have last purchase amounts ranging from $990.87 to $999.74. Customer ID 267 recorded the highest purchase amount of $999.74, followed by customer ID 381 at $998.98.

-- Bottom 10 customers
select
      id,
      age, 
      gender,
      income,
      spending_score,
      last_purchase_amount
from customer_segmentation_data
order by last_purchase_amount asc
limit 10;

-- Answer: The 10 lowest last purchase amounts range from $10.40 to $15.04. Customer ID 486 recorded the lowest purchase amount of $10.40, followed by customer ID 881 at $11.01.

-- Purchasing behaviour by category (investigating which shopping categories have the highest average purchase amounts).
select
      preferred_category,
      count(*) as total_customers,
      
      round(avg(last_purchase_amount), 2)
            as average_purchase_amount,
            
       round(avg(purchase_frequency), 2)
            as average_purchase_frequency
from customer_segmentation_data
group by preferred_category
order by average_purchase_amount desc; 

-- Answer: Home & Garden has the highest average purchase amount ($505.60), followed by Electronics ($496.63). Sports has the lowest average purchase amount ($481.95), while Groceries has the highest average purchase frequency (27.16).

-- Calculate customer income groups (Let's classify customers into three income groups).
select
      case
          when income < 60000 then 'low income'
          when income between 60000 and 100000 then 'medium income'
          else 'high income'
      end as income_group,
      
      count(*) as total_customers,
      round(avg(spending_score), 2) as average_spending_score
from customer_segmentation_data
group by income_group
order by total_customers desc;      

-- Answer: High-income customers represent the largest group (400), followed by medium-income (330) and low-income customers (270). Average spending scores are relatively similar across all groups, with medium-income customers scoring highest at 51.37, suggesting income has little impact on spending behaviour.

-- Analyse correlations (We want to understand whether income, age, membership and purchase frequency are related).
select
    ROUND(
        (AVG(age * income) - AVG(age) * AVG(income)) /
        (STDDEV_POP(age) * STDDEV_POP(income)),
        3
    ) AS Age_Income_Correlation,

    ROUND(
        (AVG(income * spending_score) -
        AVG(income) * AVG(spending_score)) /
        (STDDEV_POP(income) * STDDEV_POP(spending_score)),
        3
    ) AS Income_Spending_Correlation,

    ROUND(
        (AVG(purchase_frequency * spending_score) -
        AVG(purchase_frequency) * AVG(spending_score)) /
        (STDDEV_POP(purchase_frequency) * STDDEV_POP(spending_score)),
        3
    ) AS Frequency_Spending_Correlation

from customer_segmentation_data;

-- Answer: The correlation results (Age–Income: -0.001, Income–Spending: 0.000, Frequency–Spending: 0.007) indicate almost no linear relationship between these variables. This suggests that age, income and purchase frequency have very little correlation with customers' spending scores.
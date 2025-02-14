create database superstore;
use superstore;
select *from ss_sales;
select count(*) from sales;
alter table sales rename ss_sales;

# Task: Identify all orders shipped using "Second Class" shipping mode.
# Follow-up: Sort these orders by "Sales" in descending order and list the top three. Grouping and Aggregation

select *from sales where `Ship Mode`="Second Class";

select `Order ID`,`Ship Mode`,sum(sales) as order_sales from sales 
where `Ship Mode`="Second Class"
group by `Order ID`,`Ship Mode` 
order by `Order ID`desc;

#Task: Calculate the total profit and total sales for each "Region".
#Follow-up: Which region had the highest profit? Category Analysis

select Region,sum(sales) as total_sales,sum(profit) as total_profit
from sales
group by Region
order by total_profit desc
limit 1;



#Task: Analyze the "Category" column and answer the following: What is the total sales for the "Furniture" category? What is the average profit for items in the "Technology" category? Customer Insights
select sum(sales) as total_furniture_sales ,
avg(profit) as avg_profit_technology 
from ss_sales
where category = "Furniture" and "Technology" is not null;


# Task: Identify the customer who placed the highest number of orders.
# Follow-up: For this customer, calculate their total sales and total profit. Discount Impact Analysis
select `Customer ID`,`Customer Name`,count(`Order ID`) as max_order,
sum(sales) as total_sales, 
sum(profit) as total_profit,
sum(discount) as total_discount
from ss_sales 
group by `Customer ID`,`Customer Name`
limit 1;


#Task: Analyze the "Discount" column and calculate the average discount across all orders. Follow-up: Does applying a discount always result in a loss? Support your answer with data.
select `Order ID`,`Customer Name`,avg(Discount) as average_discount
from ss_sales 
group by `Order ID`,`Customer Name`;

#Task: Compare the average profit margins (Profit/Sales) for orders shipped using "Standard Class" and "Second Class". Follow-up: Which shipping mode is more profitable?
select `Ship Mode`, avg(profit) and avg(sales) as avg_profit_margin
from ss_sales 
where `Ship Mode`in("Standard Class","Second Class")
group by `Ship Mode`
order by avg_profit_margin desc;




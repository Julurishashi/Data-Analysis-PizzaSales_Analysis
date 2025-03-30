use projectmarch;

select * from pizza_sales;

#total revenue
select round(sum(total_price),2)  as total_revenue from pizza_sales;  #'817860.05'

#average order value  total_revenue by total orders

select sum(total_price) as total_revenue ,count(distinct order_id) as total_orders , (sum(total_price)/count(distinct order_id)) as average_order_value from pizza_sales;


#'817860.05', '48620', avg reve  '38.30' 

#pizzas sold 
select sum(quantity)as   totalpizzas from pizza_sales;  #49574

#total orders 
select count(distinct order_id ) as totalorders from pizza_sales;  #21350 

#average pizza per order 
select sum(quantity) as totalsold , count(distinct order_id) as totalorders , round(sum(quantity)/count(distinct order_id),2) as avgpiz from pizza_sales; #2.32 


select * from pizza_sales;

-- alter table pizza_sales modify column order_date ,  STR_TO_DATE(order_date,'%Y-%m-%d') ;

update pizza_sales set order_date=str_to_date(order_date,'%d-%m-%Y');

select year(order_date) as y from pizza_sales;	

select * from pizza_sales;

update pizza_sales set order_time=str_to_date(order_time,'%H:%i:%m');
UPDATE pizza_sales
SET order_time = STR_TO_DATE(order_time, '%H:%i:%s');


select hour(order_time) from pizza_sales;




select dayname(order_date) as order_day , count(distinct order_id ) as total_order from pizza_sales group by dayname(order_date);	

#month 

select monthname(order_date) as month , count(distinct order_id) as total_orders from pizza_sales group by monthname(order_date) order by count(distinct order_id) desc ;

#percentage of sales by pizza cate
select * from pizza_sales;

with cattot as (
select pizza_category , sum(total_price)  as cattotal from pizza_sales group by  pizza_category )

select  c.* , (c.cattotal / sum(p.total_price) )* 100 from cattot c join pizza_sales p on c.pizza_category=p.pizza_category group by p.pizza_category; 


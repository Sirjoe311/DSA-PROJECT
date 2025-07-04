-------CREATE KSM-DB----
Create database KSM_DB

-------CREATE TABLE KMS INVENTORY BY USING THE "IMPORT FLAT FUNCTION--------


1.-----Product Category with the highest sales

Select Product_Category,
Sum (sales) AS Total_Sales
From inventory
Group by Product_Category
order by Total_Sales Desc


2a.------Top 3 Regions by Sales------

Select Top 3 region,
Sum (sales) AS Total_Sales
From inventory
Group by region
order by Total_Sales Desc


2b------Bottom 3 Regions by Sales------

Select top 3 region,
Sum (sales) AS Total_Sales
From inventory
Group by region
order by Total_Sales Asc;

 
3 --------Total Sales of appliances in ontario-------

Select Sum(sales) As Total_sales
From inventory
Where Product_Sub_Category = 'appliances'
And Province = 'Ontario';

4. ---------Bottom 10 customers-------

Select Top 10 Customer_Name,
Sum (sales) AS Total_Revenue
From inventory
Group by Customer_Name
order by Total_Revenue Asc;

5.----------KSM most shipping cost and the method---------

Select Top 3 Ship_Mode,
Sum (shipping_Cost) AS Total_Shipping_Cost
From inventory
Group by Ship_Mode
order by Total_Shipping_Cost Desc;


6.-------Most valuable customers and the products/services the purchase-----  

Select top 5 Customer_Name,Product_Name,
count (Product_Name) As puchase_count,
sum (Sales) As Total_Sale
From Inventory
Group by Customer_Name,Product_Name
Order by Total_Sale Desc;


7.--------Small business customer with the highest sales--------

Select top 1 Customer_Name,
sum (Sales) As Total_Sale
From Inventory
Where Customer_Segment = 'Small Business'
Group by Customer_Name
Order by Total_Sale Desc


8.-------The Corporate customer with the highest number of orders -------

Select Top 1 Customer_Name,
count (Order_ID) AS Total_Order
From inventory
where Customer_Segment = 'Corporate'
Group by  Customer_Name
order by Total_Order Desc;


9.------Consumer customer that's most profitable-----

Select Top 1 Customer_Name,
sum (Profit) AS Total_Profit
From inventory
where Customer_Segment = 'Consumer'
Group by  Customer_Name
order by Total_Profit Desc;


Select * from inventory

10.------Customers that return items and their segments------

Select Distinct
Inventory.Order_ID,
Inventory.Customer_Name,
Inventory.Customer_Segment
From inventory	
Join Order_status
ON Inventory.Order_ID = Order_Status.Order_ID
Where Order_status.Status = 'Returned'

--OR---

Select Distinct o.order_ID,o.Customer_Name,o.Customer_Segment
From [dbo].[Inventory]o
Join [dbo].[Order_Status]r
on o.Order_ID = r.Order_ID
where r.Status = 'Returned'




-----OTHERES----

11. ---------Join Table Inventory and Order Status-----------

Select 
Inventory.Order_ID,
Inventory.Customer_Name,
Inventory.Customer_Segment,
Order_status.order_ID,
Order_status.Status
From inventory
Left Join Order_status
ON Inventory.Order_ID = Order_Status.Order_ID;


Select Distinct
Inventory.Order_ID,
Inventory.Customer_Name,
Inventory.Customer_Segment
From inventory	
Join Order_status
ON Inventory.Order_ID = Order_Status.Order_ID
Where Order_status.Status = 'Returned'




12.----------Change Sales Column to Datatype "2-Decimal-Place"-------- 

Alter Table Inventory
Alter Column Sales Decimal(10,2);


13.------Total Number of Product_Category------

Select count (distinct Product_category)
as total_Product_category
From inventory;


14.------A list of Product_Category------

Select distinct Product_category
as total_Product_category
From inventory;


15.------	Total shipping cost and total number of orders per ship Method

Select Ship_Mode,
Count (Order_ID) AS Total_Order,
Sum (Shipping_cost) AS Total_Shipping_cost
From inventory
Group by Ship_Mode
Order by Total_Shipping_cost Desc

16.----Select * from inventory------

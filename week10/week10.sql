use company;

#1) Shows the customer locations.

create view view_customer_location as 
select CustomerName , Country from Customers;



#2) Total quantity ordered for each product.
CREATE OR REPLACE VIEW view_product_sales AS
SELECT
    P.ProductName,
    SUM(OD.Quantity) AS TotalQuantity
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName;



select * from view_product_sales
where TotatlQuantity  < 150;


#3) Countries With the Most Customers.
CREATE OR REPLACE VIEW view_customers_by_country AS
SELECT
    Country,
    COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;

SELECT *
FROM view_customers_by_country
ORDER BY TotalCustomers DESC;




#4) Orders with Shipper Information.

CREATE OR REPLACE VIEW  view_order_shipper AS

SELECT O.OrderID, O.OrderDate , S.ShipperName , C.CustomerName 
FROM Orders O 
jOIN Customers C ON O.CustomerId = C.CustomerId
JOIN Shippers S  ON O.ShipperId = S.ShipperId ;

SELECT * FROM view_order_shipper;


 

/*

Join

Q1: get me all order id, customer name and date when ordre was placed.
*/

/*

--show tables;
--desc customers;
--desc orders;

*/


/*



select Orders.OrderId,Customers.CustomerName,Orders.OrderDate
FROM (Orders
JOIN Customers ON Orders.CustomerID=Customers.CustomerID); 


*/


/*
join  3 more tables

Q2.Get me order id,customer name and who is the shipper for that order.


--


select Orders.OrderId,Customers.CustomerName,Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID) LIMIT 5;

*/

/*

// LEFT JOIN



select Customers.CustomerID,Orders.OrderId,
FROM (Customers
LEFT JOIN Orders ON Customers.CustomerID=Orders.CustomerID);


/*

// Right JOIN

//swap the table names in left join


select Customers.CustomerID,Orders.OrderId,
FROM (Orders
LEFT JOIN Customers ON Customers.CustomerID=Orders.CustomerID);


*/

/*

//UNION -SHOWS DATA WITH NO DUPLICATES

SELECT City from Customers
UNION
SELECT City from Suppliers ORDER BY City;
-------------------------------------------------



//UNION ALL-SHOWS ALL DATA WITH DUPLICATES

SELECT City from Customers
UNION ALL
SELECT City from Suppliers ORDER BY City;


*/








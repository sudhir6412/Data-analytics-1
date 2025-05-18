CREATE DATABASE group2;

show databases;
use group2;
show  tables;
CREATE TABLE STUDENT ( ID INT PRIMARY KEY, NAME VARCHAR(30) NOT NULL, COURSE VARCHAR(30) DEFAULT "COMPUTER", AGE INT);
DESC TABLE STUDENT;
SELECT * FROM STUDENT;
select * from books;
select * from books where Genre="Fiction"; #1
select * from books where Published_Year >1950; #2
use group2;
select * from customers;
desc customers;
select * from customers;
select * from customers where country = "canada"; #3
desc orders;
select * from orders;
select * from orders where Order_Date between "2023-11-01"and "2023-11-30"; #4
select sum(stock) as total_stock from books; #5
select * from books where price = (select max(price) from books); #6
select * from orders where Quantity>1; #7
select * from orders where Total_Amount>20; #8
select distinct genre from books; #9
select genre from books group by genre having count("1"); #9
select * from books where stock = (select min(stock) from books); #10
select sum(Total_Amount) from orders; #11
#######################    Advance problems ##################
 
 use group2;
SELECT b.Genre, SUM(o.Quantity) AS Total_Books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Genre;   #1
SELECT AVG(price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy'; #2

SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2; #3

SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1; #4

SELECT * FROM books
WHERE genre ='Fantasy'
ORDER BY price DESC LIMIT 3; #5

SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Author; #6

SELECT DISTINCT c.city, total_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30; #7

SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc LIMIT 1; #8
























 













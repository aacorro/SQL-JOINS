/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name AS ProductName, c.Name AS CategoryName
 FROM products AS p
 INNER JOIN categories AS	c
 ON p.CategoryID = c.CategoryID
 WHERE c.Name = 'computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select p.Name as 'Prodeuct Name', p.Price, r.Rating
 from products as p
 inner join reviews as r
 on p.ProductID = r.ProductID
 where r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName, e.LastName, sum(s.Quantity) as Total
from sales as s
inner join employees as e
on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total desc
limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name as 'Department Name', c.Name as 'Category Name'
from departments as d
join categories as c
on c.DepartmentID = d.DepartmentID
where c.Name = 'Appliances' or c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.Name as 'Product Name', sum(s.Quantity) as 'QTY sold', sum(s.PricePerUnit * s.Quantity) as 'Total price sold'
from products as p
join sales as s
on p.ProductID = s.ProductID
where p.name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name as 'Product Name', r.Reviewer as 'Reviewer Name', r.Rating as 'Rating', r.Comment as 'Comment'
from products as p
join reviews as r
on p.ProductID = r.ProductID
where p.name = 'Visio TV'
limit 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.EmployeeID, e.FirstName, e.LastName, p.Name, sum(s.Quantity) as 'Total Sold'
from employees as e
join sales as s
on e.EmployeeID = s.EmployeeID
join products as p
on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
order by e.FirstName;
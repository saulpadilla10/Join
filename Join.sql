/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT P.Name, C.Name
FROM products as P
INNER JOIN categories as C ON C.CategoryID = P.CategoryID
WHERE C.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price
FROM products as P
inner join reviews as r ON r.ProductID = p.ProductID
WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, Sum(sales.Quantity)
FROM sales
inner join employees ON employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID
order by Sum(sales.Quantity) desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT categories.Name, departments.Name FROM departments
inner join categories on categories.departmentid = departments.DepartmentID
where categories.name = 'Appliances' or categories.Name = 'Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT sum(sales.quantity), sum(sales.PricePerUnit) from sales
 left join products on products.ProductID = sales.ProductID
 where products.name = 'Eagles: Hotel California';


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT reviews.Reviewer, reviews.rating, reviews.comment
FROM reviews
left join products on products.ProductID = reviews.ProductID
where products.Name = 'Visio TV'
order by reviews.rating asc
limit 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sales.Quantity
from employees
inner join sales on sales.EmployeeID = employees.EmployeeID
left join products on products.ProductID = sales.ProductID
order by sales.Quantity desc;


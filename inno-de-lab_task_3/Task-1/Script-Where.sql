SELECT 
	first_name,
	last_name,
	age,
	country
FROM 
	customers 
WHERE age > 25
	AND country = 'USA';

SELECT 
	*
FROM orders
WHERE amount > 1000;
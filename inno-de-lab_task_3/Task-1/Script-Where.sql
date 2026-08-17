
-- все клиенты из USA которым больше 25
SELECT 
	first_name,
	last_name,
	age,
	country
FROM 
	customers 
WHERE age > 25
	AND country = 'USA';

-- заказы, сумма которых более тысячи
SELECT 
	*
FROM orders
WHERE amount > 1000;
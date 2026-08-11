SELECT 
	c.country,
	count(*)
FROM 
	customers AS c
GROUP BY c.country 
ORDER BY c.country DESC;

SELECT 
	item,
	count(*),
	round(avg(amount), 2) AS avg_amount
FROM 
	orders
GROUP BY 
	item
ORDER BY 
	item;
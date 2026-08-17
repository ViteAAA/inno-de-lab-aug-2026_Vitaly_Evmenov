-- колличество клиентов по каждой стране
SELECT 
	c.country,
	count(*)
FROM 
	customers AS c
GROUP BY c.country 
ORDER BY c.country DESC;

-- общее колличетсво заказов и средняя сумма по каждому товару
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
-- поиск по следующим критериям
SELECT 
	CONCAT(c.first_name, ' ', c.last_name) AS full_name, -- полное имя клиенты, полученное путем конкотенации строк
	c.country,
	COUNT(o.order_id) AS total_order, -- колличество заказов этого клиента
	SUM(o.amount) AS total_amount -- общая сумма заказов
FROM 
	customers AS c
INNER JOIN 
	orders AS o ON
	c.customer_id = o.customer_id
WHERE
	EXISTS (
		SELECT 
			status
		FROM
			shippings
		WHERE 
			status = 'Delivered' -- имеют доставку со статусом 'Delivered'
			AND 
			c.customer_id = customer 
)
GROUP BY 
	c.customer_id
HAVING
	COUNT(o.order_id) >= 2 --клиенты, сделавшие хотя бы 2 заказа
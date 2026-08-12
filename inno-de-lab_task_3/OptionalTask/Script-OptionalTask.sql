SELECT 
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	c.country,
	COUNT(o.order_id) AS total_order,
	SUM(o.amount) AS total_amount
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
			status = 'Delivered'
			AND 
			c.customer_id = customer 
)
GROUP BY 
	c.customer_id
HAVING
	COUNT(o.order_id) >= 2
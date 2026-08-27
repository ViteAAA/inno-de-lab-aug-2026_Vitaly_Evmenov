-- список заказов с именем клиента, который сделал заказ
SELECT
	c.first_name,
	c.last_name,
	o.item,
	o.amount
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id;

-- список доставок со статусом и именем клиента
SELECT 
	s.status,
	c.first_name,
	c.last_name
FROM shippings AS s
LEFT JOIN customers AS c ON c.customer_id = s.customer

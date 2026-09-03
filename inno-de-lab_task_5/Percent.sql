-- calculate the percentage of orders for each status
SELECT
	COUNT(*) AS order_count,
	status,
	ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percent
FROM 
	dim_orders
WHERE 
	orderdate > (CURRENT_DATE - INTERVAL '1 year')
GROUP BY
	status;

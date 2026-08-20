SELECT
	COUNT(*) AS order_count,
	status,
	ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percent
FROM 
	dim_orders
WHERE 
	orderdata > (CURRENT_DATE - INTERVAL '1 month')
GROUP BY
	status;

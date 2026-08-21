-- for checking the workload of workers
SELECT 
	fr.fk_employeeid,
	CONCAT(de.firstname, de.lastname) AS full_name,
	COUNT(*) AS total_orders,
	AVG(fr.rating)
FROM 
	facts_requestassignments fr
INNER JOIN 
	dim_employees de
	ON fr.fk_employeeid = de.employeeid
WHERE 
	fr.startorderdate >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY 
	fr.fk_employeeid,
	de.firstname,
	de.lastname
ORDER BY 
	total_orders DESC;

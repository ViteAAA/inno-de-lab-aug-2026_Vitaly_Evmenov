-- for checking the workload of workers by total time spent
SELECT 
	fr.fk_employeeid,
	CONCAT(de.firstname, ' ', de.lastname) AS full_name,
	SUM(fr.endorderdate - fr.startorderdate) AS total_working_time,
	COUNT(*) AS total_orders,
	ROUND(AVG(fr.rating), 2) AS average_rating
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
	total_working_time DESC;
-- for generation all month in this year
WITH months AS ( 
	SELECT
		TO_CHAR(d, 'YYYY-MM') AS analysis_month,
		DATE_TRUNC('month', d) AS month_start,
		DATE_TRUNC('month', d) + INTERVAL '1 month' - INTERVAL '2 day' AS month_end
	FROM
		generate_series(
	        DATE_TRUNC('year', NOW()),
	        DATE_TRUNC('month', NOW()),
	        INTERVAL '1 month'
	    ) AS d
),
-- for calculation expenses in this year
monthly_expenses AS ( 
	SELECT 
		TO_CHAR(fr.startorderdate, 'YYYY-MM') AS analysis_month,
		SUM(fr.cost) AS expenses
	FROM 
		facts_requestassignments fr
	WHERE 
		fr.startorderdate >= DATE_TRUNC('year', NOW())
		AND 
		fr.endorderdate IS NOT NULL
	GROUP BY 
		TO_CHAR(fr.startorderdate, 'YYYY-MM')
),
-- for calculation earning in every month (and even if the contract runs for only a month)
monthly_earned AS ( 
	SELECT 
		m.analysis_month,
		SUM(dc.price) AS earned
	FROM
		months m
	INNER JOIN 
		dim_contracts dc 
		ON dc.startcontractperiod <= m.month_end
		AND dc.endcontractperiod >= m.month_start
		AND dc.endcontractperiod >= DATE_TRUNC('year', NOW())
	GROUP BY 
		m.analysis_month
)
SELECT
	m.analysis_month,
	COALESCE(me.expenses, 0) AS expenses,
	COALESCE(mer.earned, 0) AS earned,
	(COALESCE(mer.earned, 0) - COALESCE(me.expenses, 0)) AS revenue
FROM 
	months m
LEFT JOIN 
	monthly_expenses me
	ON
	m.analysis_month = me.analysis_month
LEFT JOIN 
	monthly_earned mer
	ON
	m.analysis_month = mer.analysis_month;
	 


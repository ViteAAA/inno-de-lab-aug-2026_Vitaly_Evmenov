-- сортировка клиентов по возрасту по убыванию
SELECT
	first_name,
	age
FROM 
	customers AS c
ORDER BY 
	age DESC;
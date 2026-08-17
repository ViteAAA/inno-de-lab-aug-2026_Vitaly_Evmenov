-- создание hr_user с присвоением прав
CREATE USER hr_user WITH PASSWORD 'hr123';

CREATE ROLE hr_for_select;
GRANT SELECT ON employees TO hr_for_select;


GRANT INSERT, UPDATE ON employees TO hr_for_select;
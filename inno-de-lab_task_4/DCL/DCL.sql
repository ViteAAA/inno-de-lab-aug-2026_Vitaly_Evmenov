-- создание hr_user с присвоением прав
CREATE USER hr_user WITH PASSWORD 'hr123';

GRANT SELECT ON employees TO hr_user;


GRANT INSERT, UPDATE ON employees TO hr_user;
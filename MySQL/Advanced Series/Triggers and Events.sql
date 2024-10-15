-- Triggers and Events


-- TRIGGERS

SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics(employee_id, first_name, last_name)
    VALUES(NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL);

-- EVENTS

DELIMITER $$
CREATE EVENT delete_retired
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%';

INSERT INTO employee_demographics(employee_id, first_name, last_name, age, gender, birth_date)
VALUES(2, 'Fasih', 'Ahmed', 65, 'Male', '1960-08-23');
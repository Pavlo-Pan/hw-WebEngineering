SELECT * FROM 281024_nataliia.employees;
SELECT 
    id AS employee_id,
    department_id
FROM 
    employees
WHERE 
   department_id = 3; 
    
    DELIMITER //

DROP PROCEDURE IF EXISTS get_employee_age;

CREATE PROCEDURE get_employee_age(
    IN emp_id INT,
    OUT emp_age INT
)
BEGIN
    SELECT age INTO emp_age
    FROM employees
    WHERE id = emp_id;
END //

DELIMITER ;

CALL get_employee_age(25, @age);
SELECT @age;


DELIMITER //

DROP PROCEDURE IF EXISTS increase_salary;

CREATE PROCEDURE increase_salary(
    INOUT emp_salary DECIMAL(10,2)
)
BEGIN
    SET emp_salary = emp_salary * 0.9;
END //

DELIMITER ;

SET @salary = 6000;
CALL increase_salary(@salary);
SELECT @salary;


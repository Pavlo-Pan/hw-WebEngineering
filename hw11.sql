use 281024_panukhnyk;
DROP FUNCTION IF EXISTS area_of_circle;
DELIMITER $$

CREATE FUNCTION area_of_circle(radius DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE area DOUBLE;
    SET area = PI() * POW(radius, 2);
    RETURN area;
END $$

DELIMITER ;


DROP FUNCTION IF EXISTS hypotenuse;
DELIMITER $$

CREATE FUNCTION hypotenuse(a DOUBLE, b DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE c DOUBLE;
    SET c = SQRT(POW(a, 2) + POW(b, 2));
    RETURN c;
END $$

DELIMITER ;

SELECT area_of_circle(10);
SELECT hypotenuse(3, 4);

CREATE SCHEMA HW_6;
USE HW_6;

/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DROP FUNCTION task_1;
DELIMITER $$
CREATE FUNCTION task_1(num INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE sec INT DEFAULT 0;
	DECLARE min INT DEFAULT 0;
	DECLARE h INT DEFAULT 0;
	DECLARE d INT DEFAULT 0;
    DECLARE res VARCHAR(50) DEFAULT '';
    
    SET sec = num % 60;
    SET num = (num - sec) / 60;
    SET min = num % 60 ;
    SET num = (num - min) / 60;
    SET h = num % 24;
    SET d = (num - h) / 24;
    SET res = CONCAT(d,' days ', h, ' hours ', min, ' minutes ', sec, ' seconds ');
    
    RETURN res;
END $$
DELIMITER ;
SELECT task_1(123456);

-- ------------------------------------

/*
2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

DROP PROCEDURE task_2;
DELIMITER $$
CREATE PROCEDURE task_2(x INT)
BEGIN
    DECLARE current_number INT DEFAULT 0;
	DECLARE res VARCHAR(200) DEFAULT CAST(current_number AS CHAR(200));
	REPEAT
		SET current_number = current_number + 1;
        IF current_number % 2 = 0
			THEN SET res = CONCAT(res, ', ', current_number);
        END IF;
		UNTIL current_number = x
    END REPEAT;
    SELECT res;
END $$
DELIMITER ;

CALL task_2(10);

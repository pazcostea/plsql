--Factorial de un numero
CREATE OR REPLACE FUNCTION factorial (num1 NUMBER)
RETURN NUMBER AS    
BEGIN    
    IF (num1 = 1) THEN
        return num1;
        ELSE           
            return num1 * factorial(num1 - 1);
    END IF;   
END;
/
BEGIN
    clg('El resultado es: ' || factorial(3));
END;
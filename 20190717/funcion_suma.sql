CREATE OR REPLACE FUNCTION funcion_suma (num1 NUMBER, num2 NUMBER)
RETURN NUMBER IS 
    resultado NUMBER;
BEGIN
    resultado := num1 + num2;
    RETURN resultado;
END;
/
BEGIN
    clg('El resultado es: ' || funcion_suma(1,2));
END;
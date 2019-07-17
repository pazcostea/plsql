CREATE OR REPLACE PROCEDURE sumar (num1 NUMBER, num2 NUMBER) IS
    resultado number;
BEGIN
    resultado := num1 + num2;
    clg('El resultado es ' || resultado);
END;
/
BEGIN
    sumar(1,2);
END;
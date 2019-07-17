CREATE OR REPLACE PROCEDURE hola_mundo IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hola mundo');
END;
/
BEGIN
    hola_mundo();
END;
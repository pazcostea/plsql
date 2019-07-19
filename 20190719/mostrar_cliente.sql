-- Código de David
CREATE OR REPLACE FUNCTION GET_NAME (ID NUMBER)
RETURN VARCHAR AS
    name VARCHAR2(20);
BEGIN
    select CUST_FIRST_NAME INTO NAME
    FROM DEMO_CUSTOMERS
    WHERE CUSTOMER_ID = id;
    
    /*select ORDER_ID INTO NAME
    FROM DEMO_ORDERS
    WHERE ORDER_ID = id;*/
    
    return name;
EXCEPTION
    WHEN no_data_found then
        return '';
END;
/
DECLARE
    nombre varchar2(20); 
    NO_CUSTOMER_FOUND exception;
BEGIN
    nombre := GET_NAME(111);

    IF LENGTH(nombre) IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('exception: ');
        RAISE NO_CUSTOMER_FOUND;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || nombre);
EXCEPTION
    WHEN NO_CUSTOMER_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No encontré ese cliente ');
END;
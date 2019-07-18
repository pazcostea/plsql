--Subprograma que muestre el nombre del mejor cliente
CREATE OR REPLACE PROCEDURE nombre_cliente IS
    nombre VARCHAR2 (100);
    id_cliente NUMBER(10);
BEGIN
    id_cliente := mejorcliente;
    DBMS_OUTPUT.PUT_LINE(id_cliente);    
    SELECT DEMO_CUSTOMERS.CUST_FIRST_NAME INTO nombre
        FROM DEMO_CUSTOMERS
        WHERE DEMO_CUSTOMERS.CUSTOMER_ID = id_cliente;
    DBMS_OUTPUT.PUT_LINE(nombre);
END;
/
BEGIN
    nombre_cliente;
END;

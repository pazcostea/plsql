DECLARE
    total_filas NUMBER(3);
    --%TYPE mira el tipo de dato en una celda dentro de una BBDD
    nombre_cliente DEMO_CUSTOMERS.CUST_FIRST_NAME%TYPE;
    nombre_producto DEMO_PRODUCT_INFO.PRODUCT_NAME%TYPE;    
    --%ROWTYPE permite almacenar toda la informacion de una fila
    cliente DEMO_CUSTOMERS%ROWTYPE;
BEGIN    
    --count es una instruccion de sql.
    -- Aqui vamos a contar el numero de filas que hay en la tabla BBDD DEMO_CUSTOMERS
    SELECT count(*) INTO total_filas FROM DEMO_CUSTOMERS;
    
    --Probamos a sacar el nombre del cliente que se encuentra en la posición 1
    SELECT CUST_FIRST_NAME INTO nombre_cliente FROM DEMO_CUSTOMERS WHERE CUSTOMER_ID = 1;
    DBMS_OUTPUT.PUT_LINE('Total filas DEMO_CUSTOMERS: ' || total_filas);
    DBMS_OUTPUT.PUT_LINE('Nombre cliente en DEMO_CUSTOMERS: ' || nombre_cliente);
    
    --Probamos con otra tabla
    SELECT count(*) INTO total_filas FROM DEMO_PRODUCT_INFO;
    DBMS_OUTPUT.PUT_LINE('Total filas en DEMO_PRODUCT_INFO: ' || total_filas);
    SELECT PRODUCT_NAME INTO nombre_producto FROM DEMO_PRODUCT_INFO WHERE PRODUCT_ID = 1;
    DBMS_OUTPUT.PUT_LINE('Nombre del producto DEMO_PRODUCT_INFO: ' || nombre_producto);
    
    --Probamos a sacar la informacion de una fila
    SELECT * INTO cliente FROM DEMO_CUSTOMERS WHERE CUSTOMER_ID = &id;    
    DBMS_OUTPUT.PUT_LINE('Nombre cliente en DEMO_CUSTOMERS: ' || cliente.CUST_FIRST_NAME);
    
END;
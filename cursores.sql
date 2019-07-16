DECLARE
    --Cursores, permite iterar sobre un conjunto de la BBDD
    --Los cursores hay que abrirlo y cerrarlos
    CURSOR mi_cursor IS SELECT * FROM DEMO_CUSTOMERS;
    fila_cliente DEMO_CUSTOMERS%ROWTYPE;
    --Creamos un cursor de un tipo
    CURSOR mi_cursor2 IS SELECT  CUST_FIRST_NAME FROM DEMO_CUSTOMERS;
    --Creamos una variable que es de tipo del cursor
    fila_custom mi_cursor2%ROWTYPE;
BEGIN
    OPEN mi_cursor;
        --Como tenemos un conjunto de datos hay que iterar sobre ellos
        LOOP
            --Fetch mi_cursor --> coge el dato de mi_cursor y lo mete en la variable fila_cliente
            FETCH mi_cursor INTO fila_cliente;
            --Funciona como las pilas, va leyendo fila a fila, cuando lee una fila, pasa a la siguiente            
            EXIT WHEN mi_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Nombre en cursor: ' ||fila_cliente.CUST_FIRST_NAME);
        END LOOP;
    CLOSE mi_cursor;
    -- Probamos a sacar sólo unos elementos
    OPEN mi_cursor2;        
        LOOP            
            FETCH mi_cursor2 INTO fila_custom;            
            EXIT WHEN mi_cursor2%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Nombre en cursor 2: ' ||fila_custom.CUST_FIRST_NAME);
        END LOOP;
    CLOSE mi_cursor;
END;
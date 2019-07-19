--Subprograma que muestre por pantalla los N mejores clientes
-- N < no puede superar el numero total de clientes
-- N < 50 --> aunque haya más de 50 clientes que falle
CREATE OR REPLACE PROCEDURE mejores_clientes (num_clientes NUMBER) IS
    nombre VARCHAR2 (100);   
    CURSOR clientes IS (SELECT CUSTOMER_ID FROM 
    (SELECT DEMO_ORDERS.CUSTOMER_ID
    FROM DEMO_ORDERS    
    GROUP BY DEMO_ORDERS.CUSTOMER_ID
    ORDER BY SUM(DEMO_ORDERS.ORDER_TOTAL) DESC)-- AS mej_clientes
    --A partir de aqui haríamos el left join
    --LEFT JOIN DEMO_CUSTOMERS
    --ON mej_clientes.CUSTOMER_ID = DEMO_CUSTOMERS.CUSTOMERS_ID
    WHERE ROWNUM <= num_clientes);
    MENOS_DE_0 EXCEPTION;
    MAS_DE_50 EXCEPTION;
    MAS_TOTAL_CLIENTES EXCEPTION;
    numero_total_clientes NUMBER;
BEGIN
    IF num_clientes <= 0 THEN
        RAISE MENOS_DE_0;
    END IF;
    
    IF num_clientes >= 50 THEN
        RAISE MAS_DE_50;
    END IF;
    
    SELECT COUNT(*) INTO numero_total_clientes
    FROM DEMO_CUSTOMERS;
    
    IF num_clientes >= numero_total_clientes THEN
        RAISE MAS_TOTAL_CLIENTES;
    END IF;
    
    FOR contador IN clientes LOOP
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || contador.CUSTOMER_ID);
    END LOOP;
    EXCEPTION
        WHEN MENOS_DE_0 THEN
            DBMS_OUTPUT.PUT_LINE('Ha introducido menos de 0 clientes');
        WHEN MAS_DE_50 THEN
            DBMS_OUTPUT.PUT_LINE('Ha introducido más de 50 clientes');
        WHEN MAS_TOTAL_CLIENTES THEN
            DBMS_OUTPUT.PUT_LINE('Ha introducido más del total de clientes');
        WHEN others THEN 
            DBMS_OUTPUT.PUT_LINE('Cualquier otro error');
END;
/
BEGIN
    mejores_clientes(&num_clientes);
END;


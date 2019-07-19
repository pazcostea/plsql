--Subprograma que muestre por pantalla los N mejores clientes
-- N < no puede superar el numero total de clientes
-- N < 50 --> aunque haya más de 50 clientes que falle
CREATE OR REPLACE PROCEDURE mejores_clientes (num_clientes NUMBER) IS
    nombre VARCHAR2 (100);   
    CURSOR clientes IS (SELECT CUSTOMER_ID FROM 
    (SELECT DEMO_ORDERS.CUSTOMER_ID, SUM(DEMO_ORDERS.ORDER_TOTAL) AS TOTAL
    FROM DEMO_ORDERS    
    GROUP BY DEMO_ORDERS.CUSTOMER_ID
    ORDER BY TOTAL)
    WHERE ROWNUM <= num_clientes);
BEGIN  
    FOR contador IN clientes LOOP
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || contador.CUSTOMER_ID);
    END LOOP;
END;
/
BEGIN
    mejores_clientes(&num_clientes);
END;


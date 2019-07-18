--Subprograma que devuelva el id del mejor cliente
CREATE OR REPLACE FUNCTION mejor_cliente 
RETURN NUMBER IS
    id_cliente NUMBER;
    --Reutilización del programa anterior
    CURSOR pedidos IS SELECT ID FROM 
    (SELECT DEMO_CUSTOMERS.CUSTOMER_ID AS ID, 
    COUNT(DEMO_ORDERS.ORDER_ID) AS NUM_COMPRAS, 
    CASE WHEN SUM(DEMO_ORDERS.ORDER_TOTAL)>0 THEN SUM(DEMO_ORDERS.ORDER_TOTAL) ELSE 0 END AS TOTAL
    FROM DEMO_CUSTOMERS LEFT JOIN DEMO_ORDERS
    ON DEMO_CUSTOMERS.CUSTOMER_ID = DEMO_ORDERS.CUSTOMER_ID
    GROUP BY DEMO_CUSTOMERS.CUSTOMER_ID
    ORDER BY TOTAL DESC) 
    WHERE ROWNUM = 1;
    pedid pedidos%ROWTYPE;
BEGIN    
    FOR contador IN pedidos LOOP
        --DBMS_OUTPUT.PUT_LINE(contador.ID);
        id_cliente := contador.ID;
    END LOOP;    
    RETURN id_cliente;
END;
/
BEGIN
    clg('El mejor cliente es: ' || mejor_cliente);
END;

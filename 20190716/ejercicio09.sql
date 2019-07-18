--Numero de compras por usuario
--Total gastado por usuario
DECLARE     
    CURSOR pedidos IS SELECT * FROM DEMO_CUSTOMERS;
    CURSOR pedidos_usuario (identUsu NUMBER) 
    IS SELECT DEMO_ORDERS.CUSTOMER_ID, SUM(DEMO_ORDERS.ORDER_TOTAL) AS total_compra 
    FROM DEMO_ORDERS 
    WHERE CUSTOMER_ID = identUsu 
    GROUP BY DEMO_ORDERS.CUSTOMER_ID;
    pedid_usu pedidos_usuario%ROWTYPE;
    pedid pedidos%ROWTYPE;
    total_pedidos NUMBER (3) := 0;
    total_compra NUMBER(8) := 0;
BEGIN
    OPEN pedidos;
        LOOP
            FETCH pedidos INTO pedid;            
            EXIT WHEN pedidos%NOTFOUND;
            SELECT count(*) INTO total_pedidos FROM DEMO_ORDERS WHERE CUSTOMER_ID = pedid.CUSTOMER_ID;            
            OPEN pedidos_usuario (pedid.CUSTOMER_ID);               
                LOOP                
                FETCH pedidos_usuario INTO pedid_usu;                    
                EXIT WHEN pedidos_usuario%NOTFOUND;
                END LOOP;
                DBMS_OUTPUT.PUT_LINE('ID usuario: ' ||pedid.CUSTOMER_ID || ' total compras: ' ||total_pedidos || ' total ' || pedid_usu.total_compra);
            CLOSE pedidos_usuario;            
        END LOOP;        
    CLOSE pedidos;
    
    
END;
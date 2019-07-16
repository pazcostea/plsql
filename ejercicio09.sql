--Numero de compras por usuario
DECLARE     
    CURSOR pedidos IS SELECT * FROM DEMO_CUSTOMERS;
    CURSOR pedidos_usuario (identUsu NUMBER) IS SELECT * FROM DEMO_ORDERS WHERE CUSTOMER_ID = identUsu;
    pedid_usu pedidos_usuario%ROWTYPE;
    pedid pedidos%ROWTYPE;
    total_pedidos NUMBER (3) := 0;
    total_compra NUMBER(3) := 0;
BEGIN
    OPEN pedidos;
        LOOP            
            FETCH pedidos INTO pedid;            
            EXIT WHEN pedidos%NOTFOUND;
            SELECT count(*) INTO total_pedidos FROM DEMO_ORDERS WHERE CUSTOMER_ID = pedid.CUSTOMER_ID;
            OPEN pedidos_usuario (pedid.CUSTOMER_ID);
                FETCH pedidos_usuario INTO pedid_usu;
                DBMS_OUTPUT.PUT_LINE('Total DENTRO: ' ||pedid_usu.ORDER_TOTAL);  
                EXIT WHEN pedidos_usuario%NOTFOUND;                
            CLOSE pedidos_usuario;
            DBMS_OUTPUT.PUT_LINE('ID usuario: ' ||pedid.CUSTOMER_ID);
            DBMS_OUTPUT.PUT_LINE('Total compras: ' ||total_pedidos);
            DBMS_OUTPUT.PUT_LINE('Total: ' ||pedid_usu.ORDER_TOTAL);            
        END LOOP;
        
    CLOSE pedidos;
    
    
END;
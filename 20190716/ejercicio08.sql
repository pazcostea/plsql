--Obtener de media cuanto me he gastado por pedido
DECLARE     
    CURSOR pedidos IS SELECT * FROM DEMO_ORDERS;
    CURSOR lineas_pedido (ident NUMBER) IS SELECT * FROM DEMO_ORDER_ITEMS WHERE ORDER_ID = ident;
    lpedidos lineas_pedido%ROWTYPE;   
    pedid pedidos%ROWTYPE;
    total NUMBER (10) := 0;
    cantidad_total NUMBER (10, 2) :=0;
    media NUMBER (10,2) :=0;
BEGIN
    OPEN pedidos;
    LOOP            
        FETCH pedidos INTO pedid;            
        EXIT WHEN pedidos%NOTFOUND;            
        DBMS_OUTPUT.PUT_LINE('----------------------------');
        DBMS_OUTPUT.PUT_LINE('----- Ticket nº: ' || pedid.ORDER_ID || ' ---------'); 
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
        OPEN lineas_pedido (pedid.ORDER_ID);
            cantidad_total := 0;
            LOOP            
                FETCH lineas_pedido INTO lpedidos;            
                EXIT WHEN lineas_pedido%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE(lpedidos.QUANTITY ||' unidades a ' || lpedidos.UNIT_PRICE || ' la unidad' || ' Total: ' || lpedidos.QUANTITY * lpedidos.UNIT_PRICE);                
                --total := lpedidos.QUANTITY * lpedidos.UNIT_PRICE;
                cantidad_total := cantidad_total + lpedidos.QUANTITY;
                --DBMS_OUTPUT.PUT_LINE('Total: ' || total);                
            END LOOP;    
        CLOSE lineas_pedido;
        DBMS_OUTPUT.PUT_LINE('Cantidad: ' || cantidad_total);
        DBMS_OUTPUT.PUT_LINE('Total pedido del ticket: ' || pedid.ORDER_TOTAL);
        media := pedid.ORDER_TOTAL/cantidad_total;
        DBMS_OUTPUT.PUT_LINE('Media ticket: ' || media);
        DBMS_OUTPUT.PUT_LINE('');  
    END LOOP;    
    CLOSE pedidos;  
    
END;
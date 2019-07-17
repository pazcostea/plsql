--Subprograma que devuelva total de productos vendidos entre dos fechas
CREATE OR REPLACE FUNCTION pdtos_vendidos 
RETURN NUMBER AS  
pedido_total NUMBER:=0;
BEGIN   
    SELECT SUM(DEMO_ORDER_ITEMS.QUANTITY) INTO pedido_total
    FROM DEMO_ORDER_ITEMS
    INNER JOIN DEMO_ORDERS
    ON DEMO_ORDER_ITEMS.ORDER_ID = DEMO_ORDERS.ORDER_ID
    WHERE TO_DATE(DEMO_ORDERS.ORDER_TIMESTAMP, 'dd/mm/yy') > '27/06/19' AND TO_DATE(DEMO_ORDERS.ORDER_TIMESTAMP, 'dd/mm/yy') < '12/07/19'
    ORDER BY DEMO_ORDER_ITEMS.ORDER_ID;    
    RETURN pedido_total;    
END;
/
BEGIN
    clg('El total es: ' || pdtos_vendidos);
END;
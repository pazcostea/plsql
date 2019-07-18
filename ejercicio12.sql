--Subprograma que devuelva total de productos vendidos entre dos fechas
CREATE OR REPLACE FUNCTION pdtos_vendidos (fecha1 VARCHAR2, fecha2 VARCHAR2)
RETURN NUMBER AS  
pedido_total NUMBER:=0;
BEGIN   
    SELECT SUM(DEMO_ORDER_ITEMS.QUANTITY) INTO pedido_total
    FROM DEMO_ORDER_ITEMS
    INNER JOIN DEMO_ORDERS
    ON DEMO_ORDER_ITEMS.ORDER_ID = DEMO_ORDERS.ORDER_ID
    WHERE TO_DATE(DEMO_ORDERS.ORDER_TIMESTAMP, 'dd/mm/yy') > TO_DATE(fecha1, 'dd/mm/yy') AND TO_DATE(DEMO_ORDERS.ORDER_TIMESTAMP, 'dd/mm/yy') < TO_DATE(fecha2, 'dd/mm/yy')
    ORDER BY DEMO_ORDER_ITEMS.ORDER_ID;    
    RETURN pedido_total;    
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('El total es: ' || pdtos_vendidos('&fecha1', '&fecha2'));
END;
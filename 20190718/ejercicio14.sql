--Subprograma que muestre media producto entre dos fechas
CREATE OR REPLACE PROCEDURE media_producto (fecha1 VARCHAR2, fecha2 VARCHAR2) AS
   
BEGIN
    DBMS_OUTPUT.PUT_LINE('La media es: ' || total_ingreso (fecha1, fecha2)/pdtos_vendidos (fecha1, fecha2));
    /*SELECT    
    DEMO_ORDER_ITEMS.PRODUCT_ID,
    SUM(DEMO_ORDER_ITEMS.UNIT_PRICE * DEMO_ORDER_ITEMS.QUANTITY) AS GASTO_PROD    
    FROM DEMO_ORDER_ITEMS
    INNER JOIN DEMO_ORDERS
    ON DEMO_ORDER_ITEMS.ORDER_ID = DEMO_ORDERS.ORDER_ID
    WHERE TO_DATE(DEMO_ORDERS.ORDER_TIMESTAMP, 'dd/mm/yy') > '25/06/19'  AND TO_DATE(DEMO_ORDERS.ORDER_TIMESTAMP, 'dd/mm/yy') < '08/07/19'
    GROUP BY DEMO_ORDER_ITEMS.PRODUCT_ID
    ORDER BY DEMO_ORDER_ITEMS.PRODUCT_ID;
    DBMS_OUTPUT.PUT_LINE(gasto_prod);
    --TO_DATE(fecha2, 'dd/mm/yy')
    --TO_DATE(fecha1, 'dd/mm/yy')  */    
END;
/
BEGIN
    media_producto('&fecha1', '&fecha2');
END;
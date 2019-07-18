--Subprograma que devuelva total dinero ingresado entre dos fechas
CREATE OR REPLACE FUNCTION total_ingreso (fecha1 VARCHAR2, fecha2 VARCHAR2)
RETURN NUMBER AS  
dinero_total NUMBER:=0;
BEGIN   
    SELECT SUM(DEMO_ORDERS.ORDER_TOTAL) INTO dinero_total
    FROM DEMO_ORDERS    
    WHERE TO_DATE(DEMO_ORDERS.ORDER_TIMESTAMP, 'dd/mm/yy') > TO_DATE(fecha1, 'dd/mm/yy') AND TO_DATE(DEMO_ORDERS.ORDER_TIMESTAMP, 'dd/mm/yy') < TO_DATE(fecha2, 'dd/mm/yy')
    ORDER BY DEMO_ORDERS.ORDER_ID;    
    RETURN dinero_total;    
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('El total ingresado es: ' || total_ingreso('&fecha1','&fecha2'));
END;
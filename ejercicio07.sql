--Sacar la media de los pedidos a partir de una fecha
DECLARE
    --Variables para sacar la fecha
    fechaUsu VARCHAR2(100) := '&fechaUsu';
    fecha DATE := TO_DATE(fechaUsu, 'dd/mm/yyyy');
    CURSOR campo_fecha IS SELECT ORDER_TIMESTAMP, ORDER_TOTAL FROM DEMO_ORDERS WHERE ORDER_TIMESTAMP > fecha;
    todas_fecha campo_fecha%ROWTYPE;
    --Declaramos las variables para obtener la media
    total_filas NUMBER(3);
    total NUMBER (10) := 0;
    CURSOR gasto IS SELECT ORDER_TOTAL FROM DEMO_ORDERS;
    gasto_pedido gasto%ROWTYPE;    
BEGIN    
    DBMS_OUTPUT.PUT_LINE('En el campo fecha he metido: ' || fecha);
    FOR fech IN campo_fecha LOOP
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || fech.ORDER_TIMESTAMP);
        DBMS_OUTPUT.PUT_LINE('Camntidad pedido: ' || fech.ORDER_TOTAL);
        total := total + fech.ORDER_TOTAL;
    END LOOP;    
    SELECT count(*) INTO total_filas FROM DEMO_ORDERS WHERE ORDER_TIMESTAMP > fecha;
    DBMS_OUTPUT.PUT_LINE('Total: ' ||total);
    DBMS_OUTPUT.PUT_LINE('La media por pedido es: ' ||total/total_filas); 
END;
--Calcular la suma en la tabla Demo_Orders de la columna ORDER_Total
--Calcular la media de gasto por pedido
DECLARE
    total_filas NUMBER(3);
    total NUMBER (10) := 0;
    CURSOR gasto IS SELECT ORDER_TOTAL FROM DEMO_ORDERS;
    gasto_pedido gasto%ROWTYPE;
BEGIN
    SELECT count(*) INTO total_filas FROM DEMO_ORDERS;
     --Ejemplo abriendo y cerrando cursor y haciendo el loop
     /*OPEN gasto;        
        LOOP            
            FETCH gasto INTO gasto_pedido;            
            EXIT WHEN gasto%NOTFOUND;            
            total := total + gasto_pedido.ORDER_TOTAL;
        END LOOP;
    CLOSE gasto;*/
    --Ejemplo con el for (automaticamente abre y cierra el cursor)
    FOR fila_cliente IN gasto LOOP
        total := total + fila_cliente.ORDER_TOTAL;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Total: ' ||total);
    DBMS_OUTPUT.PUT_LINE('La media por pedido es: ' ||total/total_filas);    
END;
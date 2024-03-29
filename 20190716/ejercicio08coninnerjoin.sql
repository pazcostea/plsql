--Obtener de media cuanto me he gastado por pedido
DECLARE     
    CURSOR pedidos 
    IS SELECT DEMO_ORDERS.ORDER_ID, SUM(QUANTITY*UNIT_PRICE)/SUM(QUANTITY) AS TOTAL
    FROM DEMO_ORDERS
    INNER JOIN DEMO_ORDER_ITEMS 
    ON DEMO_ORDERS.ORDER_ID = DEMO_ORDER_ITEMS.ORDER_ID
    GROUP BY DEMO_ORDERS.ORDER_ID
    order by demo_order_items.order_id;
    
BEGIN
    for ticket in pedidos loop
       DBMS_OUTPUT.PUT_LINE('Ticket n�' || ticket.ORDER_ID  || ' - ' || ticket.TOTAL);
   end loop;
END;
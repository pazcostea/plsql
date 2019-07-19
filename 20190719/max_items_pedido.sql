--Máximo número de items en un pedido
CREATE OR REPLACE PROCEDURE max_items_pedido IS
   items_maximo DEMO_ORDER_ITEMS.QUANTITY%TYPE;
BEGIN
    SELECT QUANTITY INTO items_maximo FROM 
    (SELECT ORDER_ID, PRODUCT_ID, QUANTITY
    FROM DEMO_ORDER_ITEMS
    ORDER BY QUANTITY DESC)
WHERE ROWNUM = 1;

    DBMS_OUTPUT.PUT_LINE('El máximo número de items en un pedido: ' || items_maximo);
END;
/
BEGIN
    max_items_pedido;
END;



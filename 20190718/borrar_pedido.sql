--Borra pedido si se borran todas las líneas
CREATE OR REPLACE TRIGGER borrar_pedido
AFTER DELETE ON DEMO_ORDER_ITEMS
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
    order_amount number(10);
    price_diference number(10,2) := :old.UNIT_PRICE * :old.QUANTITY;
    current_amount number(10,2);
BEGIN
    SELECT ORDER_TOTAL INTO order_amount 
    FROM DEMO_ORDERS
    WHERE DEMO_ORDERS.ORDER_ID = :OLD.ORDER_ID;
    
    current_amount := order_amount - price_diference;
    
    --INSERT INTO DEMO_LOGS VALUES ('Contador: ' || order_amount || ' Real: ' || current_amount);
    
    if current_amount <= 0 then
        --INSERT INTO DEMO_LOGS VALUES ('ESTOY DENTRO DEL IF');
        DELETE FROM DEMO_ORDERS WHERE order_id = :old.order_id;
    end if;
    
END;


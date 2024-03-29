CREATE OR REPLACE TRIGGER insercion
AFTER INSERT ON DEMO_ORDER_ITEMS
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
BEGIN
    UPDATE DEMO_ORDERS 
    SET ORDER_TOTAL = ORDER_TOTAL + (:NEW.UNIT_PRICE * :NEW.QUANTITY)
    WHERE DEMO_ORDERS.ORDER_ID = :NEW.ORDER_ID;
END;
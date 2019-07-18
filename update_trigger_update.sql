CREATE OR REPLACE TRIGGER modificacion
AFTER UPDATE ON DEMO_ORDER_ITEMS
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
BEGIN
    UPDATE DEMO_ORDERS 
    SET ORDER_TOTAL = ORDER_TOTAL - (:OLD.UNIT_PRICE * :OLD.QUANTITY) + (:NEW.UNIT_PRICE * :NEW.QUANTITY)
    WHERE DEMO_ORDERS.ORDER_ID = :OLD.ORDER_ID;
END;
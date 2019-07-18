--Borra pedido si se borran todas las l�neas
CREATE OR REPLACE TRIGGER borrar_pedido
BEFORE DELETE ON DEMO_ORDER_ITEMS
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
BEGIN
    DELETE FROM DEMO_ORDERS
    WHERE (SELECT * FROM (SELECT COUNT(*)FROM DEMO_ORDER_ITEMS GROUP BY ORDER_ID));
END;

SELECT * FROM (SELECT COUNT(*), ORDER_ID FROM DEMO_ORDER_ITEMS GROUP BY ORDER_ID);
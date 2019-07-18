CREATE OR REPLACE TRIGGER log_states_delete
AFTER DELETE ON DEMO_STATES
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
    fecha_actual DATE := SYSDATE;
    mensaje DEMO_LOGS.MENSAJE%TYPE := 'Registro eliminado en state: ' || :OLD.STATE_NAME;
BEGIN
    INSERT INTO DEMO_LOGS (LOG_DATE,MENSAJE) VALUES (fecha_actual, mensaje);
END;
/*
UPDATE DEMO_LOGS
SET MENSAJE = 'Ya no est�'
WHERE ROWNUM=1;
*/
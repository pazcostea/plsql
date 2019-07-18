/* Los trigger se desencadenan cuando se inserta, elimina o ... un elemento de la bbdd
CREATE OR REPLACE TRIGGER nombre_del_trigger
--momento en el que debe de actura {BEFORE | AFTER | INSTEAD OF}
--cuandos se hace el qué [INSERT [OR] UPDATE | DELETE]
-- nombre de la columna sobre la que quiero aplicar el trigger [OF  col_name]
ON nombre_de_la_tabla
[REFERENCING OLD AS o NEW AS n] -Solo se puede utilizar si se pone lo siguiente
[FOR EACH ROW]-- Para cada uno de los datos insertado en la tabla se ejecuta el trigger una vez
[WHEN (condicion)]
DECLARE
    Variables
BEGIN
[EXCEPTION]
END;
*/
--Vamos a crear una tabla de LOG
/*CREATE TABLE DEMO_LOGS(
    LOG_DATE DATE,
    MENSAJE VARCHAR2 (200)
);*/
CREATE OR REPLACE TRIGGER log_states_insert
AFTER INSERT ON DEMO_STATES
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
    fecha_actual DATE := SYSDATE;
    mensaje DEMO_LOGS.MENSAJE%TYPE := 'Registro insertado en state: ' || :NEW.STATE_NAME;
BEGIN
    INSERT INTO DEMO_LOGS (LOG_DATE,MENSAJE) VALUES (fecha_actual, mensaje);
END;
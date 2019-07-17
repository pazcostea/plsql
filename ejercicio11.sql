--Subprograma que muestre el nombre del mejor cliente
CREATE OR REPLACE PROCEDURE nombre_cliente (id_cli number) IS
    --nombre VARCHAR2;
BEGIN    
    --nombre := 'Pepe';
    DBMS_OUTPUT.PUT_LINE(id_cli);
END;
/
BEGIN
    nombre_cliente(1);
END;
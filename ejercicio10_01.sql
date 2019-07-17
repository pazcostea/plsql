--Subprograma que devuelva el id del mejor cliente
CREATE OR REPLACE FUNCTION mejor_cliente2 
RETURN NUMBER IS
    id_cliente NUMBER;
    
BEGIN    
    
    RETURN id_cliente;
END;
/
BEGIN
    clg('El mejor cliente es: ' || mejor_cliente2);
END;

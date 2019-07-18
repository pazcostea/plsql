--Dada una fecha (p.e. 2019/07/15) devolver si es fin de semana o no
DECLARE    
    fechaUsu VARCHAR2(100) := '&fechaUsu';    
    fecha DATE := TO_DATE(fechaUsu, 'dd/mm/yyyy');
    dia NUMBER(10):= TO_CHAR(fecha, 'D', 'NLS_DATE_LANGUAGE=SPANISH');    
BEGIN     
    IF dia > 5 THEN
        DBMS_OUTPUT.PUT_LINE('La fecha ' || fecha || ' es fin de semana');
    ELSE
        DBMS_OUTPUT.PUT_LINE('La fecha ' || fecha || ' no es fin de semana');
    END IF;
END;
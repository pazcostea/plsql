DECLARE
    num1 NUMBER(5) := &num1;    
    i NUMBER(2) := 0;    
BEGIN    
    DBMS_OUTPUT.PUT_LINE('Tabla con while');
    WHILE (i < 10) LOOP
        DBMS_OUTPUT.PUT_LINE(i || ' x ' || num1 || ' = ' || num1 * i);
        i := i + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Tabla con for');
    FOR contador IN 0..9 LOOP
        DBMS_OUTPUT.PUT_LINE(contador || ' x ' || num1 || ' = ' || num1 * contador );        
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Tabla con for al reves');
    FOR contador IN REVERSE 0..9 LOOP
        DBMS_OUTPUT.PUT_LINE(contador || ' x ' || num1 || ' = ' || num1 * contador );        
    END LOOP;
END;
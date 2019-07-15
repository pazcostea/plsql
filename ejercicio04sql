DECLARE    
    num1 NUMBER(5) := &num1;
    esprimo BOOLEAN := TRUE;
    i NUMBER(3) := 2;
BEGIN    
    IF num1 > 1 THEN
        WHILE esprimo = TRUE AND i < num1 LOOP 
            IF num1 MOD i = 0 THEN
                esprimo := FALSE;               
            END IF;
            i := i + 1;
        END LOOP;
    ELSE
        DBMS_OUTPUT.PUT_LINE('¡Le he pedido un número entero mayor que 1!');
    END IF;
    IF esprimo = TRUE THEN
        DBMS_OUTPUT.PUT_LINE(num1 || ' es primo');
    ELSE
        DBMS_OUTPUT.PUT_LINE(num1 || ' no es primo');
    END IF;
END;
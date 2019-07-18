DECLARE
    num1 NUMBER(5) := &num1;
BEGIN    
    IF num1 > 0 THEN
        FOR contador IN 1..num1 LOOP
            IF num1 MOD contador = 0 THEN
                DBMS_OUTPUT.PUT_LINE(contador);
            END IF;        
        END LOOP;
    ELSE
        DBMS_OUTPUT.PUT_LINE('¡Le he pedido un número entero mayor o igual que ' || num1 || '!');
    END IF;
END;
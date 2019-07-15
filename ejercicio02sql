DECLARE
    num1 NUMBER(5) := &num1;
    num2 NUMBER(5) := &num2;    
    i NUMBER(2) := 0;    
BEGIN    
    IF num1 < num2 THEN
        i := num1;
        LOOP
            IF i MOD 2 = 0 THEN
                DBMS_OUTPUT.PUT_LINE('El numero ' || i || ' es par');
            ELSE
                DBMS_OUTPUT.PUT_LINE('El numero ' || i || ' es impar');
            END IF;
            EXIT WHEN i >= num2;
            i := i + 1;        
        END LOOP;
    ELSE
        DBMS_OUTPUT.PUT_LINE('¡Le he pedido un número entero mayor o igual que ' || num1 || '!');
    END IF;
END;
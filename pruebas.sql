DECLARE
    texto VARCHAR2(10) := 'Hola mundo';
    --saludo VARCHAR2(10) := '&saludo';
    saludo VARCHAR2(10) := 'saludo';
    mi_numero NUMBER(6, 2) := 1234.56;
    mi_numero2 CONSTANT NUMBER(6, 2) := 10;
    --Con el & podemos hacer que el valor lo introduzca el usuario por pantalla
    --multiplicador NUMBER(6, 2) := &NUMERO;
    multiplicador NUMBER(6, 2) := 100;
    verdadero BOOLEAN := TRUE;
    fecha_actual DATE := SYSDATE;
    i NUMBER(2) := 0;
    
BEGIN    
    -- textos
    DBMS_OUTPUT.PUT_LINE(texto);
    DBMS_OUTPUT.PUT_LINE(texto || ' cruel');
    DBMS_OUTPUT.PUT_LINE('Saludo ' || saludo);
    
    -- numeros
    DBMS_OUTPUT.PUT_LINE(mi_numero * multiplicador);
    
    -- Booleanos
    -- DBMS_OUTPUT.PUT_LINE(verdadero);
    
    -- Fecha
    DBMS_OUTPUT.PUT_LINE(fecha_actual);
    
    --Bloques condiciones
    IF &number > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Es mayor');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Es menor');
    END IF;
    
    --Bucles LOOP
    WHILE (i < 10) LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 1;
    END LOOP;
END;
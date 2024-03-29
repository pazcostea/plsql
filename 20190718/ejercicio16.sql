--Decir cuantos productos ha comprado en total un cliente
SELECT DEMO_ORDERS.CUSTOMER_ID, 
       DEMO_CUSTOMERS.CUST_FIRST_NAME AS CLIENTE, 
       SUM(DEMO_ORDER_ITEMS.QUANTITY) AS CANTIDAD
FROM DEMO_ORDER_ITEMS
INNER JOIN DEMO_ORDERS
ON DEMO_ORDER_ITEMS.ORDER_ID = DEMO_ORDERS.ORDER_ID
INNER JOIN DEMO_CUSTOMERS
ON DEMO_ORDERS.CUSTOMER_ID = DEMO_CUSTOMERS.CUSTOMER_ID
GROUP BY DEMO_ORDERS.CUSTOMER_ID, DEMO_CUSTOMERS.CUST_FIRST_NAME;

--A parte del total de productos, cu�nto se ha gastado

SELECT DEMO_ORDERS.CUSTOMER_ID, 
       DEMO_CUSTOMERS.CUST_FIRST_NAME AS CLIENTE, 
       SUM(DEMO_ORDER_ITEMS.QUANTITY) AS CANTIDAD,
       SUM (DEMO_ORDER_ITEMS.QUANTITY * DEMO_ORDER_ITEMS.UNIT_PRICE) AS GASTO
FROM DEMO_ORDER_ITEMS
INNER JOIN DEMO_ORDERS
ON DEMO_ORDER_ITEMS.ORDER_ID = DEMO_ORDERS.ORDER_ID
INNER JOIN DEMO_CUSTOMERS
ON DEMO_ORDERS.CUSTOMER_ID = DEMO_CUSTOMERS.CUSTOMER_ID
GROUP BY DEMO_ORDERS.CUSTOMER_ID, DEMO_CUSTOMERS.CUST_FIRST_NAME;
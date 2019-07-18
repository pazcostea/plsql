--Enlazar demo_orders con demo_customer: order_id, total y nombre del cliente
SELECT ORDER_ID, ORDER_TOTAL AS "TOTAL PEDIDO", CUST_FIRST_NAME AS NOMBRE
FROM DEMO_ORDERS
LEFT JOIN DEMO_CUSTOMERS
ON DEMO_ORDERS.CUSTOMER_ID = DEMO_CUSTOMERS.CUSTOMER_ID;
--Con inner join si hubiera algun pedido sin cliente no aparecería, nisiquiera como null.
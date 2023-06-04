CREATE PROCEDURE GetMaxQuantity() SELECT MAX(OrderQuantity) AS "Max Quantity in Order" FROM orders;
CALL GetMaxQuantity;

PREPARE GetOrderDetail FROM 'SELECT OrderID, OrderQuantity AS Quantity, TotalCost AS Cost FROM orders WHERE OrderID = ?';
SET @order_id = 1;
EXECUTE GetOrderDetail USING @order_id;

CREATE PROCEDURE CancellOrder(order_id INT) DELETE FROM orders WHERE OrderID = order_id; 
call CancellOrder(5);
SELECT * FROM orders;
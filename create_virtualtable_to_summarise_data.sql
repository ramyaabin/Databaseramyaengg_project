CREATE VIEW OrdersView AS SELECT OrderID, OrderQuantity AS Quantity, TotalCost AS Cost FROM orders WHERE OrderQuantity > 2;
SELECT * FROM OrdersView;
INSERT INTO menuitems (MenuItemID, Cuisine, ItemName, ItemType, ItemDescription) VALUES (1, 'Greek', 'Greek Salad', 'salads', 'tasty Greek salad'), (2, 'Italy', 'Salami', 'salami', 'tasty Italian salami');
INSERT INTO menuorders (MenuOrderID, OrderID, MenuItemID) VALUES (1, 1, 1), (2, 2, 2);
SELECT customers.CustomerID, customers.CustomerName, orders.OrderID, orders.TotalCost AS Cost, menuitems.ItemName AS MenuName FROM customers INNER JOIN bookings ON customers.CustomerID = bookings.CustomerID INNER JOIN orders ON bookings.OrderID = orders.OrderID
INNER JOIN menuorders ON orders.OrderID = menuorders.OrderID INNER JOIN menuitems ON menuorders.MenuItemID = menuitems.MenuItemID WHERE orders.TotalCost > 250;

SELECT * FROM menuorders;

SELECT ItemName AS MenuName FROM menuitems LEFT JOIN menuorders ON menuitems.MenuItemID = menuorders.MenuItemID WHERE 2 = (SELECT COUNT(OrderID) FROM menuorders);
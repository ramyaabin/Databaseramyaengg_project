INSERT INTO customers (CustomerID, CustomerName, Email, PhoneNumber) VALUES (1, 'John Dough', 'email@email', '223322');
INSERT INTO customers (CustomerID, CustomerName, Email, PhoneNumber) VALUES
(2, 'Jane Dough', 'email1@email', '322223'),
(3, 'Ct. Jack Sparrow', 'email2@email', '333555');
INSERT INTO orders (OrderID, OrderDate, OrderQuantity, TotalCost) VALUES
(1, '2022-10-10', 5, 500),
(2, '2022-10-11', 4, 495),
(3, '2022-10-12', 10, 1000),
(4, '2022-10-13', 11, 1200),
(5, '2022-10-14', 8, 800);
SELECT * FROM orders;
INSERT INTO staff (StaffID, StaffName, StaffRole, Salary) VALUES
(1, 'Kate Smith', 'administrator', 120000);
INSERT INTO bookings (BookingID, BookingDate, TableNumber, StaffID, CustomerID, OrderID) VALUES
(1, '2022-10-10', 1, 1, 1, 1),
(2, '2022-11-12', 1, 1, 3, 2),
(3, '2022-10-11', 1, 1, 2, 3),
(4, '2022-10-13', 1, 1, 1, 4);
SELECT * FROM bookings;

CREATE PROCEDURE CheckBooking(date_input DATETIME, table_input INT) SELECT BookingDate, TableNumber FROM bookings WHERE TableNumber = table_input;
CALL CheckBooking('2022-10-10', 1);


CREATE PROCEDURE AddValidBooking (IN BookingDate DATETIME, IN TableNumber INT)
START TRANSACTION;
SELECT BookingDate, TableNumber
WHERE exists (SELECT * from bookings where BookingDate = BookingDate and TableNumber = TableNumber);
	INSERT INTO booking (BookingID, BookingDate, TableNumber, StaffID, CustomerID, OrderID) VALUES (1, BookingDate, TableNumber, 1, 1, 1);
	COMMIT;
    
    CALL AddValidBooking('2022-10-11', 2);
    SELECT * FROM bookings;
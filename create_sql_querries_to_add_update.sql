CREATE PROCEDURE AddBooking (IN BookingID INT, IN BookingDate DATETIME, IN TableNumber INT, IN StaffID INT, IN CustomerID INT, IN OrderID INT)
INSERT INTO booking (BookingID, BookingDate, TableNumber, StaffID, CustomerID, OrderID) VALUES (BookingID, BookingDate, TableNumber, StaffID, CustomerID, OrderID); 

CREATE PROCEDURE UpdateBooking (IN BookingID INT, IN BookingDate DATE)
UPDATE booking SET BookingDate = BookingDate WHERE BookingID = BookingID; 

CREATE PROCEDURE CancelBooking(IN BookingID INT)
DELETE FROM booking WHERE BookingID = BookingID;

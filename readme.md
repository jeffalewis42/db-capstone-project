setting up repository for project

**Module 1**

Task 1: [Little Lemon ER Diagram](LittleLemonDM.png)

Task 2: [Little Lemon DB Exported](LittleLemonDB.sql)

Task 3: [List of Databases in Connection with LittleLemonDb](showdatabaselist.json)

**Module 2**

*Create a Virtual Table*

Task 1:[Create virtual table OrdersView](OrdersView.json)

Task 2:[Using JOIN](UsingJOIN.json)

Task 3:[Using a subQuery](SubQuery.json)

*Create optimized queries*

Task 1: [Results from stored procedure GetMaxQuantity](GetMaxQuantity.json)

```
CREATE PROCEDURE GetMaxQuantity() 
SELECT Max(Quantity) AS "Max Quantity in Order" FROM Orders;

```


Task 2: [Results from Prepared Statement GetOrderDetail](GetOrderDetail.json)

```
PREPARE GetOrderDetail FROM '
SELECT OrderID, 
Quantity, 
TotalCost AS Cost
 FROM Orders 
WHERE OrderID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

```

Task 3: [Results from stored procedure CancelOrder](CancelOrder.json)

```
DELIMITER //

CREATE PROCEDURE CancelOrder(IN ParOrderID INT)
BEGIN
    DELETE FROM Orders WHERE OrderID=ParOrderID;
	SET @Msg = CONCAT ('Order ', ParOrderID, ' is cancelled');
	SELECT @Msg AS Confirmation;
END //

DELIMITER ;

CALL CancelOrder(5);

```

*Create SQL queries to check available bookings*

Task 1: [Populate Bookings Table with data](BookingsTableInitialData.csv)

```
INSERT INTO Bookings (BookingID, BookingDate, TableNum, CustomerID, StaffID)
VALUES 
(1, '2022-10-10', 5, 1, 3),
(2, '2022-11-12', 3, 3, 4),
(3, '2022-10-11', 2, 2, 5),
(4, '2022-10-13', 2, 1, 2);
```

Task 2: [Results for CheckBooking Procedure](CheckBookingResults.csv)

```
CREATE PROCEDURE CheckBooking(IN InDate DATE, IN InTableNum INT)
BEGIN
    DECLARE msg VARCHAR(255);
    
    IF ((
        SELECT TableNum
        FROM Bookings
        WHERE (BookingDate=InDate AND TableNum=InTableNum)) IS NULL)

        THEN
            SET @msg=CONCAT('Table ', InTableNum, ' is available');
        ELSE
            SET @msg=CONCAT('Table ', InTableNum, ' is already booked');
        END IF;

    SELECT @msg AS 'Booking Status';
END //

```

Task 3: [Result for AddValidBooking already booked](AddValidBookingResults.csv)

		[Result for AddValidBooking not already booked](AddValidBookingResults2.csv)

		```
		CREATE PROCEDURE AddValidBooking(IN InDate DATE, IN InTableNum INT)
BEGIN
    DECLARE msg VARCHAR(255);
    DECLARE state INT;
    SET state = 0;
    IF ((
        SELECT TableNum
        FROM Bookings
        WHERE (BookingDate=InDate AND TableNum=InTableNum)) IS NULL)

        THEN
            SET state = 0;
        ELSE
            SET state = 1;
        END IF;
    START TRANSACTION;

    INSERT INTO Bookings (BookingDate, TableNum, CustomerID, StaffID) VALUES (InDate, InTableNum, 3, 4);

    IF (state = 0)
        THEN
            SET @msg=CONCAT('Table ', InTableNum, ' is now booked on ', InDate);
            COMMIT;
        ELSE
            SET @msg=CONCAT('Table ', InTableNum, ' is already booked');
            ROLLBACK;
        END IF;

    SELECT @msg AS 'Booking Status';
END //
		
		```

*Create SQL queries to add and update bookings*

Task 1: [Result for AddBooking Procedure](AddBookingResult.csv)


```
CREATE PROCEDURE AddBooking(IN InBookingID INT, IN InCustomerID INT, IN InBookingDate DATE, IN InTableNum INT, IN InStaffID INT)
BEGIN
    START TRANSACTION;
        INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNum, StaffID)
        VALUES (InBookingID, InCustomerID, InBookingDate, InTableNum, InStaffID);
    COMMIT;
    SELECT 'New Booking Added' AS Confirmation;
END //
```

Task 2: [Result for UpdateBooking Procedure](UpdateBookingResults.csv)

```
CREATE PROCEDURE UpdateBooking (IN InBookingID INT, IN InBookingDate DATE )
BEGIN
    DECLARE msg VARCHAR(255);
    DECLARE state INT;
    SET state = 0;
    IF ((
        SELECT TableNum
        FROM Bookings
        WHERE BookingID=InBookingID) IS NULL)

        THEN
            SET state = 0;
        ELSE
            SET state = 1;
        END IF;
    START TRANSACTION;
    IF (state = 1)
        THEN
            UPDATE Bookings
            SET BookingDate=InBookingDate
            WHERE BookingID=InBookingID;
            SET @msg=CONCAT('Booking ', InBookingID, ' updated');
            COMMIT;
        ELSE
            SET @msg=CONCAT('Booking ', InBookingID, ' not found');
            ROLLBACK;
    END IF;
    SELECT @msg AS Confirmation;
END //

```

Task 3: [Result for CancelBooking Procedure](CancelBookingResults.csv)


```
CREATE PROCEDURE CancelBooking (IN InBookingID INT )
BEGIN
    DECLARE msg VARCHAR(255);
    DECLARE state INT;
    SET state = 0;
    IF ((
        SELECT TableNum
        FROM Bookings
        WHERE BookingID=InBookingID) IS NULL)

        THEN
            SET state = 0;
        ELSE
            SET state = 1;
        END IF;
    START TRANSACTION;
    IF (state = 1)
        THEN
            DELETE FROM Bookings
            WHERE BookingID=InBookingID;
            SET @msg=CONCAT('Booking ', InBookingID, ' cancelled');
            COMMIT;
        ELSE
            SET @msg=CONCAT('Booking ', InBookingID, ' not found');
            ROLLBACK;
    END IF;
    SELECT @msg AS Confirmation;
END //
```

**Module 3***

*Set up the Tableau Workspace for data analysis*

Task 1: [Screenshot of data loaded into tableau](<Task 1 Data loaded into tableau.png>)

Task 2: [Screenshot of Customer Full Name split](<Task 2 Customer Name Split.png>)

Task 3: [Screenshot of Calculated Field Profit](<Task 3 Calculated Field.png>)
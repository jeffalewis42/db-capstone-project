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

CREATE PROCEDURE AddBooking(IN InBookingID INT, IN InCustomerID INT, IN InBookingDate DATE, IN InTableNum INT, IN InStaffID INT)
BEGIN
    START TRANSACTION;
        INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNum, StaffID)
        VALUES (InBookingID, InCustomerID, InBookingDate, InTableNum, InStaffID);
    COMMIT;
    SELECT 'New Booking Added' AS Confirmation;
END //

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


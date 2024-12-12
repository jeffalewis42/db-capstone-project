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

SELECT TOP 2 * FROM [Production].[TransactionHistory]
select top 2 * from [Sales].[SalesTerritoryHistory]
SELECT TOP 2 * FROM [Sales].[SalesOrderDetail]
go
CREATE  PROCEDURE Sp_SalesOrderReport
 @SalesorderID int

AS 
BEGIN
 SET NOCOUNT ON;
 SELECT S.SalesOrderID, CAST(T.TransactionDate AS DATE) AS TransactionDate, COUNT(T.Quantity) AS ItemPurchased
 FROM [Production].[TransactionHistory] T
 JOIN [Sales].[SalesOrderDetail] S
 ON T.ProductID = S.ProductID
 WHERE S.SalesOrderID = @SalesorderID
 GROUP BY S.SalesOrderID,CAST(T.TransactionDate AS DATE)

 END

 EXECUTE Sp_SalesOrderReport @SalesorderID = '43659'




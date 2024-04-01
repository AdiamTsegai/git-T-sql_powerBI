
select top 5 * from [Purchasing].[PurchaseOrderDetail]
GO
WITH CTE_Sales AS (
SELECT 
        ProductID, COUNT(OrderQty) AS TotalQTYSold,
       -- SUM(OrderQty) AS TotalQty,
        SUM(UnitPrice * OrderQty) AS TotalAmount
    
    FROM 
        [Purchasing].[PurchaseOrderDetail]
    GROUP BY 
        ProductID
	)
SELECT 
    ProductID,
    TotalQTYSold,
    TotalAmount,
    CASE 
        WHEN TotalQTYSold > 100 THEN 'Best Selling'
        WHEN TotalQTYSold > 50 THEN 'Average Selling'
        ELSE 'Low Selling'
    END AS ValueCategory
FROM 
    CTE_Sales;







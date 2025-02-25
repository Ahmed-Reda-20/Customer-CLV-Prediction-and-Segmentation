#USING MULTIPLE CTE'S TO CREATE A
WITH stage1 AS (
    SELECT
        CustomerID,
        SUM(Quantity * UnitPrice) AS TotalSales,
        COUNT(DISTINCT InvoiceNo) AS Frequency,
		CASE 
			WHEN  DATEDIFF(MAX(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')),
                  MIN(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'))) = 0
			THEN 1 
            ELSE  DATEDIFF(MAX(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')),
                  MIN(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')))
		END AS LifeSpan,
	
        MAX(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS LastPurchase
        
    FROM data_clean
    GROUP BY CustomerID
),
stage2 AS(
	SELECT
		CustomerID,
        TotalSales,
        Frequency,
		(TotalSales / NULLIF(Frequency, 0)) AS AverageOrderValue,
        LifeSpan,
        LastPurchase
	FROM stage1
),
LASTSTAGE AS (
	SELECT
    CustomerID,
	TotalSales,
	Frequency,
    AverageOrderValue,
    LifeSpan,
    Frequency*AverageOrderValue*LifeSpan AS CLV
    FROM stage2
)
SELECT * FROM LASTSTAGE;
#CREATING THE METRICS AND CLV TABLE
CREATE TABLE METRICS AS
WITH stage1 AS (
    SELECT
        CustomerID,
        SUM(Quantity * UnitPrice) AS TotalSales,
        COUNT(DISTINCT InvoiceNo) AS Frequency,
		CASE 
			WHEN  DATEDIFF(MAX(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')),
                  MIN(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'))) = 0
			THEN 1 
            ELSE  DATEDIFF(MAX(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')),
                  MIN(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')))
		END AS LifeSpan,
	
        MAX(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS LastPurchase
        
    FROM data_clean
    GROUP BY CustomerID
),
stage2 AS(
	SELECT
		CustomerID,
        TotalSales,
        Frequency,
		(TotalSales / NULLIF(Frequency, 0)) AS AverageOrderValue,
        LifeSpan,
        LastPurchase
	FROM stage1
),
LASTSTAGE AS (
	SELECT
    CustomerID,
	TotalSales,
	Frequency,
    AverageOrderValue,
    LifeSpan,
    Frequency*AverageOrderValue*LifeSpan AS CLV
    FROM stage2
)
SELECT * FROM LASTSTAGE;






#READING DUPLICATES
WITH DUPLICATE_READ AS
(
	SELECT *,row_number() OVER(partition by 
	InvoiceNo,StockCode,`Description`,Quantity,InvoiceDate,UnitPrice,CustomerID,Country) AS ROWNUM
	FROM ecommerce
)
SELECT * FROM DUPLICATE_READ
WHERE ROWNUM > 1;
#MAKING A NEW TABLE FROM OUR CTE
CREATE TABLE data_clean AS
WITH DUPLICATE_READ AS
(
	SELECT *,row_number() OVER(partition by 
	InvoiceNo,StockCode,`Description`,Quantity,InvoiceDate,UnitPrice,CustomerID,Country) AS ROWNUM
	FROM ecommerce
)SELECT * FROM DUPLICATE_READ;
#DELETING DUPLICATED FROM OUR NEW TABLE
DELETE FROM data_clean WHERE ROWNUM > 1;
#DELETING ROWNUM
ALTER TABLE data_clean DROP COLUMN ROWNUM;
#READING OUR NEW TABLE
select * from data_clean;

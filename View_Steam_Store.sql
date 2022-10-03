USE steam_store
GO
--menampilkan tranksaksi dengan average diatas rata2 dari tertinggi sampai terendah
CREATE VIEW transaction_above_average AS
SELECT
 [Account Name] = account_name,
 [Product Name] = product_name,
 [Product Type] = product_type_name,
 [Payment Type] = payment_method,
 [Payment Detail] = payment_detail,
 [Total Transaction] = 'Rp ' + CAST((SUM((quantity*product_price) - (quantity*product_price*discount_price) + (product_price*vat_detail))) AS VARCHAR(100)) + ',00'
FROM  transaction_header th 
JOIN transaction_detail td ON th.transaction_ID = td.transaction_ID
JOIN product p ON p.product_ID = td.product_ID
JOIN account a ON th.account_ID =a.account_ID
JOIN product_type pt ON p.product_type_ID = pt.product_type_ID
JOIN vat v ON v.vat_ID = th.vat_ID
JOIN payment py ON py.payment_ID = th.payment_ID
JOIN discount d ON d.discount_ID = p.discount_ID
WHERE product_type_name LIKE 'Video Game'
GROUP BY account_name,product_name, product_type_name,payment_method,payment_detail
HAVING SUM((quantity*product_price) - (quantity*product_price*discount_price) + (product_price*vat_detail)) > (
		SELECT AVG((quantity*product_price) + (product_price*vat_detail)) AS average 
		FROM transaction_header th
		JOIN transaction_detail td ON th.transaction_ID = td.transaction_ID
		JOIN product p ON p.product_ID = td.product_ID 
		JOIN vat v ON v.vat_ID = th.vat_ID
	)
ORDER BY [Total Transaction] DESC OFFSET 0 ROWS
GO

SELECT * FROM transaction_above_average

GO
-- menampilkan transaksi pembelian di negara Indonesia pada saat discount winter
CREATE VIEW Transaction_On_Winter_From_Indonesia
AS
SELECT [Account name] = account_name, [Product] = product_name,
[Event] = discount_detail ,[Discount] = CAST((discount_price * 100) AS VARCHAR(100)) + '%'
FROM transaction_header th
JOIN account ac ON th.account_ID = ac. account_ID
JOIN transaction_detail td ON th.transaction_ID = td.transaction_ID
JOIN product pd ON pd.product_ID = td.product_ID
JOIN discount dt ON pd.discount_ID = dt.discount_ID
WHERE discount_detail = 'Winter Sale'
AND LOWER(account_country) = 'indonesia'
GO

SELECT *
FROM Transaction_On_Winter_From_Indonesia
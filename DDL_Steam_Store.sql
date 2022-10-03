CREATE DATABASE steam_store
GO
USE steam_store
GO

CREATE TABLE [account]  (
	account_ID CHAR (10) PRIMARY KEY 
		CHECK(account_ID LIKE 'ACC[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	account_name VARCHAR(100) 
		CHECK(LEN(account_name)>= 3) NOT NULL,
	account_IP CHAR(15)
		CHECK(account_IP LIKE '%.%.%.%') NOT NULL,
	account_city VARCHAR(100) NOT NULL,
	account_country VARCHAR(60) NOT NULL
);

CREATE TABLE [developer] (
	developer_ID CHAR (10) PRIMARY KEY
		CHECK(developer_ID LIKE'DEV[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	developer_name VARCHAR (100)
		CHECK(LEN(developer_name) >= 3)NOT NULL,
	developer_IP CHAR (15)
		CHECK(developer_IP LIKE '%.%.%.%') NOT NULL,
	developer_country VARCHAR(60) NOT NULL
)

CREATE TABLE [payment]  (
	payment_ID CHAR (10) PRIMARY KEY
		CHECK(payment_ID LIKE 'PAY[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	payment_method VARCHAR(50) NOT NULL,
	payment_detail VARCHAR(50) NOT NULL
);

CREATE TABLE [vat]  (
	vat_ID CHAR (15) PRIMARY KEY
		CHECK(vat_ID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	vat_detail FLOAT NOT NULL
);

CREATE TABLE [discount] (
	discount_ID CHAR (15) PRIMARY KEY
		CHECK(discount_ID LIKE 'DSC[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	discount_detail VARCHAR (100),
	discount_price FLOAT
);

CREATE TABLE [transaction_header]  (
	transaction_ID CHAR (20) PRIMARY KEY
		CHECK(transaction_ID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	account_ID CHAR(10) FOREIGN KEY REFERENCES account(account_ID) 
		ON UPDATE CASCADE ON DELETE CASCADE 
		CHECK(account_ID LIKE 'ACC[0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
	transaction_date DATE NOT NULL,
	payment_ID CHAR(10) FOREIGN KEY REFERENCES payment(payment_ID) 
		ON UPDATE CASCADE ON DELETE CASCADE
		CHECK(payment_ID LIKE 'PAY[0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
	vat_ID CHAR(15) FOREIGN KEY REFERENCES vat(vat_ID)
		ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
		CHECK(vat_ID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE [product_type] (
	product_type_ID CHAR (10) PRIMARY KEY
		CHECK(product_type_ID LIKE 'PDT[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	product_type_name VARCHAR(255) NOT NULL
);

CREATE TABLE [product] (
	product_ID CHAR (10) PRIMARY KEY
		CHECK(product_ID LIKE 'PD[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	developer_ID CHAR (10) FOREIGN KEY REFERENCES developer(developer_ID)
		ON UPDATE CASCADE ON DELETE CASCADE
		CHECK(developer_ID LIKE'DEV[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	discount_ID CHAR (15) FOREIGN KEY REFERENCES discount(discount_ID)
		ON UPDATE CASCADE ON DELETE CASCADE
		CHECK(discount_ID LIKE 'DSC[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	product_name VARCHAR(255) NOT NULL,
	product_type_ID CHAR (10) FOREIGN KEY REFERENCES product_type(product_type_ID) 
		ON UPDATE CASCADE ON DELETE CASCADE
		CHECK(product_type_ID LIKE 'PDT[0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
	product_price INT NOT NULL
);

CREATE TABLE [transaction_detail] (
	transaction_ID CHAR(20) FOREIGN KEY REFERENCES transaction_header(transaction_ID)
		ON UPDATE CASCADE ON DELETE CASCADE 
		CHECK(transaction_ID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	product_ID CHAR (10) FOREIGN KEY REFERENCES product(product_ID)  
		ON UPDATE CASCADE ON DELETE CASCADE 
		CHECK(product_ID LIKE 'PD[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
	quantity INT NOT NULL,
	PRIMARY KEY(transaction_ID, product_ID) 
);
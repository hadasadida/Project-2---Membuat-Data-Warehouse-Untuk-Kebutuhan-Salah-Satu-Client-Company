---- creat database ----
create database DWH_Project

---- creat dimension and fact table ----
create table DimCustomer (
	CustomerID int not null,
	CustomerName varchar(50) not null,
	Age int not null,
	Gender varchar(50) not null,
	City varchar(50) not null,
	NoHp varchar(50) not null,
	constraint PK_DimCustomer primary key (CustomerID) 
	);

create table DimProduct (
	ProductID int not null,
	ProductName varchar(255) not null,
	ProductCategory varchar(255) not null,
	ProductUnitPrice int null,
	constraint PK_DimProduct primary key (ProductID) 
    );

create table DimStatusOrder (
	StatusID int not null,
	StatusOrder varchar(50) not null,
	StatusOrderDesc varchar(50) not null,
	constraint PK_DimStatusOrder primary key (StatusID) 
    );

create table FactSalesOrder (
	OrderID int not null,
	CustomerID int not null,
	ProductID int not null,
	Quantity int not null,
	Amount int not null,
	StatusID int not null,
	OrderDate date not null,
	primary key (OrderID),
	foreign key (CustomerID) references DimCustomer (CustomerID),
	foreign key (ProductID) references DimProduct (ProductID),
	foreign key (StatusID) references DimStatusOrder (StatusID)
	);

select * from DimCustomer
select * from DimProduct
select * from DimStatusOrder
select * from FactSalesOrder

---- creat store procedure ----
CREATE PROCEDURE summary_order_status
(@StatusID int) AS
BEGIN
	SELECT
		f.OrderID,
		c.CustomerName,
		p.ProductName,
		f.Quantity,
		s.StatusOrder
	FROM FactSalesOrder AS f
	JOIN DimCustomer c ON f.CustomerID = c.CustomerID
	JOIN DimProduct p ON f.ProductID = p.ProductID
	JOIN DimStatusOrder s ON f.StatusID = s.StatusID
	WHERE s.StatusID = @StatusID
END

EXEC summary_order_status @StatusID = 1


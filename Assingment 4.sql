use Manufacturer;

CREATE TABLE Product(
	prod_id INT IDENTITY (1, 1) PRIMARY KEY,
	prod_name VARCHAR (50),
	quantity INT
	);

CREATE TABLE Supplier(
	supp_id INT IDENTITY (1, 1) PRIMARY KEY,
	supp_name VARCHAR (50),
	supp_location VARCHAR (50),
	supp_country VARCHAR (50),
	is_active BIT
	);

CREATE TABLE Component(
	comp_id INT IDENTITY (1, 1) PRIMARY KEY,
	comp_name VARCHAR (50),
	[description] VARCHAR (50),
	quantity INT
	);

CREATE TABLE Prod_Comp (
	prod_id INT NOT NULL,  
	comp_id INT NOT NULL,
	quantity_comp INT,
	FOREIGN KEY (prod_id) REFERENCES Product (prod_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (comp_id) REFERENCES Component (comp_id) ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE Comp_Supp (
	supp_id INT NOT NULL,
	comp_id INT NOT NULL,
	order_date DATE,
	quantity INT
	FOREIGN KEY (supp_id) REFERENCES Supplier (supp_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (comp_id) REFERENCES Component (comp_id) ON DELETE CASCADE ON UPDATE CASCADE
	);
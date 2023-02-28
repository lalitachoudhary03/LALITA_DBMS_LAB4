CREATE TABLE SUPPLIER_PRICING(
PRICING_ID INT auto_increment,
PRO_ID INT,
SUPP_ID INT,
SUPP_PRICE INT DEFAULT 0,
primary key(PRICING_ID),
foreign key(PRO_ID)references PRODUCT(PRO_ID),
foreign key(SUPP_ID)references supplier(SUPP_ID)
);
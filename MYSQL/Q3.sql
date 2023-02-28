# Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
# Identify the tables [order, customer]
SELECT * FROM `order`;
SELECT * FROM customer;

SELECT * FROM `order`
INNER JOIN customer
ON `order`.CUS_ID = customer.CUS_ID HAVING  `order`.ORD_AMOUNT>=3000;
# ================================================================================
# JOIN BOTH THE TABLES
	(SELECT  `order`.*, customer.CUS_NAME,customer.CUS_GENDER   from `order` 
	INNER JOIN  customer WHERE  `order`.CUS_ID =customer.CUS_ID HAVING  `order`.ORD_AMOUNT>=3000)
# ================================================================================
# DISPLAY RELEVANT COLUMN ONLY i.e CUS_ID, CUS_GENDER, ORD_AMOUNT, CUS_NAME
SELECT t1.CUS_ID,t1.CUS_NAME,t1.CUS_GENDER,t1.ORD_AMOUNT FROM
(
	SELECT  `order`.*, customer.CUS_NAME,customer.CUS_GENDER   from `order` 
	INNER JOIN  customer WHERE  `order`.CUS_ID =customer.CUS_ID HAVING  `order`.ORD_AMOUNT>=3000
) AS t1 GROUP BY t1.CUS_ID;

# ================================================================================
# # Display the total number of customers based on gender
 SELECT * FROM 
 (
 	SELECT t1.CUS_ID,t1.CUS_NAME,t1.CUS_GENDER,t1.ORD_AMOUNT FROM
	(
		SELECT  `order`.*, customer.CUS_NAME,customer.CUS_GENDER   from `order` 
		INNER JOIN  customer WHERE  `order`.CUS_ID =customer.CUS_ID HAVING  `order`.ORD_AMOUNT>=3000
	) AS t1 GROUP BY t1.CUS_ID
 ) AS t2 GROUP BY t2.cus_gender;

# ================================================================================
 SELECT COUNT(t2.CUS_GENDER) as No_Of_Customers, t2.CUS_GENDER FROM 
 (
 	SELECT t1.CUS_ID,t1.CUS_NAME,t1.CUS_GENDER,t1.ORD_AMOUNT FROM
	(
		SELECT  `order`.*, customer.CUS_NAME,customer.CUS_GENDER   from `order` 
		INNER JOIN  customer WHERE  `order`.CUS_ID =customer.CUS_ID HAVING  `order`.ORD_AMOUNT>=3000
	) AS t1 GROUP BY t1.CUS_ID
 ) AS t2 GROUP BY t2.CUS_GENDER;
# ================================================================================

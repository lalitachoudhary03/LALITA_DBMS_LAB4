 
# Q6) Find the least expensive product from each category and print the table with category id, name, and price of the product
# select table supplier_pricing for display price of each product.
SELECT * FROM supplier_pricing;
# ========================================================================================================
# select relevant column and min price
SELECT PRO_ID,MIN(SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID;
# ========================================================================================================
 SELECT * FROM product
 INNER JOIN
	 (SELECT PRO_ID,MIN(SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID) 
 AS t2
 WHERE t2.PRO_ID = product.PRO_ID;
 # ========================================================================================================
 SELECT product.CAT_ID,product.PRO_NAME, t2.* FROM product
 INNER JOIN
	 (SELECT PRO_ID,MIN(SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID) 
 AS t2
 WHERE t2.PRO_ID = product.PRO_ID;
 # ========================================================================================================
SELECT * FROM category
INNER JOIN
	(
		 SELECT product.CAT_ID,product.PRO_NAME, t2.* FROM product
		 INNER JOIN(SELECT PRO_ID,MIN(SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID) 
 			AS t2  WHERE t2.PRO_ID = product.PRO_ID
	) AS t3	WHERE t3.CAT_ID = category.CAT_ID;
# ========================================================================================================
SELECT category.CAT_ID,category.CAT_NAME, t3.PRO_NAME, MIN(t3.MIN_PRICE) AS Min_Price FROM category
INNER JOIN
	(
		 SELECT product.CAT_ID,product.PRO_NAME, t2.* FROM product
		 INNER JOIN(SELECT PRO_ID,MIN(SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID) 
 			AS t2  WHERE t2.PRO_ID = product.PRO_ID
	) AS t3	WHERE t3.CAT_ID = category.CAT_ID 
 
group by t3.CAT_ID; 
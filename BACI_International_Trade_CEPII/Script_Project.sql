# COMPUTE TOTAL TRADE VALUE
SELECT 
	ROUND(SUM(value_),3) as total_trade_value
FROM baci_hs17_23;

# TOTAL AMOUNT OF EXPORTER
SELECT 
	COUNT(DISTINCT exporter) as total_of_exporter
FROM baci_hs17_23;

# TOTAL AMOUNT OF IMPORTER
SELECT 
	COUNT(DISTINCT importer) as total_of_importer
FROM baci_hs17_23;

# TOTAL AMOUNT TRADE VALUE BY EXPORTER
SELECT
	country_codes.country_name_full,
    ROUND(SUM(baci_hs17_23.value_),3) as total_trade_value
FROM baci_hs17_23
JOIN country_codes
	ON baci_hs17_23.exporter = country_codes.country_code
GROUP BY 1
ORDER BY 1;

# TOTAL AMOUNT TRADE VALUE BY IMPORTER
SELECT
	country_codes.country_name_full,
    ROUND(SUM(baci_hs17_23.value_),3) as total_trade_value
FROM baci_hs17_23
JOIN country_codes
	ON baci_hs17_23.importer = country_codes.country_code
GROUP BY 1
ORDER BY 1;

SELECT
	country_codes.country_name_full as exporter,
    CEIL(SUM(baci_hs17_23.value_)) as total_trade_value_exported,
    country_codes.country_name_full as importer,
    CEIL(SUM(baci_hs17_23.value_)) as total_trade_value_imported
FROM baci_hs17_23
JOIN country_codes
	ON baci_hs17_23.importer = country_codes.country_code
JOIN 
GROUP BY 1
ORDER BY 1




# USE JOIN TO DISPLAY EXPORTER AND IMPORTER COUNTRY NAME + AMOUNT TRADE FLOW BY PRODUCT
SELECT
	country_codes.country_name_full as exporter,
	baci_hs17_23.product_category,
    product_codes.description,
    baci_hs17_23.value_,
    imported_country.country_name_full as importer
FROM baci_hs17_23
JOIN product_codes
	ON baci_hs17_23.product_category = product_codes.code
JOIN country_codes
	ON baci_hs17_23.exporter = country_codes.country_code
JOIN country_codes as imported_country
	ON baci_hs17_23.importer = imported_country.country_code;
    

	

/*
SELECT
    baci_hs17_23.product_category,
    product_codes.description,
    country_codes.country_name_full,
    CEIL(SUM(baci_hs17_23.value_)) summary
FROM baci_hs17_23
JOIN product_codes
	ON baci_hs17_23.product_category = product_codes.code
JOIN country_codes
	ON baci_hs17_23.exporter = country_codes.country_code
GROUP BY 1,2,3
HAVING product_codes.description LIKE "%Spices%"
ORDER BY summary DESC, country_name_full ASC;
*/

/* DONE
# TOTAL AMOUNT (IN DOLLARS) OF VALUE TRADE FLOW
SELECT 
	CEIL(SUM(value_)) Total_Amount
FROM baci_hs17_23;
*/

# DONE
# TOTAL AMOUNT OF EXPORTER (SAME AS IMPORTER)
SELECT 
	COUNT(DISTINCT exporter) as Total_of_exporter
FROM baci_hs17_23;


# TOTAL AMOUNT TRADE FLOW BY EXPORTER
SELECT
	country_codes.country_name_full,
    CEIL(SUM(baci_hs17_23.value_)) summary
FROM baci_hs17_23
JOIN country_codes
	ON baci_hs17_23.exporter = country_codes.country_code
GROUP BY 1
ORDER BY summary DESC, country_name_full;

# TOP 10 MOST EXPANSIVE PRODUCT (WITH THEIR NAME)
SELECT
	b.product_category,
    p.description,
    CEIL(b.value_) as value1_
FROM baci_hs17_23 b
JOIN product_codes p
	ON b.product_category = p.code
ORDER BY b.value_ DESC
LIMIT 10;

# TOP 5 MOST EXPANSIVE PRODUCTS EXPORTED BY EACH COUNTRY
/*
SELECT
	b.product_category,
    c.country_name_full,
    CEIL(b.value_),
    RANK () OVER (PARTITION BY c.country_name_full ORDER BY CEIL(b.value_)) as rank_num,
    p.description
FROM baci_hs17_23 b
JOIN product_codes p
	ON b.product_category = p.code
JOIN country_codes c
	ON b.exporter = c.country_code
*/

# RANKING COUNTRY BY TOTAL AMOUNT OF PRODUCTS EXPORTED
# (issue : rank by ascending order instead of desc order) Issue cleared : by adding DESC after SUM(CEIL...)) in ROW_NUMBER/DENSE...
SELECT
	c.country_name_full,
    SUM(CEIL(b.value_)) as sum_value1_,
    RANK() OVER (ORDER BY SUM(CEIL(b.value_))DESC) as rank_value,
    ROW_NUMBER() OVER (ORDER BY SUM(CEIL(b.value_))DESC) as row_num,
    DENSE_RANK() OVER (ORDER BY SUM(CEIL(b.value_))DESC) as dense_num
FROM baci_hs17_23 b
JOIN country_codes c
	ON b.exporter = c.country_code
GROUP BY c.country_name_full;

# RANKING COUNTRY BY TOTAL AMOUNT OF PRODUCTS EXPORTED WITHIN THEIR RESCPECTIVE COUNTRY
#Fail 
/*
SELECT
	c.country_name_full,
    p.description,
    p.code,
	SUM(CEIL(b.value_)),
    RANK() OVER(ORDER BY SUM(CEIL(b.value_))) #DESC needed here
FROM baci_hs17_23 b
JOIN product_codes p
	ON b.product_category = p.code
JOIN country_codes c
	ON b.exporter = c.country_code
GROUP BY 1,2,3;
#ORDER BY SUM(CEIL(b.value_)) DESC
*/
CREATE TEMPORARY TABLE ranked_results2
SELECT
	c.country_name_full,
    p.description,
    p.code,
	SUM(CEIL(b.value_)),
    RANK() OVER(PARTITION BY c.country_name_full ORDER BY SUM(CEIL(b.value_))DESC) 
FROM baci_hs17_23 b
JOIN product_codes p
	ON b.product_category = p.code
JOIN country_codes c
	ON b.exporter = c.country_code
GROUP BY 1,2,3;

SELECT *
FROM ranked_results2;

# TOP 3 MOST EXPORTED PRODUCTS BY EXPORTER (COUNTRY) WITHE USE OF TEMP TABLE : ranked_results2
SELECT
	ranked_results2.ccnf,
    ranked_results2.pd,
    ranked_results2.pc,
    ranked_results2.sum_value,
	ranked_results2.ranking
FROM ranked_results2
WHERE ranking <= 3






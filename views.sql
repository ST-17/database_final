CREATE TABLE final_view(max_customer_nbr NOT NULL);
INSERT INTO final_view SELECT MAX(avg)
FROM ( SElECT n_name, count( DISTINCT c_custkey) AS avg
FROM nation,customer WHERE c_nationkey=n_nationkey
GROUP BY n_name 
ORDER BY n_name);
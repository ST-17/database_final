SELECT n_name
FROM( SElECT n_name, count( DISTINCT c_custkey) AS number
FROM nation,customer,final_view WHERE c_nationkey=n_nationkey
GROUP BY n_name HAVING number=max_customer_nbr
ORDER BY n_name);
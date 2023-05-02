SElECT n_name AS countries, count( DISTINCT c_custkey) AS avg
FROM nation,customer
WHERE c_nationkey=n_nationkey
GROUP BY n_name HAVING avg=(SELECT MAX(didi)
FROM ( SElECT n_name, count( DISTINCT c_custkey) AS didi
FROM nation,customer
WHERE c_nationkey=n_nationkey
GROUP BY n_name 
ORDER BY n_name)
ORDER BY n_name);
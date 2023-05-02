CREATE TRIGGER trigger1
AFTER DELETE ON customer
FOR EACH ROW 
BEGIN
UPDATE final_view SET max_customer_nbr=(SELECT MAX(avg)
FROM ( SElECT n_name, count( DISTINCT c_custkey) AS avg
FROM nation,customer
WHERE c_nationkey=n_nationkey
GROUP BY n_name 
ORDER BY n_name));
END;
    
CREATE TRIGGER trigger2
AFTER UPDATE ON customer
FOR EACH ROW 
BEGIN
UPDATE final_view SET max_customer_nbr=(SELECT MAX(avg)
FROM ( SElECT n_name, count( DISTINCT c_custkey) AS avg
FROM nation,customer
WHERE c_nationkey=n_nationkey
GROUP BY n_name 
ORDER BY n_name));
END;

CREATE TRIGGER trigger3
AFTER INSERT ON customer
FOR EACH ROW 
BEGIN
UPDATE final_view SET max_customer_nbr=(SELECT MAX(avg)
FROM ( SElECT n_name, count( DISTINCT c_custkey) AS avg
FROM nation,customer
WHERE c_nationkey=n_nationkey
GROUP BY n_name 
ORDER BY n_name));
END;
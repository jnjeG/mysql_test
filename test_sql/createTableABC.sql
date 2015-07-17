##inner join 测试
SELECT * FROM `a` 
INNER JOIN `b` ON a.`aID`=b.`bID`
INNER JOIN `c` ON b.`bID`=c.`cID`

##right join 测试
SELECT * FROM a
RIGHT JOIN b ON a.`aID`=b.`bID`
RIGHT JOIN c ON b.`bID` = c.`cID` AND  b.`bName`=c.`cAddress`;


##on语句后面多个条件
SELECT * FROM (SELECT * FROM a
LEFT JOIN b ON a.`aID`=b.`bID`
WHERE b.`bID` IS NOT NULL ) AS ab
LEFT JOIN c ON ab.`bID` = c.`cID` AND ab.`bName`=c.`cAddress` 
WHERE b.`bName`="c001" OR c.`cID` IS NULL
AND a.`aID` <> 5 AND b.`bID` IS NOT NULL;


##left join 左表产生多条重复记录的情况(这个条件 RIGHT JOIN c ON abc.`bId` <> c.`cID`)
SELECT * FROM (
SELECT *,SUM(bID) AS bIdCount FROM (
SELECT * FROM a
RIGHT JOIN c 
ON c.`cID` = a.`aID`
WHERE c.`cID` <> 9) ac
LEFT JOIN b ON ac.`cID` <> b.`bID`
GROUP BY ac.`cID`
HAVING AVG(bID) > 4
ORDER BY ac.`cID` DESC
LIMIT 4
) AS abc 
RIGHT JOIN c ON abc.`bId` <> c.`cID`
WHERE abc.`cAddress` IS NOT NULL;



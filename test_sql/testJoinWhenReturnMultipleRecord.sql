##左表join右表的时候,左表的记录的字段数据固定,但右表满足条件的记录有多条
##################################################


###编号1和编号2的sql执行后返回的结果不一样
###文章 http://xianglp.iteye.com/blog/868957 说编号1的执行和编号3的执行是差不多的

##编号1
SELECT * FROM a
LEFT JOIN b ON a.`aID`=b.`bID`
LEFT JOIN c ON a.`aID` = c.`cID` AND c.`cAddress` <> "c005" AND c.`cAddress` <> "c0055"


##编号2
SELECT * FROM a
LEFT JOIN b ON a.`aID`=b.`bID`
LEFT JOIN c ON a.`aID` = c.`cID` 
WHERE c.`cAddress` NOT IN ("c005","c0055") 


##编号3
SELECT * FROM a
LEFT JOIN b ON a.`aID`=b.`bID`
LEFT JOIN (SELECT * FROM c  WHERE c.`cAddress` <> "c005" AND c.`cAddress` <> "c0055") AS sc  ON a.`aID` = sc.`cID`


###注意如果'(SELECT * FROM c  LIMIT 2) AS sc' 里面如果有limit 的情况,开发过程中要注意是否有limit的情况,如果有,查询的结果可能会不准确
SELECT * FROM a
LEFT JOIN b ON a.`aID`=b.`bID`
LEFT JOIN (SELECT * FROM c  LIMIT 2) AS sc  ON a.`aID` = sc.`cID`  

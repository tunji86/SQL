--Below is how we write select startements with all clauses
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY

--Below is the order in which the SQL engine execute the clauses
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
--A consequence of this is that the Alias feature for columns can't be used other than 
--with ORDER BY clauses


--USING ALIAS IN SELECT STATEMENTS
SELECT FirstName, LastName as [Customer Last Name]
from HumanResources.vEmployee;


select Column1, Column2,.... ColumnN
From SchemaName.tableName
Where ColumnName {Comparison Operator} [Filtering Criteria]
Order By ColumnName, ColumnOrdinal, ColumnAlias [ASC/DESC]
--ASC is the default. We have to specify DESC if we want it

select BusinessEntityID, FirstName, LastName, EmailPromotion 
from HumanResources.vEmployee
where EmailPromotion <2
order by EmailPromotion, BusinessEntityID --we can use the ordnun of the coulumns here instead. That is 
--the column positions in the select statement. In this case "Order By 4,1"

Select LastName, FirstName,salesQuota
From Sales.vSalesPerson
Where SalesQuota >=250000
Order By SalesQuota ASC, LastName DESC






